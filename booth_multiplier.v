`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 14:43:10
// Design Name: 
// Module Name: booth_multiplier
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


module booth_multiplier(
    input signed[7:0] multiplier, multiplicand,
    output signed [15:0] product);

	wire signed [7:0] Q[0:6];  //an 8 bit (1byte) array, with a depth of 7 (0 to 6 rows of 1 byte each)
	wire signed [7:0] acc[0:7]; //an 8 bit (1byte) array, with a depth of 8 (0 to 7 rows of 1 byte each)
	wire signed[7:1] q0;
	wire qout;
	
	assign acc[0] = 8'b00000000;   //initialising accumulator to 0
	
	booth_substep step1(acc[0], multiplier, 1'b0, multiplicand, acc[1],        Q[0],         q0[1]);
	booth_substep step2(acc[1], Q[0],      q0[1], multiplicand, acc[2],        Q[1],         q0[2]);
	booth_substep step3(acc[2], Q[1],      q0[2], multiplicand, acc[3],        Q[2],         q0[3]);
	booth_substep step4(acc[3], Q[2],      q0[3], multiplicand, acc[4],        Q[3],         q0[4]);
	booth_substep step5(acc[4], Q[3],      q0[4], multiplicand, acc[5],        Q[4],         q0[5]);
	booth_substep step6(acc[5], Q[4],      q0[5], multiplicand, acc[6],        Q[5],         q0[6]);
	booth_substep step7(acc[6], Q[5],      q0[6], multiplicand, acc[7],        Q[6],         q0[7]);
	booth_substep step8(acc[7], Q[6],      q0[7], multiplicand, product[15:8], product[7:0], qout);
	
	 
endmodule