`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 11:47:08 PM
// Design Name: 
// Module Name: lfsr_tb
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


module lfsr_tb();

reg clk;
reg rst;
reg shift;
reg[7:0] init;
wire [7:0] result;

lfsr2 lfsr2(
    .clk(clk),
    .rst(rst),
    .init(init),
    .shift(shift),
    .result(result)
);

integer i;

initial begin
    clk = 1;
    forever
        #10
        clk = ~clk;
end

initial begin
    init = 8'b00000101;
    rst = 1;
    #20
    rst = 0;
    #20
    shift = 1;
    
    for (i = 0; i<256; i = i + 1) begin
        #20
        $display("Output: 0x%b", result);
    end
    
    shift = 0;
    $display("End");
 
 end   
endmodule
