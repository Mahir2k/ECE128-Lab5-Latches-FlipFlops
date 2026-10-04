`timescale 1ns / 1ps

module clock_divider_tb;

    reg clock_in;

    wire clock_out;

    clock_divider dut(
        .clock_in(clock_in),
        .clock_out(clock_out)
    );

    // 100 MHz input clock
    // Period = 10 ns
    initial begin
        clock_in = 0;
        forever #5 clock_in = ~clock_in;
    end

    initial begin

        #200;
        $finish;

    end

endmodule


