`timescale 1ns / 1ps

module sr_latch(
    input  wire S,
    input  wire R,
    output wire Q,
    output wire Qbar
);

    nor N1(Q,    R, Qbar);
    nor N2(Qbar, S, Q);

endmodule

