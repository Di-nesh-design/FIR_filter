`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 19:31:32
// Design Name: 
// Module Name: fir
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fir_filter(
input clk,
input rst,
input signed [7:0] x,
output reg signed [23:0] y
);

parameter signed h0 = 2;
parameter signed h1 = 11;
parameter signed h2 = 30;
parameter signed h3 = 42;
parameter signed h4 = 30;
parameter signed h5 = 11;
parameter signed h6 = 2;
parameter signed h7 = 0;

reg signed [7:0] delay0;
reg signed [7:0] delay1;
reg signed [7:0] delay2;
reg signed [7:0] delay3;
reg signed [7:0] delay4;
reg signed [7:0] delay5;
reg signed [7:0] delay6;
reg signed [7:0] delay7;

always @(posedge clk)
begin

if(rst)
begin
delay0<=0;
delay1<=0;
delay2<=0;
delay3<=0;
delay4<=0;
delay5<=0;
delay6<=0;
delay7<=0;
end

else
begin

delay7<=delay6;
delay6<=delay5;
delay5<=delay4;
delay4<=delay3;
delay3<=delay2;
delay2<=delay1;
delay1<=delay0;
delay0<=x;

y<= delay0*h0+
    delay1*h1+
    delay2*h2+
    delay3*h3+
    delay4*h4+
    delay5*h5+
    delay6*h6+
    delay7*h7;

end

end

endmodule