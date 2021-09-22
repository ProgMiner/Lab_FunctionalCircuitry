`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 01:16:07 AM
// Design Name: 
// Module Name: adder4_tb
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


module adder4_tb;

reg [9:0] in;
wire [4:0] out;

adder4 add_inst(
    .a(in[3:0]),
    .b(in[7:4]),
    .carry_in(in[8]),
    .result(out[3:0]),
    .carry_out(out[4])
);

integer i;

initial begin 
    
    for (i = 0; i < 512; i = i + 1) begin
        in = i;
        
        #100
        
        if (out != in[3:0] + in[7:4] + in[8]) begin
            $display("Input: 0x%h Output: 0x%h Expected: 0x%h", in, out, in[3:0] + in[7:4] + in[8]);
            $display("Test %d failed", in);
        end
    end
end
endmodule
