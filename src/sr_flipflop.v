`timescale 1ns / 1ps

module sr_flipflop(
    input  wire S,
    input  wire R,
    input  wire clk,
    output reg  Q,
    output wire Qbar
);

    assign Qbar = ~Q;

    always @(posedge clk) begin

        case ({S, R})

            2'b00: Q <= Q;       // Hold
            2'b01: Q <= 1'b0;    // Reset
            2'b10: Q <= 1'b1;    // Set
            2'b11: Q <= 1'bx;    // Invalid

        endcase

    end

endmodule


