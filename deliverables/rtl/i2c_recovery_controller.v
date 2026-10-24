module i2c_recovery_controller #(
    parameter TIMEOUT_LIMIT = 100,
    parameter HALF_PERIOD   = 5
)(
    input  wire clk,
    input  wire rst_n,
    input  wire enable,
    input  wire sda_in,
    input  wire scl_in,

    output reg  scl_release,
    output reg  sda_release,
    output reg  recovery_done,
    output reg  fault,
    output reg  busy
);

    localparam IDLE     = 3'd0;
    localparam MONITOR  = 3'd1;
    localparam RECOVER  = 3'd2;
    localparam VERIFY   = 3'd3;
    localparam FAILED   = 3'd4;

    reg [2:0] state;
    localparam TIMEOUT_WIDTH = (TIMEOUT_LIMIT > 1) ? $clog2(TIMEOUT_LIMIT) : 1;
    reg [TIMEOUT_WIDTH-1:0] timeout_count;
    reg [3:0] pulse_count;
    localparam HALF_WIDTH = (HALF_PERIOD > 1) ? $clog2(HALF_PERIOD) : 1;
    reg [HALF_WIDTH-1:0] half_count;
    reg scl_phase;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state         <= IDLE;
            timeout_count <= 0;
            pulse_count   <= 0;
            half_count    <= 0;
            scl_phase     <= 0;
            scl_release   <= 1'b1;
            sda_release   <= 1'b1;
            recovery_done <= 1'b0;
            fault         <= 1'b0;
            busy          <= 1'b0;
        end else begin
            recovery_done <= 1'b0;

            case (state)
                IDLE: begin
                    scl_release   <= 1'b1;
                    sda_release   <= 1'b1;
                    timeout_count <= 0;
                    pulse_count   <= 0;
                    half_count    <= 0;
                    scl_phase     <= 0;
                    fault         <= 1'b0;
                    busy          <= 1'b0;

                    if (enable)
                        state <= MONITOR;
                end

                MONITOR: begin
                    scl_release <= 1'b1;
                    sda_release <= 1'b1;
                    busy        <= 1'b0;

                    if (!enable) begin
                        timeout_count <= 0;
                        state <= IDLE;
                    end else if (!sda_in) begin
                        if (timeout_count >= TIMEOUT_LIMIT - 1) begin
                            timeout_count <= 0;
                            pulse_count   <= 0;
                            half_count    <= 0;
                            scl_phase     <= 0;
                            busy          <= 1'b1;
                            state         <= RECOVER;
                        end else begin
                            timeout_count <= timeout_count + 1;
                        end
                    end else begin
                        timeout_count <= 0;
                    end
                end

                RECOVER: begin
                    busy        <= 1'b1;
                    sda_release <= 1'b1;

                    if (!enable) begin
                        scl_release <= 1'b1;
                        state       <= IDLE;
                        busy        <= 1'b0;
                    end else if (!scl_in) begin
                        scl_release <= 1'b1;
                        fault       <= 1'b1;
                        state       <= FAILED;
                    end else if (sda_in) begin
                        scl_release <= 1'b1;
                        state       <= VERIFY;
                    end else if (half_count >= HALF_PERIOD - 1) begin
                        half_count <= 0;

                        if (!scl_phase) begin
                            scl_release <= 1'b0;
                            scl_phase   <= 1'b1;
                        end else begin
                            scl_release <= 1'b1;
                            scl_phase   <= 1'b0;
                            pulse_count <= pulse_count + 1'b1;

                            if (pulse_count == 4'd8)
                                state <= VERIFY;
                        end
                    end else begin
                        half_count <= half_count + 1;
                    end
                end

                VERIFY: begin
                    scl_release <= 1'b1;
                    sda_release <= 1'b1;
                    busy        <= 1'b0;

                    if (sda_in && scl_in) begin
                        recovery_done <= 1'b1;
                        timeout_count <= 0;
                        state         <= MONITOR;
                    end else begin
                        fault <= 1'b1;
                        state <= FAILED;
                    end
                end

                FAILED: begin
                    scl_release <= 1'b1;
                    sda_release <= 1'b1;
                    busy        <= 1'b0;
                    fault       <= 1'b1;

                    if (!enable)
                        state <= IDLE;
                end

                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
