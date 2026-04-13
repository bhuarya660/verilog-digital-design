`timescale 1ns/1ps
module TB_Counter();
    reg clk;
    wire [2:0] Q;
    
    UpCounter_3Bit counter(clk, Q);
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        $monitor("count = %d", Q);
        #160 $finish;
    end
endmodule
