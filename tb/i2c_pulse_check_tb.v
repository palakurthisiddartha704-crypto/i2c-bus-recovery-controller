`timescale 1ns/1ps

module i2c_pulse_check_tb;
    reg clk = 0;
    reg rst_n = 0;
    reg enable = 0;
    reg sda_in = 1;
    reg scl_in = 1;

    wire scl_release, sda_release;
    wire recovery_done, fault, busy;

    integer falling_edges = 0;
    integer rising_edges = 0;
    integer errors = 0;
    integer low_cycles = 0;
    integer high_cycles = 0;
    integer last_fall_cycle = -1;
    integer last_rise_cycle = -1;
    integer cycle_count = 0;
    reg previous_scl = 1;
    reg measuring = 0;

    i2c_recovery_controller #(
        .TIMEOUT_LIMIT(10),
        .HALF_PERIOD(2)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .sda_in(sda_in),
        .scl_in(scl_in),
        .scl_release(scl_release),
        .sda_release(sda_release),
        .recovery_done(recovery_done),
        .fault(fault),
        .busy(busy)
    );

    always #5 clk = ~clk;

    always @(negedge clk) begin
        if (!rst_n) begin
            previous_scl = scl_release;
            cycle_count = 0;
        end else begin
            cycle_count = cycle_count + 1;

            if (measuring) begin
                if (previous_scl && !scl_release) begin
                    falling_edges = falling_edges + 1;
                    last_fall_cycle = cycle_count;
                    if (last_rise_cycle >= 0) begin
                        high_cycles = cycle_count - last_rise_cycle;
                        if (high_cycles != 2) begin
                            $display("FAIL: SCL high duration = %0d cycles; expected 2", high_cycles);
                            errors = errors + 1;
                        end
                    end
                end

                if (!previous_scl && scl_release) begin
                    rising_edges = rising_edges + 1;
                    last_rise_cycle = cycle_count;
                    low_cycles = cycle_count - last_fall_cycle;
                    if (low_cycles != 2) begin
                        $display("FAIL: SCL low duration = %0d cycles; expected 2", low_cycles);
                        errors = errors + 1;
                    end
                end
            end

            previous_scl = scl_release;
        end
    end

    initial begin
        $display("TEST: Nine-pulse count and SCL half-period timing");

        repeat (3) @(negedge clk);
        rst_n = 1;
        enable = 1;
        repeat (3) @(negedge clk);

        sda_in = 0;
        wait (busy);
        @(negedge clk);
        measuring = 1;
        previous_scl = scl_release;

        wait (fault || recovery_done);
        @(negedge clk);
        measuring = 0;

        $display("Falling edges: %0d", falling_edges);
        $display("Rising edges : %0d", rising_edges);
        $display("Last low duration : %0d cycles", low_cycles);
        $display("Last high duration: %0d cycles", high_cycles);
        $display("SCL released: %0b", scl_release);
        $display("Fault: %0b, Recovery done: %0b", fault, recovery_done);

        if (falling_edges != 9) begin
            $display("FAIL: Expected exactly 9 falling edges");
            errors = errors + 1;
        end

        if (rising_edges != 9) begin
            $display("FAIL: Expected exactly 9 rising edges");
            errors = errors + 1;
        end

        if (!scl_release) begin
            $display("FAIL: SCL was not released at termination");
            errors = errors + 1;
        end

        if (!fault || recovery_done) begin
            $display("FAIL: Stuck SDA should end in fault");
            errors = errors + 1;
        end

        if (errors == 0)
            $display("PULSE CHECK PASSED");
        else
            $display("PULSE CHECK FAILED: %0d error(s)", errors);

        $finish;
    end

    initial begin
        #10000;
        $display("FAIL: Pulse test timed out");
        $finish;
    end
endmodule
