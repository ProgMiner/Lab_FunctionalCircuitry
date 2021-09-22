`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2021 22:38:50
// Design Name: 
// Module Name: adder
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


module adder(
    input a,
    input b,
    input c,
    output result,
    output carry_out
);

wire not_a, not_b, not_c;

nor(not_a, a, a);
nor(not_b, b, b);
nor(not_c, c, c);

wire b_nor_c, b_nor_nc, nb_nor_c, nb_nor_nc;

nor(  b_nor_c,     b,     c);
nor( b_nor_nc,     b, not_c);
nor( nb_nor_c, not_b,     c);
nor(nb_nor_nc, not_b, not_c);

wire w1, w2, w3, w4, w5;

nor(w1, b_nor_nc,  nb_nor_c);
nor(w2,  b_nor_c, nb_nor_nc);

nor(w3,     a, w1);
nor(w4, not_a, w2);
nor(w5, not_a, w1);

wire not_r, not_cout;

nor(   not_r,        w3, w4);
nor(not_cout, nb_nor_nc, w5);

nor(   result,    not_r,    not_r);
nor(carry_out, not_cout, not_cout);

endmodule
