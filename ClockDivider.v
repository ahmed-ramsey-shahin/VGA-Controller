`timescale 1ns/1ps

module ClockDivider #(parameter COUNTER_END_VALUE=5) (
    input clk, reset_n,
    output clk_div
);
    wire [$clog2(COUNTER_END_VALUE):0] q;
    
    Counter #($clog2(COUNTER_END_VALUE) + 1) counter (
        .clk(clk),
        .reset_n(reset_n),
        .q(q)
    );

    DFlipFlop dff (
        .clk(clk),
        .reset_n(reset_n),
        .q(clk_div),
        .d(~clk_div),
        .en((q == COUNTER_END_VALUE))
    );
endmodule
