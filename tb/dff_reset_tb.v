`timescale 1ns / 1ps

module dff_reset_tb;

    reg d;
    reg clk;
    reg rstn;

    wire q_sync;
    wire q_async;

    dff_sync_reset sync_dff(
        .d(d),
        .clk(clk),
        .rstn(rstn),
        .q(q_sync)
    );

    dff_async_reset async_dff(
        .d(d),
        .clk(clk),
        .rstn(rstn),
        .q(q_async)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        // Start in reset
        d = 0;
        rstn = 0;

        #7;

        // Release reset
        rstn = 1;
        d = 1;

        #11;

        // Assert reset BETWEEN clock edges
        rstn = 0;

        #10;

        // Release reset
        rstn = 1;
        d = 0;

        #10;

        d = 1;

        #20;

        $finish;

    end

endmodule


