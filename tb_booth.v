`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 17:24:52
// Design Name: 
// Module Name: tb_booth
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


module tb_booth;
wire signed [15:0] z;
reg signed [7:0] a,b;


booth_multiplier my_booth(.multiplier(a),.multiplicand(b),.product(z));

//initial begin $dumpfile("tb_boothsalgo.vcd"); $dumpvars(0,tb); end

initial begin
$monitor("%d * %d = %b",b,a,z);

a = 8'b00000111;      //7
b = 8'b00000101;      //5

#10

a = 8'b11111001;      //-7
b = 8'b11111011;      //-5

#10

a = 8'b11111001;    //-7
b = 8'b00000101;    //5

#10

a = 8'b00000111;    //7
b = 8'b11111011;    //-5

#10  

a = 8'b00000111;    //7
b = 8'b00000000;    //0

#10

a = 8'b00000101;    //5
b = 8'b00000001;    //1

#10

a = 8'b11111111;    //-1
b = 8'b00000111;    //7

//#10
////a = 8'b10000000;
////b = 8'b10000000;
//a = 8'b10001;
//b = 8'b10111111;

end 
endmodule