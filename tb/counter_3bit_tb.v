`timescale 1ns / 1ps

module counter_3bit_tb;

    reg clk;
    reg rstn;

    wire [2:0] count;

    counter_3bit dut(
        .clk(clk),
        .rstn(rstn),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        rstn = 0;

        #12;
        rstn = 1;

        #100;

        rstn = 0;

        #10;

        rstn = 1;

        #40;

        $finish;

    end

endmodule


