`timescale 1ns / 1ps

module dff_sync_reset(
    input  wire d,
    input  wire clk,
    input  wire rstn,
    output reg  q
);

    always @(posedge clk) begin

        if (!rstn)
            q <= 1'b0;
        else
            q <= d;

    end

endmodule


