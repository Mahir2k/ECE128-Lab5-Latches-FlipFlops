`timescale 1ns / 1ps

module sr_flipflop_tb;

    reg S;
    reg R;
    reg clk;

    wire Q;
    wire Qbar;

    sr_flipflop dut(
        .S(S),
        .R(R),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );

    // 10 ns clock period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        // Set
        S = 1;
        R = 0;
        #20;

        // Hold
        S = 0;
        R = 0;
        #20;

        // Reset
        S = 0;
        R = 1;
        #20;

        // Hold
        S = 0;
        R = 0;
        #20;

        // Set again
        S = 1;
        R = 0;
        #20;

        $finish;

    end

endmodule


