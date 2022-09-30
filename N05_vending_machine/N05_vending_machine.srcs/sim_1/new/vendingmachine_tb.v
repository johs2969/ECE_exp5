`timescale 1ns / 1ps


module vendingmachine_tb();
reg clk,rst,A,B,C;
wire [2:0] state;
wire y;

vendingmachine u1 ( .clk(clk), .rst(rst), .A(A), .B(B), .C(C), .state(state), .y(y));

always begin
    #1 clk <= ~clk;
 end

initial begin
    clk <=0;
    rst <=1;
    #5 rst <=0;
    #5 rst <=1;
    {A,B,C} =3'b100;
    #20.2 {A,B,C} =3'b010;
    #20.2 {A,B,C} =3'b100;
    #20.2 {A,B,C} =3'b010;
    #20.2 {A,B,C} =3'b001;
    #5 rst <=0;
    #5 rst <=1;
    #20.2 {A,B,C} =3'b100; 
    #20.2 {A,B,C} =3'b010;
    #20.2 {A,B,C} =3'b001;
    #20;
    $stop;

    end
   
endmodule
