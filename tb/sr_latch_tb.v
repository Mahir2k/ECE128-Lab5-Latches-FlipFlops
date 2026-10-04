`timescale 1ns / 1ps

module sr_latch_tb;

    reg S;
    reg R;

    wire Q;
    wire Qbar;

    sr_latch dut(
        .S(S),
        .R(R),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin

        // Reset
        S = 0;
        R = 1;
        #20;

        // Hold
        S = 0;
        R = 0;
        #20;

        // Set
        S = 1;
        R = 0;
        #20;

        // Hold
        S = 0;
        R = 0;
        #20;

        // Invalid condition
        S = 1;
        R = 1;
        #20;

        // Recover by resetting
        S = 0;
        R = 1;
        #20;

        // Hold
        S = 0;
        R = 0;
        #20;

        $finish;

    end

endmodule


