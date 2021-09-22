`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 10:48:24 PM
// Design Name: 
// Module Name: crc8_tb
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


module crc8_tb();

reg clk;
reg rst;
reg bit;
reg shift;
wire [7:0] result;

crc8 crc8(
    .clk(clk),
    .rst(rst),
    .bit(bit),
    .shift(shift),
    .result(result)
);

integer i;
reg [7:0] test;


initial begin
    clk = 1;
    forever
        #10
        clk = ~clk;
end

initial begin
    rst = 1;
    #20
    rst = 0;
    #20
    shift = 1;
    
    test = 8'b00101101;
    for (i = 0; i<8; i = i + 1) begin 
        bit = test[i];
        #20
        $display("Input: 0x%b Output: 0x%b", bit, result);
    end
 end
    

endmodule
