`timescale 1ns/1ps

module i2c_recovery_tb;

    reg clk, rst_n, enable, sda_in, scl_in;
    wire scl_release, sda_release;
    wire recovery_done, fault, busy;

    integer errors;
    integer falling_edges;
    reg prev_scl_release;

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

    // Count transitions when the controller pulls SCL low.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prev_scl_release <= 1'b1;
            falling_edges <= 0;
        end else begin
            if (busy && prev_scl_release && !scl_release)
                falling_edges <= falling_edges + 1;
            prev_scl_release <= scl_release;
        end
    end

    task reset_test;
        begin
            @(negedge clk);
            rst_n = 0;
            enable = 0;
            sda_in = 1;
            scl_in = 1;
            repeat (3) @(negedge clk);
            rst_n = 1;
            enable = 1;
            repeat (3) @(negedge clk);
        end
    endtask

    initial begin
        $dumpfile("sim/i2c_recovery.vcd");
        $dumpvars(0, i2c_recovery_tb);

        clk = 0;
        rst_n = 0;
        enable = 0;
        sda_in = 1;
        scl_in = 1;
        errors = 0;
        falling_edges = 0;

        $display("TEST 1: Reset and normal idle");
        reset_test();

        if (!fault)
            $display("PASS: Normal idle");
        else begin
            $display("FAIL: Unexpected idle fault");
            errors = errors + 1;
        end

        $display("TEST 2: SDA releases during recovery");
        sda_in = 0;
        wait (busy);
        repeat (12) @(negedge clk);
        sda_in = 1;
        wait (recovery_done || fault);
        @(negedge clk);

        if (recovery_done && !fault)
            $display("PASS: Early recovery success");
        else begin
            $display("FAIL: Early recovery");
            errors = errors + 1;
        end

        $display("TEST 3: SDA remains stuck after nine pulses");
        reset_test();
        falling_edges = 0;
        sda_in = 0;
        wait (fault || recovery_done);
        @(negedge clk);

        if (fault && !recovery_done) begin
            $display("PASS: Stuck SDA reports fault");
        end else begin
            $display("FAIL: Stuck SDA fault handling");
            errors = errors + 1;
        end

        $display("SCL falling edges observed: %0d", falling_edges);

        $display("TEST 4: SCL stuck low");
        reset_test();
        scl_in = 0;
        sda_in = 0;
        wait (busy);
        wait (fault);
        @(negedge clk);

        if (fault)
            $display("PASS: SCL stuck-low fault detected");
        else begin
            $display("FAIL: SCL stuck-low detection");
            errors = errors + 1;
        end

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TESTS FAILED: %0d error(s)", errors);

        $finish;
    end

    initial begin
        #50000;
        $display("FAIL: Simulation timeout");
        $finish;
    end

endmodule
