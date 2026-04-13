`timescale 1ns/1ps
module TB_Async_Down_Counter();
    reg clk;
    wire Q2, Q1, Q0;
    
    ASYNC_DOWN_COUNTER counter(clk, Q2, Q1, Q0);
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        $monitor("count = %d", {Q2, Q1, Q0});
        #180 $finish;
    end
endmodule
