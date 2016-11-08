`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2016 09:33:58 AM
// Design Name: 
// Module Name: vga
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


module vga(
	//clock and reset
    input             clk,
    input             rst_n,

//vga interface
//    output            vga_adv_clk, 
//    output            vga_blank_n, 
//    output            vga_sync_n,

   (* mark_debug = "true" *)output            vga_hs,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   (* mark_debug = "true" *)output            vga_vs,    
   (* mark_debug = "true" *)output    [11:0]    vga_rgb
    );

        parameter    DUTY_CYCLE        =    50;
        parameter    DIVIDE_DATA        =    10;
        parameter    MULTIPLY_DATA    =    13;
        
        parameter    H_DISP     =    11'd1024; 
        parameter    H_FRONT    =    11'd24;     
        parameter    H_SYNC     =    11'd136;  
        parameter    H_BACK     =    11'd160;   
        parameter    H_TOTAL    =    11'd1344; 
        
        parameter    V_DISP     =    10'd768;                     
        parameter    V_FRONT    =    10'd3; 
        parameter    V_SYNC     =    10'd6;    
        parameter    V_BACK     =    10'd29;   
        parameter    V_TOTAL    =    10'd806;

    
    wire clk_vga;
     clk_wiz_0 clkwiz
     (
     .clk_in1 (clk),
     .clk_out2(clk_vga),
     .reset(rst_n)
     );
     //vga display instantiation
     wire    [9:0]    vga_xpos;
     wire    [9:0]    vga_ypos;
     wire    [11:0]    vga_data;
     vga_display
     #(
         .H_DISP     (H_DISP),
         .V_DISP     (V_DISP) 
     )
     vga_display_inst
     (
         .clk        (clk), 
         .rst_n        (rst_n), 
     
         .vga_xpos    (vga_xpos), 
         .vga_ypos    (vga_ypos),
         .vga_data    (vga_data)
     );
     
     //----------------------------
     //vga driver instantiation
     vga_driver
     #
     (
         .H_DISP     (H_DISP),     
         .H_FRONT    (H_FRONT),    
         .H_SYNC     (H_SYNC),     
         .H_BACK     (H_BACK),     
         .H_TOTAL    (H_TOTAL),    
         .V_DISP     (V_DISP),                     
         .V_FRONT    (V_FRONT),     
         .V_SYNC     (V_SYNC),     
         .V_BACK     (V_BACK),     
         .V_TOTAL    (V_TOTAL)
     )
     vga_driver_inst
     (      
         .clk_vga    (clk_vga),    
         .rst_n        (rst_n),     
         
         .vga_data    (vga_data),
         .vga_rgb    (vga_rgb),    
         .vga_hs        (vga_hs),    
         .vga_vs        (vga_vs),    
         
         .vga_xpos    (vga_xpos),    
         .vga_ypos    (vga_ypos)    
     );
endmodule
