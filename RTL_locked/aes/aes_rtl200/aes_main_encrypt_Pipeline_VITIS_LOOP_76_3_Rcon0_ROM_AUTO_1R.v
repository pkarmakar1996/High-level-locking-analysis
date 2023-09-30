// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module aes_main_encrypt_Pipeline_VITIS_LOOP_76_3_Rcon0_ROM_AUTO_1R (
    address0, ce0, q0, 
    reset, clk,locking_key);

parameter DataWidth = 8;
parameter AddressWidth = 5;
parameter AddressRange = 30;
 
input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;

input reset;
input clk;
input[99:0] locking_key;
wire[199:0] new_locking_key;


 
reg [DataWidth-1:0] rom0[0:AddressRange-1];


initial begin
     
    $readmemh("./aes_main_encrypt_Pipeline_VITIS_LOOP_76_3_Rcon0_ROM_AUTO_1R.dat", rom0);
end

  
always @(posedge clk) 
begin 
    if (ce0) 
    begin
        q0 <= rom0[address0];
    end
end

assign new_locking_key[99:0]= locking_key[99:0];
assign new_locking_key[199:100]=locking_key[99:0];

endmodule

