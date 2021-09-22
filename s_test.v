`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 11:30:05 PM
// Design Name: 
// Module Name: s_test
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


module s_test;

reg [7:0] a_in, b_in;
reg clk;
reg rst;
reg in_ready;
wire [11:0] out;
wire out_ready;

a_sqrtb a_sqrtb_inst(
    .clk(clk),
    .rst(rst),
    .a_in(a_in),
    .b_in(b_in),
    .in_ready(in_ready),
    .y_out(out),
    .y_ready(out_ready)
);

integer i;

initial begin
    clk = 1;
    forever
        #10
        clk = ~clk;
end


initial begin
    in_ready = 0;
    rst = 1;

    #20

    rst = 0;
    for (i = 0; i < 256; i = i + 25) begin
        a_in = i;
        b_in = i + 2;
        in_ready = 1;
        
        #20
        
        in_ready = 0;
        
        #580
        
        $display("Input: a) 0x%h, b) 0x%h Output: 0x%h", a_in, b_in, out);
    end
end
endmodule

