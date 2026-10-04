`timescale 1ns / 1ps

module counter_3bit(
    input  wire clk,
    input  wire rstn,
    output wire [2:0] count
);

    wire T0;
    wire T1;
    wire T2;

    assign T0 = 1'b1;
    assign T1 = count[0];
    assign T2 = count[1] & count[0];

    t_flipflop TFF0(
        .clk(clk),
        .rstn(rstn),
        .T(T0),
        .Q(count[0])
    );

    t_flipflop TFF1(
        .clk(clk),
        .rstn(rstn),
        .T(T1),
        .Q(count[1])
    );

    t_flipflop TFF2(
        .clk(clk),
        .rstn(rstn),
        .T(T2),
        .Q(count[2])
    );

endmodule


