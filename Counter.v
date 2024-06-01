`timescale 1ns/1ps

module Counter #(parameter MAX_VALUE=255) (
    input clk, async_reset_n,
    input sync_reset_n,
    output reg [$clog2(MAX_VALUE+1)-1:0] q
);
    always @(posedge clk, negedge async_reset_n) begin
        if(~async_reset_n) begin
            q <= 'd0;
        end
        else begin
            if(~sync_reset_n) begin
                q <= 'd0;
            end
            else begin
                q <= q + 'd1;
            end
        end
    end
endmodule
