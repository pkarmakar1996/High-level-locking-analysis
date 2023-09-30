// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module aes_main_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        key_address0,
        key_ce0,
        key_q0,
        word_address0,
        word_ce0,
        word_we0,
        word_d0,
        locking_key
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] key_address0;
output   key_ce0;
input  [7:0] key_q0;
output  [8:0] word_address0;
output   word_ce0;
output   word_we0;
output  [31:0] word_d0;

input[99:0] locking_key;
wire[99:0] new_locking_key;


reg ap_idle;
reg key_ce0;
reg word_ce0;
reg word_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln71_fu_112_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [2:0] select_ln71_fu_142_p3;
reg   [2:0] select_ln71_reg_285;
wire    ap_block_pp0_stage0_11001;
wire   [2:0] select_ln71_1_fu_150_p3;
reg   [2:0] select_ln71_1_reg_291;
wire   [63:0] zext_ln73_fu_180_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln73_4_fu_251_p1;
reg   [2:0] i_fu_56;
wire   [2:0] add_ln72_fu_185_p2;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_i_load;
reg   [2:0] j_fu_60;
reg   [2:0] ap_sig_allocacmp_j_load;
reg   [4:0] indvar_flatten_fu_64;
wire   [4:0] add_ln71_1_fu_118_p2;
reg   [4:0] ap_sig_allocacmp_indvar_flatten_load;
wire   [0:0] icmp_ln72_fu_136_p2;
wire   [2:0] add_ln71_fu_130_p2;
wire   [1:0] trunc_ln71_fu_158_p1;
wire   [3:0] i_cast_fu_170_p1;
wire   [3:0] p_mid2_fu_162_p3;
wire   [3:0] add_ln73_fu_174_p2;
wire   [9:0] tmp_1_fu_206_p3;
wire   [5:0] tmp_2_fu_217_p3;
wire   [10:0] zext_ln73_2_fu_213_p1;
wire   [10:0] zext_ln73_3_fu_224_p1;
wire   [10:0] sub_ln73_fu_228_p2;
wire   [5:0] tmp_4_cast_fu_234_p4;
wire   [8:0] tmp_5_fu_244_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln71_fu_112_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_56 <= add_ln72_fu_185_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_56 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln71_fu_112_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten_fu_64 <= add_ln71_1_fu_118_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_64 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln71_fu_112_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            j_fu_60 <= select_ln71_1_fu_150_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_60 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln71_fu_112_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln71_1_reg_291 <= select_ln71_1_fu_150_p3;
        select_ln71_reg_285 <= select_ln71_fu_142_p3;
    end
end

always @ (*) begin
    if (((icmp_ln71_fu_112_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_load = 3'd0;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_56;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten_load = 5'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_64;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_j_load = 3'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_60;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        key_ce0 = 1'b1;
    end else begin
        key_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        word_ce0 = 1'b1;
    end else begin
        word_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        word_we0 = 1'b1;
    end else begin
        word_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln71_1_fu_118_p2 = (ap_sig_allocacmp_indvar_flatten_load + 5'd1);

assign add_ln71_fu_130_p2 = (ap_sig_allocacmp_j_load + 3'd1);

assign add_ln72_fu_185_p2 = (select_ln71_fu_142_p3 + 3'd1);

assign add_ln73_fu_174_p2 = (i_cast_fu_170_p1 + p_mid2_fu_162_p3);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign i_cast_fu_170_p1 = select_ln71_fu_142_p3;

assign icmp_ln71_fu_112_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln72_fu_136_p2 = ((ap_sig_allocacmp_i_load == 3'd4) ? 1'b1 : 1'b0);

assign key_address0 = zext_ln73_fu_180_p1;

assign p_mid2_fu_162_p3 = {{trunc_ln71_fu_158_p1}, {2'd0}};

assign select_ln71_1_fu_150_p3 = ((icmp_ln72_fu_136_p2[0:0] == 1'b1) ? add_ln71_fu_130_p2 : ap_sig_allocacmp_j_load);

assign select_ln71_fu_142_p3 = ((icmp_ln72_fu_136_p2[0:0] == 1'b1) ? 3'd0 : ap_sig_allocacmp_i_load);

assign sub_ln73_fu_228_p2 = (zext_ln73_2_fu_213_p1 - zext_ln73_3_fu_224_p1);

assign tmp_1_fu_206_p3 = {{select_ln71_reg_285}, {7'd0}};

assign tmp_2_fu_217_p3 = {{select_ln71_reg_285}, {3'd0}};

assign tmp_4_cast_fu_234_p4 = {{sub_ln73_fu_228_p2[8:3]}};

assign tmp_5_fu_244_p3 = {{tmp_4_cast_fu_234_p4}, {select_ln71_1_reg_291}};

assign trunc_ln71_fu_158_p1 = select_ln71_1_fu_150_p3[1:0];

assign word_address0 = zext_ln73_4_fu_251_p1;

assign word_d0 = key_q0;

assign zext_ln73_2_fu_213_p1 = tmp_1_fu_206_p3;

assign zext_ln73_3_fu_224_p1 = tmp_2_fu_217_p3;

assign zext_ln73_4_fu_251_p1 = tmp_5_fu_244_p3;

assign zext_ln73_fu_180_p1 = add_ln73_fu_174_p2;


assign new_locking_key= locking_key[99:0];

endmodule //aes_main_encrypt_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2
