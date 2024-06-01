`timescale 1ns/1ps

module Controller(
    input clk, reset_n,
    output hs, vs,
    output reg r, g, b
);
    wire pixel_clk;
    wire [$clog2(800)-1:0] h_cnt;
    wire [$clog2(525)-1:0] v_cnt;
    wire v_counter_clk = (h_cnt == 'd799);

    ClockDivider divider (clk, reset_n, pixel_clk);
    Counter #(799) hCounter (pixel_clk, reset_n, ~v_counter_clk, h_cnt);
    Counter #(524) vCounter (v_counter_clk, reset_n, ~(v_cnt == 'd524), v_cnt);

    always @(*) begin
        if(h_cnt >= 'd144 & h_cnt < 'd784 & v_cnt >= 'd35 & v_cnt < 'd515) begin
            if(h_cnt > 'd464) begin
                r = 1'b1;
                g = 1'b0;
                b = 1'b0;
            end
            else begin
                r = 1'b0;
                g = 1'b1;
                b = 1'b0;
            end
        end
        else begin
            r = 1'b0;
            g = 1'b0;
            b = 1'b0;
        end
    end

    assign hs = (h_cnt > 'd96);
    assign vs = (v_cnt > 'd2);
endmodule
