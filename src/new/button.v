`timescale 1ns / 1ps

module button(
    input  wire clk,
    input  wire rst,
    input  wire in,
    output wire out
);

reg sync1;
reg sync2;
reg lpfin;
reg lpfout;

reg [3:0] count;

assign out = lpfout;

always @(posedge clk) begin
    if (rst) begin
        sync1 <= 0;
        sync2 <= 0;
        lpfin <= 0;
        lpfout <= 0;
        count <= 0;
    end else begin
        sync1 <= in;
        sync2 <= sync1;
        lpfin <= sync2;

        if (lpfin == lpfout) begin
            count <= 0;
        end else begin
            count <= count + 1;
        end

        if (&count) begin
            lpfout <= ~lpfout;
        end
    end
end

endmodule 
