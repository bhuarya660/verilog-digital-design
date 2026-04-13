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
module ASYNC_UP_COUNTER(clk, Q2, Q1, Q0);
    input clk;
    output Q2, Q1, Q0;
    wire q0, q1;
    
    not n1(q0, Q0);
    not n(q1, Q1);
    
    
    JK_FF FF0(clk, 1'b1, 1'b1, Q0);
    JK_FF FF1(q0, 1'b1, 1'b1, Q1);
    JK_FF FF2(q1, 1'b1, 1'b1, Q2);
endmodule
