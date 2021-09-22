`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2021 22:38:50
// Design Name: 
// Module Name: adder4
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


module adder4(
    input  [3:0]         a,
    input  [3:0]         b,
    input         carry_in,
    output [3:0]    result,
    output       carry_out
);

wire c1, c2, c3;

adder a1(.a(a[0]), .b(b[0]), .c(carry_in), .result(result[0]),        .carry_out(c1));
adder a2(.a(a[1]), .b(b[1]),       .c(c1), .result(result[1]),        .carry_out(c2));
adder a3(.a(a[2]), .b(b[2]),       .c(c2), .result(result[2]),        .carry_out(c3));
adder a4(.a(a[3]), .b(b[3]),       .c(c3), .result(result[3]), .carry_out(carry_out));

endmodule
