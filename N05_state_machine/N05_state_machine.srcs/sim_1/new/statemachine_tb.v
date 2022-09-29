`timescale 1ns / 1ps


module statemachine_tb();

reg rst,clk,x;
wire [1:0] state;
wire y; 

statemachine uut ( .clk(clk), .rst(rst), .x(x), .state(state), .y(y));
 
always begin
    #5 clk <= ~clk;
end

always begin
    #1.2 x = ~x;
 end

initial begin
    clk <=0;
    rst <=1;
    x  <= 0;
    #1 rst <=0;
    #1 rst <=1;
    #100
    $stop;
    end
    
    
endmodule
