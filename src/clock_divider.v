`timescale 1ns / 1ps

module clock_divider(
    input  wire clock_in,
    output reg  clock_out = 1'b0
);

    reg [1:0] counter = 2'd0;

    always @(posedge clock_in) begin

        counter <= counter + 1'b1;

        if (counter == 2'b01) begin

            clock_out <= ~clock_out;
            counter <= 2'd0;

        end

    end

endmodule


