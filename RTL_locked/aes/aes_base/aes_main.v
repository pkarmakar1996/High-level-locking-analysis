// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="aes_main_aes_main,hls_ip_2022_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg676-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.353000,HLS_SYN_LAT=898,HLS_SYN_TPT=none,HLS_SYN_MEM=9,HLS_SYN_DSP=0,HLS_SYN_FF=2233,HLS_SYN_LUT=10465,HLS_VERSION=2022_2}" *)

module aes_main (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        statemt_i,
        statemt_o,
        statemt_o_ap_vld,
        ap_return,
        locking_key
);

parameter    ap_ST_fsm_state1 = 10'd1;
parameter    ap_ST_fsm_state2 = 10'd2;
parameter    ap_ST_fsm_state3 = 10'd4;
parameter    ap_ST_fsm_state4 = 10'd8;
parameter    ap_ST_fsm_state5 = 10'd16;
parameter    ap_ST_fsm_state6 = 10'd32;
parameter    ap_ST_fsm_state7 = 10'd64;
parameter    ap_ST_fsm_state8 = 10'd128;
parameter    ap_ST_fsm_state9 = 10'd256;
parameter    ap_ST_fsm_state10 = 10'd512;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] statemt_i;
output  [31:0] statemt_o;
output   statemt_o_ap_vld;
output  [31:0] ap_return;


input[99:0] locking_key;

wire[99:0] new_locking_key;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] statemt_o;

(* fsm_encoding = "none" *) reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [4:0] key_address0;
reg    key_ce0;
reg    key_we0;
reg   [7:0] key_d0;
wire   [7:0] key_q0;
reg   [4:0] key_address1;
reg    key_ce1;
reg    key_we1;
reg   [7:0] key_d1;
wire    grp_encrypt_fu_134_ap_start;
wire    grp_encrypt_fu_134_ap_done;
wire    grp_encrypt_fu_134_ap_idle;
wire    grp_encrypt_fu_134_ap_ready;
wire   [31:0] grp_encrypt_fu_134_statemt_o;
wire    grp_encrypt_fu_134_statemt_o_ap_vld;
wire   [4:0] grp_encrypt_fu_134_key_address0;
wire    grp_encrypt_fu_134_key_ce0;
reg    grp_encrypt_fu_134_ap_start_reg;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state10;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state8;
reg   [9:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 10'd1;
#0 grp_encrypt_fu_134_ap_start_reg = 1'b0;
end

aes_main_key_RAM_AUTO_1R1W #(
    .DataWidth( 8 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
key_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(key_address0),
    .ce0(key_ce0),
    .we0(key_we0),
    .d0(key_d0),
    .q0(key_q0),
    .address1(key_address1),
    .ce1(key_ce1),
    .we1(key_we1),
    .d1(key_d1),
    .locking_key(locking_key[99:0])
);

aes_main_encrypt grp_encrypt_fu_134(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_encrypt_fu_134_ap_start),
    .ap_done(grp_encrypt_fu_134_ap_done),
    .ap_idle(grp_encrypt_fu_134_ap_idle),
    .ap_ready(grp_encrypt_fu_134_ap_ready),
    .statemt_i(statemt_i),
    .statemt_o(grp_encrypt_fu_134_statemt_o),
    .statemt_o_ap_vld(grp_encrypt_fu_134_statemt_o_ap_vld),
    .key_address0(grp_encrypt_fu_134_key_address0),
    .key_ce0(grp_encrypt_fu_134_key_ce0),
    .key_q0(key_q0),
    .locking_key(locking_key[99:0])
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_encrypt_fu_134_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state9)) begin
            grp_encrypt_fu_134_ap_start_reg <= 1'b1;
        end else if ((grp_encrypt_fu_134_ap_ready == 1'b1)) begin
            grp_encrypt_fu_134_ap_start_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if ((grp_encrypt_fu_134_ap_done == 1'b0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((grp_encrypt_fu_134_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((grp_encrypt_fu_134_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        key_address0 = 5'd15;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        key_address0 = 5'd13;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        key_address0 = 5'd11;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        key_address0 = 5'd9;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        key_address0 = 5'd7;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        key_address0 = 5'd5;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        key_address0 = 5'd3;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        key_address0 = 5'd1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        key_address0 = grp_encrypt_fu_134_key_address0;
    end else begin
        key_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        key_address1 = 5'd14;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        key_address1 = 5'd12;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        key_address1 = 5'd10;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        key_address1 = 5'd8;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        key_address1 = 5'd6;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        key_address1 = 5'd4;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        key_address1 = 5'd2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        key_address1 = 5'd0;
    end else begin
        key_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        key_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        key_ce0 = grp_encrypt_fu_134_key_ce0;
    end else begin
        key_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        key_ce1 = 1'b1;
    end else begin
        key_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        key_d0 = 8'd60;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        key_d0 = 8'd207;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        key_d0 = 8'd136;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        key_d0 = 8'd247;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        key_d0 = 8'd166;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        key_d0 = 8'd174;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        key_d0 = 8'd22;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        key_d0 = 8'd126;
    end else begin
        key_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        key_d1 = 8'd79;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        key_d1 = 8'd9;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        key_d1 = 8'd171;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        key_d1 = 8'd210;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        key_d1 = 8'd40;
    end else if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state2))) begin
        key_d1 = 8'd21;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        key_d1 = 8'd43;
    end else begin
        key_d1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        key_we0 = 1'b1;
    end else begin
        key_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        key_we1 = 1'b1;
    end else begin
        key_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((grp_encrypt_fu_134_statemt_o_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        statemt_o = grp_encrypt_fu_134_statemt_o;
    end else begin
        statemt_o = statemt_i;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            if (((grp_encrypt_fu_134_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign ap_return = 32'd0;

assign grp_encrypt_fu_134_ap_start = grp_encrypt_fu_134_ap_start_reg;

assign statemt_o_ap_vld = grp_encrypt_fu_134_statemt_o_ap_vld;

assign new_locking_key= locking_key[99:0];

endmodule //aes_main
