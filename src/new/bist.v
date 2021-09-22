`timescale 1ns / 1ps


module bist(
    input  wire          clk,
    input  wire          rst,
    input  wire [7:0]      a,
    input  wire [7:0]      b,
    input  wire         test,
    output reg  [15:0]   out
);

localparam S0 = 0,
           S1 = 1,
           S2 = 2,
           S3 = 3,
           S4 = 4,
           S5 = 5,
           S6 = 6,
           S7 = 7,
           S8 = 8,
           S9 = 9,
           S10 = 10,
           S11 = 11,
           S12 = 12,
           S13 = 13,
           S14 = 14;

reg  [3:0] state;
wire       flt_test;
reg        flt_test_prev;
reg        test_mode;
reg  [7:0] test_cnt;

reg  dut_rst;
reg  dut_start;
wire dut_ready;

reg  [7:0]  dut_a;
reg  [7:0]  dut_b;
wire [11:0] dut_y;

reg sr_rst;
reg lfsr_shift;
reg crc_shift;
reg crc_bit;

reg  [7:0] lfsr1_init;
reg  [7:0] lfsr2_init;
wire [7:0] lfsr1_result;
wire [7:0] lfsr2_result;
wire [7:0] crc_result;

reg [7:0] test_iteration;
reg [3:0] result_bit;

button button1(
    .clk(clk),
    .rst(rst),
    .in(test),
    .out(flt_test)
);

a_sqrtb dut(
    .clk(clk),
    .rst(dut_rst),
    .a_in(dut_a),
    .b_in(dut_b),
    .in_ready(dut_start),
    .y_out(dut_y),
    .y_ready(dut_ready)
);

lfsr lfsr1(
    .clk(clk),
    .rst(sr_rst),
    .init(lfsr1_init),
    .shift(lfsr_shift),
    .result(lfsr1_result)
);

lfsr2 lfsr2(
    .clk(clk),
    .rst(sr_rst),
    .init(lfsr2_init),
    .shift(lfsr_shift),
    .result(lfsr2_result)
);

crc8 crc(
    .clk(clk),
    .rst(sr_rst),
    .bit(crc_bit),
    .shift(crc_shift),
    .result(crc_result)
);

always @(posedge clk) begin
    flt_test_prev <= flt_test;

    if (flt_test != flt_test_prev && flt_test) begin
        test_mode <= ~test_mode;
    end

    if (rst) begin
        out <= 0;
        state <= S0;
        test_mode <= 0;
        test_cnt <= 0;
        dut_rst <= 1;
        dut_start <= 0;
        dut_a <= 0;
        dut_b <= 0;
        sr_rst <= 0;
        lfsr_shift <= 0;
        crc_shift <= 0;
        crc_bit <= 0;
        lfsr1_init <= 0;
        lfsr2_init <= 0;
        test_iteration <= 0;
        result_bit <= 0;
    end else begin
        case (state)
        S0:
            begin
                dut_rst <= 0;
                if (test_mode) begin
                    state <= S5;
                end else begin
                    state <= S1;
                end
            end

        S1:
            begin
                dut_a <= a;
                dut_b <= b;
                dut_start <= 1;
                state <= S2;
            end

        S2:
            begin
                dut_start <= 0;
                state <= S3;
            end

        S3:
            begin
                if (dut_ready) begin
                    state <= S4;
                end
            end

        S4:
            begin
                out[15:12] <= 0;
                out[12:0] <= dut_y;
                state <= S0;
            end

        S5:
            begin
                test_cnt <= test_cnt + 1;
                sr_rst <= 1;
                lfsr1_init <= a;
                lfsr2_init <= b;
                state <= S6;
            end

        S6:
            begin
                out[15:8] <= test_cnt;
                sr_rst <= 0;
                test_iteration <= 0;
                state <= S7;
            end

        S7:
            begin
                out[7:0] <= crc_result;
                lfsr_shift <= 1;
                dut_rst <= 1;
                state <= S8;
            end

        S8:
            begin
                lfsr_shift <= 0;
                dut_rst <= 0;
                state <= S9;
            end

        S9:
            begin
                dut_a <= lfsr1_result;
                dut_b <= lfsr2_result;
                dut_start <= 1;
                state <= S10;
            end

        S10:
            begin
                dut_start <= 0;
                state <= S11;
            end

        S11:
            begin
                if (dut_ready) begin
                    result_bit <= 0;
                    state <= S12;
                end
            end

        S12:
            begin
                crc_shift <= 1;
                crc_bit <= dut_y[result_bit];
                result_bit <= result_bit + 1;

                if (result_bit == 11) begin
                    state <= S13;
                end
            end

        S13:
            begin
                crc_shift <= 0;
                test_iteration <= test_iteration + 1;

                if (&test_iteration) begin
                    state <= S14;
                end else begin
                    state <= S7;
                end
            end

        S14:
            begin
                out[7:0] <= crc_result;

                if (~test_mode) begin
                    dut_rst <= 1;
                    state <= S0;
                end
            end
        endcase
    end
end

endmodule
