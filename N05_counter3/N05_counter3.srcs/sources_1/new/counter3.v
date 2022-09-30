`timescale 1ns / 1ps
module counter3 (
input clk,rst,x, 
output reg [2:0] state);

reg y;
reg x_reg,x_trig;

always @(negedge rst or posedge clk) begin
    if(!rst) begin
        {x_reg,x_trig} <=2'b00;
    end
    else begin
        x_reg <= x;
        x_trig <=x & ~x_reg;
    end
end

always @(negedge rst or posedge clk) begin
    if(!rst) begin state <= 2'b00;
    y <=1'b0;
    end
    else if (y == 1'b0) begin
        case(state)
            3'b000 : state <= x_trig ? 3'b001 : 3'b000;
            3'b001 : state <= x_trig ? 3'b010 : 3'b001;
            3'b010 : state <= x_trig ? 3'b011 : 3'b010;
            3'b011 : state <= x_trig ? 3'b100 : 3'b011;
            3'b100 : state <= x_trig ? 3'b101 : 3'b100;
            3'b101 : state <= x_trig ? 3'b110 : 3'b101;
            3'b110 : state <= x_trig ? 3'b111 : 3'b110;
            3'b111 : y <= 1'b1;
       endcase
       end
    else if (y == 1'b1) begin
    case(state)
            3'b000 : y <= 1'b0;
            3'b001 : state <= x_trig ? 3'b000 : 3'b001;
            3'b010 : state <= x_trig ? 3'b001 : 3'b010;
            3'b011 : state <= x_trig ? 3'b010 : 3'b011;
            3'b100 : state <= x_trig ? 3'b011 : 3'b100;
            3'b101 : state <= x_trig ? 3'b100 : 3'b101;
            3'b110 : state <= x_trig ? 3'b101 : 3'b110;
            3'b111 : state <= x_trig ? 3'b110 : 3'b111;
       endcase
       end
 end   

endmodule