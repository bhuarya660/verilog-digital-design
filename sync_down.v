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
module DownCounter_3Bit(clk, Q);
    input clk;
    output [2:0] Q;
    wire q;
    wire q0_bar, q1_bar;
    
    not n0(q0_bar, Q[0]);
    not n1(q1_bar, Q[1]);
    and a(q, q1_bar, q0_bar);
    
    // Assumes JK_FF module is already defined (from Section 9)
    JK_FF FF0(clk, 1'b1, 1'b1, Q[0]);
    JK_FF FF1(clk, q0_bar, q0_bar, Q[1]);
    JK_FF FF2(clk, q, q, Q[2]);
endmodule
