`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 12:21:11 AM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;

reg [3:0] in;
wire [1:0] out;

adder add_inst(
    .a(in[0]),
    .b(in[1]),
    .c(in[2]),
    .result(out[0]),
    .carry_out(out[1])
);


initial begin 
    
    for (in = 0; in < 8; in = in + 1) begin
    
        #10
        
        $display("Input: 0x%h Output: 0x%h", in, out);
        
        if (out == in[0] + in[1] + in[2]) begin
            $display("Test %d passed", in);
        end
    end
end
endmodule
