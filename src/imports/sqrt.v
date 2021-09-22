`timescale 1ns / 1ps

module sqrt(
    input  wire           clk,
    input  wire           rst,
    input  wire [7:0]    x_in,
    input  wire       x_ready,
    output  reg [3:0]   y_out,
    output  reg       y_ready
);

localparam S0 = 0,
           S1 = 1,
           S2 = 2,
           S3 = 3,
           S4 = 4;

reg [7:0] x;
reg [6:0] y;
reg [6:0] m;
reg [6:0] b;
reg [2:0] state;

always @(posedge clk) begin
    if (rst) begin
        y_out <= 0;
        y_ready <= 0;
        state <= S0;
    end else begin
        case (state)
        S0:
            begin
                if (x_ready) begin
                    x <= x_in;
                    m <= 64; // 1 << 6
                    y <= 0;
                    y_ready <= 0;
                    state <= S1;
                end
            end

        S1:
            begin
                if (|m) begin
                    begin
                        b <= y | m;
                        state <= S2;
                    end
                end else begin
                    y_out <= y;
                    y_ready <= 1;
                    state <= S0;
                end
            end

        S2:
            begin
                y <= y >> 1;

                if (x >= b) begin
                    state <= S3;
                end else begin
                    state <= S4;
                end
            end

        S3:
            begin
                x <= x - b;
                y <= y | m;
                state <= S4;
            end

        S4:
            begin
                m <= m >> 2;
                state <= S1;
            end
        endcase
    end
end

endmodule
