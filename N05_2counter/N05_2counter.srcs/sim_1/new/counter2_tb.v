`timescale 1ns / 1ps

module counter2_tb();
reg clk,rst,x;
wire [1:0] state;

counter2 uut(.clk(clk), .rst(rst), .x(x), .state(state));

always begin
    #1 clk <=~clk;
    end
    
initial begin
    clk <=0;
    rst <=1;
    #5 rst <=0;
    #5 rst <=1;
    x =1;
    #20 x=0;
    #20 x=1;
    #20 x=0;
    #20 x=1;
    #20 x=0;
    #20 x=1;
    #20 x=0;
    #20 x=1;
    #5;
    $stop;
end
        
endmodule
