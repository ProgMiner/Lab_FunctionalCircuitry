`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 10:11:49 PM
// Design Name: 
// Module Name: ab_tb
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


module ab_tb;

reg clk_reg, rst, in_ready;
reg [7:0] in;
wire [3:0] out;
wire out_ready;

sqrt sqrt_inst(
    .clk(clk_reg),
    .rst(rst),
    .x_in(in),
    .x_ready(in_ready),
    .y_out(out),
    .y_ready(out_ready)
);
    

initial begin
    clk_reg = 1;
    forever
        #10
        clk_reg = ~clk_reg;
end

initial begin
    in = 203;
    rst = 1;
    in_ready = 0;

    #20

    rst = 0;
    in_ready = 1;
    
    #20
    
    in_ready = 0;
    
    #60
    
    
    $display("Output: 0x%h", out);
    
end

endmodule
