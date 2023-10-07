// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module aes_main_encrypt_word_RAM_AUTO_1R1W (
     
    address0, ce0,
    d0, we0, 
    q0, 
      
    address1, ce1,
    d1, we1, 
    q1, 
     
    reset, clk,locking_key);

parameter DataWidth = 32;
parameter AddressWidth = 9;
parameter AddressRange = 480;
 
input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input we0; 
output reg[DataWidth-1:0] q0; 
 
input[AddressWidth-1:0] address1;
input ce1;
input[DataWidth-1:0] d1;
input we1; 
output reg[DataWidth-1:0] q1; 

input reset;
input clk;


input[99:0] locking_key;
reg[399:0] new_locking_key;
always @ (locking_key)
    begin
        new_locking_key[99:0] = locking_key[99:0];
    end
always @ (locking_key)
    begin
        new_locking_key[199:100] = locking_key[99:0];
    end
always @ (locking_key)
    begin
        new_locking_key[299:200] = locking_key[99:0];
    end
always @ (locking_key)
    begin
        new_locking_key[399:300] = locking_key[99:0];
    end

(* ram_style = "auto"  *)reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./aes_main_encrypt_word_RAM_AUTO_1R1W.dat", ram);
end 



//read first
always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[address0] <= d0; 
        q0 <= ram[address0];

    end
end 
 


//read first
always @(posedge clk)  
begin 
    if (ce1) begin
        if (we1) 
            ram[address1] <= d1; 
        q1 <= ram[address1];

    end
end 
 
//assign new_locking_key[99:0] = locking_key[99:0];
//assign new_locking_key[199:100] = locking_key[99:0];
//assign new_locking_key[299:200] = locking_key[99:0];
//assign new_locking_key[399:300] = locking_key[99:0];

endmodule

