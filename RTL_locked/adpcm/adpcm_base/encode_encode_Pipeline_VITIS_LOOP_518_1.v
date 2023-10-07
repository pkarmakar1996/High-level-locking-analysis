// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module encode_encode_Pipeline_VITIS_LOOP_518_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        zl,
        zl_1_out,
        zl_1_out_ap_vld,
        delay_bpl_address0,
        delay_bpl_ce0,
        delay_bpl_q0,
        delay_dltx_address0,
        delay_dltx_ce0,
        delay_dltx_q0,
        locking_key
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [47:0] zl;
output  [45:0] zl_1_out;
output   zl_1_out_ap_vld;
output  [2:0] delay_bpl_address0;
output   delay_bpl_ce0;
input  [31:0] delay_bpl_q0;
output  [2:0] delay_dltx_address0;
output   delay_dltx_ce0;
input  [15:0] delay_dltx_q0;

input [149:0] locking_key;

reg ap_idle;
reg zl_1_out_ap_vld;
reg delay_bpl_ce0;
reg delay_dltx_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln518_fu_109_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln518_reg_201;
reg   [0:0] icmp_ln518_reg_201_pp0_iter1_reg;
reg   [0:0] icmp_ln518_reg_201_pp0_iter2_reg;
reg  signed [31:0] delay_bpl_load_reg_215;
reg  signed [15:0] delay_dltx_load_reg_220;
wire   [47:0] mul_ln519_fu_152_p2;
reg   [47:0] mul_ln519_reg_225;
wire   [63:0] zext_ln516_fu_118_p1;
wire    ap_block_pp0_stage0;
reg   [2:0] idx235_fu_36;
wire   [2:0] add_ln518_fu_130_p2;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_idx235_load;
reg   [49:0] zl_1_fu_40;
wire   [49:0] zl_4_fu_169_p2;
wire  signed [49:0] zl_cast3_fu_87_p1;
reg   [2:0] i_4_fu_44;
wire   [2:0] i_7_fu_124_p2;
reg   [2:0] ap_sig_allocacmp_i;
wire    ap_block_pp0_stage0_01001;
wire  signed [49:0] sext_ln519_3_fu_166_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

encode_mul_16s_32s_48_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 48 ))
mul_16s_32s_48_1_1_U11(
    .din0(delay_dltx_load_reg_220),
    .din1(delay_bpl_load_reg_215),
    .dout(mul_ln519_fu_152_p2)
);

encode_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
    .locking_key(locking_key[149:0])
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b0))) begin
        ap_loop_exit_ready_pp0_iter3_reg <= 1'b0;
    end else if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln518_fu_109_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_4_fu_44 <= i_7_fu_124_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_4_fu_44 <= 3'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln518_fu_109_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            idx235_fu_36 <= add_ln518_fu_130_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            idx235_fu_36 <= 3'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            zl_1_fu_40 <= zl_cast3_fu_87_p1;
        end else if (((icmp_ln518_reg_201_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            zl_1_fu_40 <= zl_4_fu_169_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln518_reg_201 <= icmp_ln518_fu_109_p2;
        icmp_ln518_reg_201_pp0_iter1_reg <= icmp_ln518_reg_201;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln518_reg_201 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        delay_bpl_load_reg_215 <= delay_bpl_q0;
        delay_dltx_load_reg_220 <= delay_dltx_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln518_reg_201_pp0_iter2_reg <= icmp_ln518_reg_201_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln518_reg_201_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul_ln519_reg_225 <= mul_ln519_fu_152_p2;
    end
end

always @ (*) begin
    if (((icmp_ln518_fu_109_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
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
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i = 3'd1;
    end else begin
        ap_sig_allocacmp_i = i_4_fu_44;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_idx235_load = 3'd1;
    end else begin
        ap_sig_allocacmp_idx235_load = idx235_fu_36;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        delay_bpl_ce0 = 1'b1;
    end else begin
        delay_bpl_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        delay_dltx_ce0 = 1'b1;
    end else begin
        delay_dltx_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln518_reg_201_pp0_iter2_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        zl_1_out_ap_vld = 1'b1;
    end else begin
        zl_1_out_ap_vld = 1'b0;
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

assign add_ln518_fu_130_p2 = (ap_sig_allocacmp_idx235_load + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign delay_bpl_address0 = zext_ln516_fu_118_p1;

assign delay_dltx_address0 = zext_ln516_fu_118_p1;

assign i_7_fu_124_p2 = (ap_sig_allocacmp_i + 3'd1);

assign icmp_ln518_fu_109_p2 = ((ap_sig_allocacmp_i == 3'd6) ? 1'b1 : 1'b0);

assign sext_ln519_3_fu_166_p1 = $signed(mul_ln519_reg_225);

assign zext_ln516_fu_118_p1 = ap_sig_allocacmp_idx235_load;

assign zl_1_out = zl_1_fu_40[45:0];

assign zl_4_fu_169_p2 = ($signed(sext_ln519_3_fu_166_p1) + $signed(zl_1_fu_40));

assign zl_cast3_fu_87_p1 = $signed(zl);

endmodule //encode_encode_Pipeline_VITIS_LOOP_518_1
