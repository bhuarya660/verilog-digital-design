`timescale 1ns/1ps
module JK_FF(clk, J, K, Q);
    input clk, J, K;
    output reg Q = 0;
    
    always @(posedge clk) begin
        case({J,K})
            2'b00: Q <= Q;
            2'b01: Q <= 1'b0;
            2'b10: Q <= 1'b1;
            2'b11: Q <= ~Q;
        endcase
    end
endmodule

module UpCounter_3Bit(clk, Q);
    input clk;
    output [2:0] Q;
    wire q;
    
    and a(q, Q[1], Q[0]);
    
    JK_FF FF0(clk, 1'b1, 1'b1, Q[0]);
    JK_FF FF1(clk, Q[0], Q[0], Q[1]);
    JK_FF FF2(clk, q, q, Q[2]);
endmodule
