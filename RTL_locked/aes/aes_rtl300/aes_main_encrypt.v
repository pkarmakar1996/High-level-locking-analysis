// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module aes_main_encrypt (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        statemt_i,
        statemt_o,
        statemt_o_ap_vld,
        key_address0,
        key_ce0,
        key_q0,
        locking_key
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] statemt_i;
output  [31:0] statemt_o;
output   statemt_o_ap_vld;
output  [4:0] key_address0;
output   key_ce0;
input  [7:0] key_q0;


input[99:0] locking_key;

reg[299:0] new_locking_key;
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

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] statemt_o;
reg statemt_o_ap_vld;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [8:0] word_address0;
reg    word_ce0;
reg    word_we0;
reg   [31:0] word_d0;
wire   [31:0] word_q0;
reg    word_ce1;
reg    word_we1;
wire   [31:0] word_q1;
reg   [7:0] Sbox_address0;
reg    Sbox_ce0;
wire   [7:0] Sbox_q0;
wire   [7:0] Sbox_q1;
reg   [31:0] statemt_read_reg_59;
wire    ap_CS_fsm_state4;
wire    grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_start;
wire    grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_done;
wire    grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_idle;
wire    grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_ready;
wire   [4:0] grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_key_address0;
wire    grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_key_ce0;
wire   [8:0] grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_address0;
wire    grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_ce0;
wire    grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_we0;
wire   [31:0] grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_d0;
wire    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_start;
wire    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_done;
wire    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_idle;
wire    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_ready;
wire   [8:0] grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_address0;
wire    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_ce0;
wire    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_we0;
wire   [31:0] grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_d0;
wire   [8:0] grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_address1;
wire    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_ce1;
wire    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_we1;
wire   [31:0] grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_d1;
wire   [7:0] grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_Sbox_address0;
wire    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_Sbox_ce0;
wire    grp_aes_func_call_fu_46_ap_start;
wire    grp_aes_func_call_fu_46_ap_done;
wire    grp_aes_func_call_fu_46_ap_idle;
wire    grp_aes_func_call_fu_46_ap_ready;
wire   [31:0] grp_aes_func_call_fu_46_statemt1;
wire    grp_aes_func_call_fu_46_statemt1_ap_vld;
reg    grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_start_reg;
wire    ap_CS_fsm_state2;
reg    grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_start_reg;
wire    ap_CS_fsm_state3;
reg    grp_aes_func_call_fu_46_ap_start_reg;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_start_reg = 1'b0;
#0 grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_start_reg = 1'b0;
#0 grp_aes_func_call_fu_46_ap_start_reg = 1'b0;
end

aes_main_encrypt_word_RAM_AUTO_1R1W #(
    .DataWidth( 32 ),
    .AddressRange( 480 ),
    .AddressWidth( 9 ))
word_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(word_address0),
    .ce0(word_ce0),
    .we0(word_we0),
    .d0(word_d0),
    .q0(word_q0),
    .address1(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_address1),
    .ce1(word_ce1),
    .we1(word_we1),
    .d1(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_d1),
    .q1(word_q1),
    .locking_key(locking_key[99:0])
);

aes_main_ByteSub_ShiftRow_Sbox_ROM_AUTO_1R #(
    .DataWidth( 8 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
Sbox_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(Sbox_address0),
    .ce0(Sbox_ce0),
    .q0(Sbox_q0),
    .address1(8'd0),
    .ce1(1'b0),
    .q1(Sbox_q1),
    .locking_key(locking_key[99:0])
);

aes_main_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2 grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_start),
    .ap_done(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_done),
    .ap_idle(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_idle),
    .ap_ready(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_ready),
    .key_address0(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_key_address0),
    .key_ce0(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_key_ce0),
    .key_q0(key_q0),
    .word_address0(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_address0),
    .word_ce0(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_ce0),
    .word_we0(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_we0),
    .word_d0(grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_d0),
    .locking_key(locking_key[99:0])
);

aes_main_encrypt_Pipeline_VITIS_LOOP_76_3 grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_start),
    .ap_done(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_done),
    .ap_idle(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_idle),
    .ap_ready(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_ready),
    .word_address0(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_address0),
    .word_ce0(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_ce0),
    .word_we0(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_we0),
    .word_d0(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_d0),
    .word_q0(word_q0),
    .word_address1(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_address1),
    .word_ce1(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_ce1),
    .word_we1(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_we1),
    .word_d1(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_d1),
    .word_q1(word_q1),
    .Sbox_address0(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_Sbox_address0),
    .Sbox_ce0(grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_Sbox_ce0),
    .Sbox_q0(Sbox_q0),
    .locking_key(locking_key[99:0])
);

aes_main_aes_func_call grp_aes_func_call_fu_46(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_aes_func_call_fu_46_ap_start),
    .ap_done(grp_aes_func_call_fu_46_ap_done),
    .ap_idle(grp_aes_func_call_fu_46_ap_idle),
    .ap_ready(grp_aes_func_call_fu_46_ap_ready),
    .statemt1(grp_aes_func_call_fu_46_statemt1),
    .statemt1_ap_vld(grp_aes_func_call_fu_46_statemt1_ap_vld),
    .statemt1_read(statemt_read_reg_59),
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
        grp_aes_func_call_fu_46_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_aes_func_call_fu_46_ap_start_reg <= 1'b1;
        end else if ((grp_aes_func_call_fu_46_ap_ready == 1'b1)) begin
            grp_aes_func_call_fu_46_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_start_reg <= 1'b1;
        end else if ((grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_ready == 1'b1)) begin
            grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_start_reg <= 1'b1;
        end else if ((grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_ready == 1'b1)) begin
            grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        statemt_read_reg_59 <= statemt_i;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        Sbox_address0 = 8'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        Sbox_address0 = grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_Sbox_address0;
    end else begin
        Sbox_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        Sbox_ce0 = 1'b0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        Sbox_ce0 = grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_Sbox_ce0;
    end else begin
        Sbox_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_aes_func_call_fu_46_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((1'b1 == ap_CS_fsm_state6) & (grp_aes_func_call_fu_46_ap_done == 1'b1)))) begin
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
    if (((1'b1 == ap_CS_fsm_state6) & (grp_aes_func_call_fu_46_ap_done == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) & (grp_aes_func_call_fu_46_statemt1_ap_vld == 1'b1))) begin
        statemt_o = grp_aes_func_call_fu_46_statemt1;
    end else begin
        statemt_o = statemt_i;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        statemt_o_ap_vld = grp_aes_func_call_fu_46_statemt1_ap_vld;
    end else begin
        statemt_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        word_address0 = grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_address0 = grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_address0;
    end else begin
        word_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        word_ce0 = grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_ce0 = grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_ce0;
    end else begin
        word_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        word_ce1 = grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_ce1;
    end else begin
        word_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        word_d0 = grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_d0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_d0 = grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_d0;
    end else begin
        word_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        word_we0 = grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_we0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_we0 = grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_word_we0;
    end else begin
        word_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        word_we1 = grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_word_we1;
    end else begin
        word_we1 = 1'b0;
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
            if (((grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (grp_aes_func_call_fu_46_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign grp_aes_func_call_fu_46_ap_start = grp_aes_func_call_fu_46_ap_start_reg;

assign grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_start = grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_ap_start_reg;

assign grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_start = grp_encrypt_Pipeline_VITIS_LOOP_76_3_fu_36_ap_start_reg;

assign key_address0 = grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_key_address0;

assign key_ce0 = grp_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_fu_28_key_ce0;

//assign new_locking_key[99:0] = locking_key[99:0];
//assign new_locking_key[199:100] = locking_key[99:0];
//assign new_locking_key[299:200] = locking_key[99:0];

endmodule //aes_main_encrypt
