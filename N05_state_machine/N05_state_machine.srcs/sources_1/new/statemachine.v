`timescale 1ns / 1ps

module statemachine(
input clk,rst,x,
output reg [1:0] state,
output reg y
    );
    
    reg [1:0] n_state;
    
 always @(posedge clk or negedge rst) begin
    if(!rst)
        state <= 2'b00;
    else
        state <= n_state;
 end
    
    
 always @(*) begin
        case(state)
            2'b00: n_state = x? 2'b01 : 2'b00;
            2'b01: n_state = x? 2'b11 : 2'b00;
            2'b10: n_state = x? 2'b10 : 2'b00;
            2'b11: n_state = x? 2'b10 : 2'b00;
        endcase
 end 
 
 always @(*) begin
        case(state)
            2'b00: y = 1'b0;
            2'b01: y = x? 1'b0 : 1'b1;
            2'b10: y = x? 1'b0 : 1'b1;
            2'b11: y = x? 1'b0 : 1'b1;
        endcase
end
 endmodule
