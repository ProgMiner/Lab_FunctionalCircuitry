`timescale 1ns / 1ps

module a_sqrtb(
    input wire            clk,
    input wire            rst,
    input wire [7:0]     a_in,
    input wire [7:0]     b_in,
    input wire       in_ready,

    output reg [11:0]   y_out,
    output reg        y_ready
);

localparam S0 = 0,
           S1 = 1,
           S2 = 2,
           S3 = 3,
           S4 = 4;

reg  [7:0] sqrt1_x;
wire [3:0] sqrt1_y;

reg  sqrt1_x_ready;
wire sqrt1_y_ready;

reg   [7:0] mult1_a;
reg   [7:0] mult1_b;
wire [15:0] mult1_y;

reg  mult1_start;
wire  mult1_busy;

reg [2:0] state;

sqrt sqrt1(
    .clk(clk),
    .rst(rst),
    .x_in(sqrt1_x),
    .x_ready(sqrt1_x_ready),
    .y_out(sqrt1_y),
    .y_ready(sqrt1_y_ready)
);

mult mult1(
    .clk_i(clk),
    .rst_i(rst),
    .a_bi(mult1_a),
    .b_bi(mult1_b),
    .start_i(mult1_start),
    .busy_o(mult1_busy),
    .y_bo(mult1_y)
);

always @(posedge clk) begin
    if (rst) begin
        y_out <= 0;
        y_ready <= 0;
        sqrt1_x <= 0;
        sqrt1_x_ready <= 0;
        mult1_a <= 0;
        mult1_b <= 0;
        mult1_start <= 0;
        state <= S0;
    end else begin
        case (state)
        S0:
            begin
                if (in_ready) begin
                    y_ready <= 0;
                    mult1_a <= a_in;
                    sqrt1_x <= b_in;
                    sqrt1_x_ready <= 1;
                    state <= S1;
                end
            end

        S1:
            begin
                sqrt1_x_ready <= 0;
                state <= S2;
            end

        S2:
            begin
                if (sqrt1_y_ready) begin
                    mult1_b <= sqrt1_y;
                    mult1_start <= 1;
                    state <= S3;
                end
            end

        S3:
            begin
                mult1_start <= 0;
                state <= S4;
            end

        S4:
            begin
                if (!mult1_busy) begin
                    y_out <= mult1_y;
                    y_ready <= 1;
                    state <= S0;
                end
            end
        endcase
    end
end

endmodule
