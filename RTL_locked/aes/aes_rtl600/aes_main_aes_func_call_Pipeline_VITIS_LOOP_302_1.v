// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module aes_main_aes_func_call_Pipeline_VITIS_LOOP_302_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        statemt_address0,
        statemt_ce0,
        statemt_we0,
        statemt_d0,
        statemt_q0,
        statemt_address1,
        statemt_ce1,
        statemt_we1,
        statemt_d1,
        statemt_q1,
        word1_address0,
        word1_ce0,
        word1_q0,
        locking_key
);

parameter    ap_ST_fsm_pp0_stage0 = 4'd1;
parameter    ap_ST_fsm_pp0_stage1 = 4'd2;
parameter    ap_ST_fsm_pp0_stage2 = 4'd4;
parameter    ap_ST_fsm_pp0_stage3 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] statemt_address0;
output   statemt_ce0;
output   statemt_we0;
output  [31:0] statemt_d0;
input  [31:0] statemt_q0;
output  [4:0] statemt_address1;
output   statemt_ce1;
output   statemt_we1;
output  [31:0] statemt_d1;
input  [31:0] statemt_q1;
output  [8:0] word1_address0;
output   word1_ce0;
input  [7:0] word1_q0;

input[99:0] locking_key;

reg[599:0] new_locking_key;
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
always @ (locking_key)
    begin
        new_locking_key[499:400] = locking_key[99:0];
    end
always @ (locking_key)
    begin
        new_locking_key[599:500] = locking_key[99:0];
    end

reg ap_idle;
reg[4:0] statemt_address0;
reg statemt_ce0;
reg statemt_we0;
reg[31:0] statemt_d0;
reg[4:0] statemt_address1;
reg statemt_ce1;
reg statemt_we1;
reg[31:0] statemt_d1;
reg[8:0] word1_address0;
reg word1_ce0;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state4_pp0_stage3_iter0;
wire    ap_block_state8_pp0_stage3_iter1;
wire    ap_block_pp0_stage3_subdone;
reg   [0:0] icmp_ln302_reg_316;
reg    ap_condition_exit_pp0_iter0_stage3;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [31:0] reg_134;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state6_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_11001;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_state7_pp0_stage2_iter1;
wire    ap_block_pp0_stage2_11001;
reg   [2:0] j_3_reg_309;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln302_fu_147_p2;
wire   [3:0] shl_ln_fu_168_p3;
reg   [3:0] shl_ln_reg_325;
reg   [3:0] shl_ln_reg_325_pp0_iter1_reg;
reg   [4:0] statemt_addr_1_reg_331;
reg   [4:0] statemt_addr_2_reg_336;
wire   [31:0] xor_ln304_fu_217_p2;
reg   [31:0] xor_ln304_reg_346;
reg   [4:0] statemt_addr_3_reg_351;
wire    ap_block_pp0_stage3_11001;
reg   [7:0] word1_load_3_reg_366;
reg   [4:0] statemt_addr_reg_371;
wire   [31:0] xor_ln307_fu_296_p2;
reg   [31:0] xor_ln307_reg_376;
reg    ap_enable_reg_pp0_iter0_reg;
wire   [63:0] j_cast2_fu_159_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln304_1_fu_176_p1;
wire   [63:0] zext_ln305_1_fu_187_p1;
wire   [63:0] zext_ln305_3_fu_208_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln306_1_fu_228_p1;
wire   [63:0] zext_ln306_3_fu_244_p1;
wire    ap_block_pp0_stage2;
wire   [63:0] zext_ln307_3_fu_267_p1;
wire    ap_block_pp0_stage3;
wire   [63:0] zext_ln307_1_fu_288_p1;
reg   [2:0] j_fu_52;
wire   [2:0] add_ln302_fu_153_p2;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_j_3;
wire   [31:0] xor_ln305_fu_253_p2;
wire   [31:0] xor_ln306_fu_276_p2;
wire   [1:0] trunc_ln304_fu_164_p1;
wire   [3:0] or_ln305_fu_181_p2;
wire   [3:0] tmp_fu_197_p3;
wire  signed [6:0] sext_ln305_fu_204_p1;
wire   [31:0] zext_ln304_fu_213_p1;
wire   [3:0] or_ln306_fu_223_p2;
wire   [4:0] tmp_s_fu_233_p3;
wire  signed [7:0] sext_ln306_fu_240_p1;
wire   [31:0] zext_ln305_fu_249_p1;
wire   [8:0] tmp_23_cast_fu_260_p3;
wire   [31:0] zext_ln306_fu_272_p1;
wire   [3:0] or_ln307_fu_283_p2;
wire   [31:0] zext_ln307_fu_293_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [3:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to1;
wire    ap_block_pp0_stage1_subdone;
wire    ap_block_pp0_stage2_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

aes_main_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage3),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int),
    .locking_key(locking_key[99:0])
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage3)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln302_fu_147_p2 == 1'd0))) begin
            j_fu_52 <= add_ln302_fu_153_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_52 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln302_reg_316 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            reg_134 <= statemt_q1;
        end else if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            reg_134 <= statemt_q0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln302_reg_316 <= icmp_ln302_fu_147_p2;
        j_3_reg_309 <= ap_sig_allocacmp_j_3;
        shl_ln_reg_325_pp0_iter1_reg[3 : 2] <= shl_ln_reg_325[3 : 2];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln302_fu_147_p2 == 1'd0))) begin
        shl_ln_reg_325[3 : 2] <= shl_ln_fu_168_p3[3 : 2];
        statemt_addr_1_reg_331[3 : 2] <= zext_ln304_1_fu_176_p1[3 : 2];
        statemt_addr_2_reg_336[3 : 2] <= zext_ln305_1_fu_187_p1[3 : 2];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln302_reg_316 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        statemt_addr_3_reg_351[3 : 2] <= zext_ln306_1_fu_228_p1[3 : 2];
        xor_ln304_reg_346 <= xor_ln304_fu_217_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        statemt_addr_reg_371[3 : 2] <= zext_ln307_1_fu_288_p1[3 : 2];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        word1_load_3_reg_366 <= word1_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        xor_ln307_reg_376 <= xor_ln307_fu_296_p2;
    end
end

always @ (*) begin
    if (((icmp_ln302_reg_316 == 1'd1) & (1'b0 == ap_block_pp0_stage3_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_condition_exit_pp0_iter0_stage3 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage3 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_j_3 = 3'd0;
    end else begin
        ap_sig_allocacmp_j_3 = j_fu_52;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        statemt_address0 = statemt_addr_reg_371;
    end else if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        statemt_address0 = zext_ln307_1_fu_288_p1;
    end else if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        statemt_address0 = statemt_addr_2_reg_336;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        statemt_address0 = zext_ln305_1_fu_187_p1;
    end else begin
        statemt_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            statemt_address1 = statemt_addr_3_reg_351;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            statemt_address1 = statemt_addr_1_reg_331;
        end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            statemt_address1 = zext_ln306_1_fu_228_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            statemt_address1 = zext_ln304_1_fu_176_p1;
        end else begin
            statemt_address1 = 'bx;
        end
    end else begin
        statemt_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        statemt_ce0 = 1'b1;
    end else begin
        statemt_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        statemt_ce1 = 1'b1;
    end else begin
        statemt_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        statemt_d0 = xor_ln307_reg_376;
    end else if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        statemt_d0 = xor_ln305_fu_253_p2;
    end else begin
        statemt_d0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            statemt_d1 = xor_ln306_fu_276_p2;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            statemt_d1 = xor_ln304_reg_346;
        end else begin
            statemt_d1 = 'bx;
        end
    end else begin
        statemt_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln302_reg_316 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)))) begin
        statemt_we0 = 1'b1;
    end else begin
        statemt_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln302_reg_316 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln302_reg_316 == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)))) begin
        statemt_we1 = 1'b1;
    end else begin
        statemt_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            word1_address0 = zext_ln307_3_fu_267_p1;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            word1_address0 = zext_ln306_3_fu_244_p1;
        end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            word1_address0 = zext_ln305_3_fu_208_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            word1_address0 = j_cast2_fu_159_p1;
        end else begin
            word1_address0 = 'bx;
        end
    end else begin
        word1_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        word1_ce0 = 1'b1;
    end else begin
        word1_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln302_fu_153_p2 = (ap_sig_allocacmp_j_3 + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage3;

assign icmp_ln302_fu_147_p2 = ((ap_sig_allocacmp_j_3 == 3'd4) ? 1'b1 : 1'b0);

assign j_cast2_fu_159_p1 = ap_sig_allocacmp_j_3;

assign or_ln305_fu_181_p2 = (shl_ln_fu_168_p3 | 4'd1);

assign or_ln306_fu_223_p2 = (shl_ln_reg_325 | 4'd2);

assign or_ln307_fu_283_p2 = (shl_ln_reg_325_pp0_iter1_reg | 4'd3);

assign sext_ln305_fu_204_p1 = $signed(tmp_fu_197_p3);

assign sext_ln306_fu_240_p1 = $signed(tmp_s_fu_233_p3);

assign shl_ln_fu_168_p3 = {{trunc_ln304_fu_164_p1}, {2'd0}};

assign tmp_23_cast_fu_260_p3 = {{6'd45}, {j_3_reg_309}};

assign tmp_fu_197_p3 = {{1'd1}, {j_3_reg_309}};

assign tmp_s_fu_233_p3 = {{2'd2}, {j_3_reg_309}};

assign trunc_ln304_fu_164_p1 = ap_sig_allocacmp_j_3[1:0];

assign xor_ln304_fu_217_p2 = (zext_ln304_fu_213_p1 ^ statemt_q1);

assign xor_ln305_fu_253_p2 = (zext_ln305_fu_249_p1 ^ reg_134);

assign xor_ln306_fu_276_p2 = (zext_ln306_fu_272_p1 ^ reg_134);

assign xor_ln307_fu_296_p2 = (zext_ln307_fu_293_p1 ^ statemt_q0);

assign zext_ln304_1_fu_176_p1 = shl_ln_fu_168_p3;

assign zext_ln304_fu_213_p1 = word1_q0;

assign zext_ln305_1_fu_187_p1 = or_ln305_fu_181_p2;

assign zext_ln305_3_fu_208_p1 = $unsigned(sext_ln305_fu_204_p1);

assign zext_ln305_fu_249_p1 = word1_q0;

assign zext_ln306_1_fu_228_p1 = or_ln306_fu_223_p2;

assign zext_ln306_3_fu_244_p1 = $unsigned(sext_ln306_fu_240_p1);

assign zext_ln306_fu_272_p1 = word1_q0;

assign zext_ln307_1_fu_288_p1 = or_ln307_fu_283_p2;

assign zext_ln307_3_fu_267_p1 = tmp_23_cast_fu_260_p3;

assign zext_ln307_fu_293_p1 = word1_load_3_reg_366;

always @ (posedge ap_clk) begin
    shl_ln_reg_325[1:0] <= 2'b00;
    shl_ln_reg_325_pp0_iter1_reg[1:0] <= 2'b00;
    statemt_addr_1_reg_331[1:0] <= 2'b00;
    statemt_addr_1_reg_331[4] <= 1'b0;
    statemt_addr_2_reg_336[1:0] <= 2'b01;
    statemt_addr_2_reg_336[4] <= 1'b0;
    statemt_addr_3_reg_351[1:0] <= 2'b10;
    statemt_addr_3_reg_351[4] <= 1'b0;
    statemt_addr_reg_371[1:0] <= 2'b11;
    statemt_addr_reg_371[4] <= 1'b0;
end


//ssign new_locking_key[99:0] = locking_key[99:0];
//assign new_locking_key[199:100] = locking_key[99:0];
//assign new_locking_key[299:200] = locking_key[99:0];
//assign new_locking_key[399:300] = locking_key[99:0];
//assign new_locking_key[499:400] = locking_key[99:0];
//assign new_locking_key[599:500] = locking_key[99:0];
endmodule //aes_main_aes_func_call_Pipeline_VITIS_LOOP_302_1
