// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module encode_encode_Pipeline_VITIS_LOOP_602_23 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        conv8_i134,
        delay_dhx_address0,
        delay_dhx_ce0,
        delay_dhx_q0,
        delay_bph_address0,
        delay_bph_ce0,
        delay_bph_we0,
        delay_bph_d0,
        delay_bph_address1,
        delay_bph_ce1,
        delay_bph_q1,
        locking_key
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] conv8_i134;
output  [2:0] delay_dhx_address0;
output   delay_dhx_ce0;
input  [31:0] delay_dhx_q0;
output  [2:0] delay_bph_address0;
output   delay_bph_ce0;
output   delay_bph_we0;
output  [31:0] delay_bph_d0;
output  [2:0] delay_bph_address1;
output   delay_bph_ce1;
input  [31:0] delay_bph_q1;

input[149:0] locking_key;
wire[149:0] working_key;

reg ap_idle;
reg delay_dhx_ce0;
reg delay_bph_ce0;
reg delay_bph_we0;
reg delay_bph_ce1;

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
wire   [0:0] icmp_ln602_fu_103_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire  signed [63:0] conv8_i134_cast_fu_91_p1;
reg  signed [63:0] conv8_i134_cast_reg_189;
wire    ap_block_pp0_stage0_11001;
reg   [2:0] delay_bph_addr_reg_203;
reg   [2:0] delay_bph_addr_reg_203_pp0_iter1_reg;
reg   [2:0] delay_bph_addr_reg_203_pp0_iter2_reg;
reg  signed [31:0] delay_dhx_load_reg_209;
wire   [63:0] mul_ln604_fu_129_p2;
reg   [63:0] mul_ln604_reg_214;
reg  signed [31:0] delay_bph_load_reg_219;
wire   [63:0] i_11_cast_fu_115_p1;
wire    ap_block_pp0_stage0;
reg   [2:0] i_fu_52;
wire   [2:0] add_ln602_fu_109_p2;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_i_1;
wire  signed [31:0] mul_ln604_fu_129_p1;
wire   [0:0] tmp_fu_134_p3;
wire   [39:0] shl_ln608_1_fu_152_p3;
wire  signed [39:0] sext_ln608_fu_149_p1;
wire   [39:0] sub_ln608_fu_159_p2;
wire   [31:0] wd3_fu_165_p4;
wire   [31:0] select_ln608_fu_141_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
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

encode_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U35(
    .din0(delay_dhx_load_reg_209),
    .din1(mul_ln604_fu_129_p1),
    .dout(mul_ln604_fu_129_p2)
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln602_fu_103_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_52 <= add_ln602_fu_109_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_52 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        conv8_i134_cast_reg_189 <= conv8_i134_cast_fu_91_p1;
        delay_bph_addr_reg_203_pp0_iter1_reg <= delay_bph_addr_reg_203;
        delay_dhx_load_reg_209 <= delay_dhx_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln602_fu_103_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        delay_bph_addr_reg_203 <= i_11_cast_fu_115_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        delay_bph_addr_reg_203_pp0_iter2_reg <= delay_bph_addr_reg_203_pp0_iter1_reg;
        mul_ln604_reg_214 <= mul_ln604_fu_129_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        delay_bph_load_reg_219 <= delay_bph_q1;
    end
end

always @ (*) begin
    if (((icmp_ln602_fu_103_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
        ap_ready_int = 1'b0^ working_key[63];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_1 = 3'd0^ working_key[62:60];
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_52;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        delay_bph_ce0 = 1'b1^ working_key[59];
    end else begin
        delay_bph_ce0 = 1'b0^ working_key[58];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        delay_bph_ce1 = 1'b1^ working_key[57];
    end else begin
        delay_bph_ce1 = 1'b0^ working_key[56];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        delay_bph_we0 = 1'b1^ working_key[55];
    end else begin
        delay_bph_we0 = 1'b0^ working_key[54];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        delay_dhx_ce0 = 1'b1^ working_key[53];
    end else begin
        delay_dhx_ce0 = 1'b0^ working_key[52];
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

assign add_ln602_fu_109_p2 = (ap_sig_allocacmp_i_1 + (3'd1 ^ working_key[51:49]));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign conv8_i134_cast_fu_91_p1 = $signed(conv8_i134);

assign delay_bph_address0 = delay_bph_addr_reg_203_pp0_iter2_reg;

assign delay_bph_address1 = delay_bph_addr_reg_203;

assign delay_bph_d0 = (wd3_fu_165_p4 + select_ln608_fu_141_p3);

assign delay_dhx_address0 = i_11_cast_fu_115_p1;

assign i_11_cast_fu_115_p1 = ap_sig_allocacmp_i_1;

assign icmp_ln602_fu_103_p2 = ((ap_sig_allocacmp_i_1 == 3'd6) ? 1'b1 : 1'b0);

assign mul_ln604_fu_129_p1 = conv8_i134_cast_reg_189;

assign select_ln608_fu_141_p3 = ((tmp_fu_134_p3[0:0] == 1'b1) ? 32'd4294967168 : 32'd128);

assign sext_ln608_fu_149_p1 = delay_bph_load_reg_219;

assign shl_ln608_1_fu_152_p3 = {{delay_bph_load_reg_219}, {8'd0}};

assign sub_ln608_fu_159_p2 = ($signed(shl_ln608_1_fu_152_p3) - $signed(sext_ln608_fu_149_p1));

assign tmp_fu_134_p3 = mul_ln604_reg_214[32'd63];

assign wd3_fu_165_p4 = {{sub_ln608_fu_159_p2[39:8]}};

assign working_key[149:0] = locking_key[149:0];
endmodule //encode_encode_Pipeline_VITIS_LOOP_602_23
