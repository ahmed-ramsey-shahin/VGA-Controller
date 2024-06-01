`timescale 1ns/1ps

module DFlipFlop(
    input clk, reset_n,
    input en, d,
    output reg q
);
    always @(posedge clk, negedge reset_n) begin
        if(~reset_n) begin
            q <= 1'b0;
        end
        else begin
            if(en) begin
                q <= d;
            end
        end
    end
endmodule
