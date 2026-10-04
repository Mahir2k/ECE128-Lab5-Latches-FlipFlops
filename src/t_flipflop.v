`timescale 1ns / 1ps

module t_flipflop(
    input  wire clk,
    input  wire rstn,
    input  wire T,
    output reg  Q
);

    always @(posedge clk) begin

        if (!rstn)
            Q <= 1'b0;

        else if (T)
            Q <= ~Q;

        else
            Q <= Q;

    end

endmodule


