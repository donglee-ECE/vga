`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2016 09:23:31 AM
// Design Name: 
// Module Name: vga_display
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


module vga_display
    #(
	parameter	H_DISP 	=	10'd640,
	parameter	V_DISP 	=	10'd480 
)
    (
	input				clk, 
    input               rst_n, 

    input        [9:0]    vga_xpos, 
    input         [9:0]     vga_ypos,
    output     reg    [11:0]     vga_data
    );
    localparam RED     	 =	   12'hF00;  
    localparam GREEN     =     12'h0F0;  
    localparam BLUE      =     12'h00F;  
    localparam WHITE     =     12'hFFF;  
    localparam BLACK     =     12'h000;  
    localparam YELLOW    =     12'hFF0;  
    localparam CYAN      =     12'hF0F;  
    localparam ROYAL     =     12'h0FF;  
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            vga_data <= 12'h0;
        else
            begin
            if    (vga_xpos >= 0 && vga_xpos < (H_DISP>>3))
                vga_data <= RED;
            else if(vga_xpos >= (H_DISP>>3)*1 && vga_xpos < (H_DISP>>3)*2)
                vga_data <= GREEN;
            else if(vga_xpos >= (H_DISP>>3)*2 && vga_xpos < (H_DISP>>3)*3)
                vga_data <= BLUE;
            else if(vga_xpos >= (H_DISP>>3)*3 && vga_xpos < (H_DISP>>3)*4)
                vga_data <= WHITE;
            else if(vga_xpos >= (H_DISP>>3)*4 && vga_xpos < (H_DISP>>3)*5)
                vga_data <= BLACK;
            else if(vga_xpos >= (H_DISP>>3)*5 && vga_xpos < (H_DISP>>3)*6)
                vga_data <= YELLOW;
            else if(vga_xpos >= (H_DISP>>3)*6 && vga_xpos < (H_DISP>>3)*7)
                vga_data <= CYAN;
            else// if(vga_xpos >= (H_DISP<<3)*7 && vga_xpos < (H_DISP<<3)*8)
                vga_data <= ROYAL;
            end
    end
endmodule
