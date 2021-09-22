`timescale 1ns / 1ps


module crc8(
    input  wire          clk,
    input  wire          rst,
    input  wire          bit,
    input  wire        shift,
    output wire [7:0] result
);

reg [7:0] buffer;

assign result = buffer;

always @(posedge clk) begin
    if (rst) begin
        buffer <= 8'hff;
    end else if (shift) begin
        // y = 1 + x^3 + x^5 + x^6 + x^8

        buffer[0] <= bit ^ buffer[7];
        buffer[1] <= buffer[0];
        buffer[2] <= buffer[1];
        buffer[3] <= buffer[2] ^ buffer[7];
        buffer[4] <= buffer[3];
        buffer[5] <= buffer[4] ^ buffer[7];
        buffer[6] <= buffer[5] ^ buffer[7];
        buffer[7] <= buffer[6];
    end
end

endmodule
