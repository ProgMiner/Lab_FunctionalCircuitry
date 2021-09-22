`timescale 1ns / 1ps

module button_tb();

reg clk;
reg rst;
reg in = 0;
wire out;

button button(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);


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
    
    in = 1;
    #200
    in = 0;
    $display("Output 1: 0x%b", out);
    #200
    
    in = 1;
    #1280
    $display("Output 2: 0x%b", out);
    #200
    
    in = 0;
    #200
    in = 1;
    $display("Output 3: 0x%b", out);
    #200
    
    in = 0;
    #1280
    $display("Output 4: 0x%b", out);

end
endmodule
