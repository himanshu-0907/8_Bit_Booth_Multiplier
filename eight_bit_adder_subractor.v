`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 16:26:29
// Design Name: 
// Module Name: eight_bit_adder_subractor
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


module eight_bit_adder_subractor(
    input wire cin,
    input wire [7:0] i0,i1,
    output wire [7:0] sum);

	wire cout;
	wire [7:0] temp;
	wire [7:0] int_ip; //intermediate input - processed from the inputs and fed into fa module 
	
	//if cin == 1, int_ip = 1's complement
	//else int_ip = i1
    xor2 x0 (i1[0], cin, int_ip[0]);
    xor2 x1 (i1[1], cin, int_ip[1]);
    xor2 x2 (i1[2], cin, int_ip[2]);
    xor2 x3 (i1[3], cin, int_ip[3]);
    xor2 x4 (i1[4], cin, int_ip[4]);
    xor2 x5 (i1[5], cin, int_ip[5]);
    xor2 x6 (i1[6], cin, int_ip[6]);
    xor2 x7 (i1[7], cin, int_ip[7]);
    
    //if cin == 1, cin added to make two's complement
    //else addition takes place
	fa fa1(i0[0], int_ip[0], cin,     sum[0], temp[0]);
	fa fa2(i0[1], int_ip[1], temp[0], sum[1], temp[1]);
	fa fa3(i0[2], int_ip[2], temp[1], sum[2], temp[2]);
	fa fa4(i0[3], int_ip[3], temp[2], sum[3], temp[3]);
	fa fa5(i0[4], int_ip[4], temp[3], sum[4], temp[4]);
	fa fa6(i0[5], int_ip[5], temp[4], sum[5], temp[5]);
	fa fa7(i0[6], int_ip[6], temp[5], sum[6], temp[6]);
	fa fa8(i0[7], int_ip[7], temp[6], sum[7], cout);
	
endmodule
