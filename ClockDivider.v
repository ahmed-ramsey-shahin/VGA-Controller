`timescale 1ns/1ps

module ClockDivider (
    input clk, reset_n,
    output clk_div
);
    DFlipFlop dff (
        .clk(clk),
        .reset_n(reset_n),
        .q(clk_div),
        .d(~clk_div),
        .en(1'b1)
    );
endmodule
