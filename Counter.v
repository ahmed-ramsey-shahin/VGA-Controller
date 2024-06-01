`timescale 1ns/1ps

module Counter #(parameter N = 8) (
    input reset_n, clk,
    output reg [N-1:0] q
);
    always @(posedge clk, negedge reset_n) begin
        if(~reset_n) begin
            q <= 0;
        end
        else begin
            q <= q + 'h1;
        end
    end
endmodule
