// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module aes_main_encrypt_Pipeline_VITIS_LOOP_76_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        word_address0,
        word_ce0,
        word_we0,
        word_d0,
        word_q0,
        word_address1,
        word_ce1,
        word_we1,
        word_d1,
        word_q1,
        Sbox_address0,
        Sbox_ce0,
        Sbox_q0,
        locking_key
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_state6 = 7'd32;
parameter    ap_ST_fsm_state7 = 7'd64;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [8:0] word_address0;
output   word_ce0;
output   word_we0;
output  [31:0] word_d0;
input  [31:0] word_q0;
output  [8:0] word_address1;
output   word_ce1;
output   word_we1;
output  [31:0] word_d1;
input  [31:0] word_q1;
output  [7:0] Sbox_address0;
output   Sbox_ce0;
input  [7:0] Sbox_q0;

input[99:0] locking_key;
reg[99:0] new_locking_key;
always @ (locking_key)
    begin
        new_locking_key[99:0] = locking_key[99:0];
    end



reg ap_idle;
reg[8:0] word_address0;
reg word_ce0;
reg word_we0;
reg[31:0] word_d0;
reg[8:0] word_address1;
reg word_ce1;
reg word_we1;
reg[31:0] word_d1;
reg[7:0] Sbox_address0;
reg Sbox_ce0;

(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln76_fu_267_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_state7;
wire    ap_block_state7_pp0_stage6_iter0;
wire   [4:0] Rcon0_address0;
reg    Rcon0_ce0;
wire   [7:0] Rcon0_q0;
reg   [31:0] reg_251;
wire    ap_CS_fsm_state2;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_CS_fsm_state5;
wire    ap_block_state5_pp0_stage4_iter0;
reg   [31:0] reg_255;
wire    ap_CS_fsm_state3;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_CS_fsm_state4;
wire    ap_block_state4_pp0_stage3_iter0;
reg   [5:0] j_1_reg_972;
wire   [5:0] add_ln80_fu_273_p2;
reg   [5:0] add_ln80_reg_985;
wire   [8:0] zext_ln80_3_fu_279_p1;
reg   [8:0] zext_ln80_3_reg_990;
wire   [3:0] trunc_ln88_fu_344_p1;
reg   [3:0] trunc_ln88_reg_1020;
reg   [31:0] temp_2_1_reg_1025;
wire   [3:0] trunc_ln89_fu_352_p1;
reg   [3:0] trunc_ln89_reg_1031;
reg   [0:0] tmp_reg_1037;
reg   [3:0] trunc_ln186_4_reg_1043;
wire   [3:0] sub_ln186_8_fu_376_p2;
reg   [3:0] sub_ln186_8_reg_1048;
reg   [7:0] Rcon0_load_reg_1053;
reg   [0:0] tmp_1_reg_1058;
reg   [3:0] trunc_ln186_6_reg_1064;
reg   [31:0] word_load_6_reg_1069;
wire   [3:0] trunc_ln83_fu_398_p1;
reg   [3:0] trunc_ln83_reg_1075;
wire   [3:0] trunc_ln87_fu_406_p1;
reg   [3:0] trunc_ln87_reg_1081;
wire   [7:0] add_ln186_1_fu_568_p2;
reg   [7:0] add_ln186_1_reg_1092;
reg   [0:0] tmp_3_reg_1097;
reg   [3:0] trunc_ln186_8_reg_1103;
reg   [0:0] tmp_8_reg_1108;
reg   [3:0] trunc_ln186_s_reg_1114;
wire   [5:0] empty_20_fu_606_p2;
reg   [5:0] empty_20_reg_1119;
wire   [0:0] icmp_ln78_fu_634_p2;
reg   [0:0] icmp_ln78_reg_1134;
wire   [7:0] add_ln186_2_fu_727_p2;
reg   [7:0] add_ln186_2_reg_1146;
wire   [7:0] add_ln186_3_fu_808_p2;
reg   [7:0] add_ln186_3_reg_1151;
wire   [31:0] xor_ln97_fu_847_p2;
reg   [31:0] xor_ln97_reg_1166;
wire   [8:0] zext_ln97_1_fu_893_p1;
reg   [8:0] zext_ln97_1_reg_1176;
wire    ap_CS_fsm_state6;
wire    ap_block_state6_pp0_stage5_iter0;
wire   [63:0] zext_ln80_5_fu_293_p1;
wire   [63:0] zext_ln81_1_fu_304_p1;
wire   [63:0] zext_ln80_fu_325_p1;
wire   [63:0] zext_ln82_1_fu_339_p1;
wire   [63:0] zext_ln80_1_fu_330_p1;
wire   [63:0] zext_ln186_2_fu_489_p1;
wire   [63:0] zext_ln97_fu_611_p1;
wire   [63:0] zext_ln97_8_fu_626_p1;
wire   [63:0] zext_ln186_5_fu_649_p1;
wire   [63:0] zext_ln97_9_fu_831_p1;
wire   [63:0] zext_ln97_10_fu_842_p1;
wire   [63:0] j_1_cast2_fu_853_p1;
wire   [63:0] zext_ln97_3_fu_866_p1;
wire   [63:0] zext_ln186_8_fu_875_p1;
wire   [63:0] zext_ln97_4_fu_902_p1;
wire   [63:0] zext_ln186_11_fu_911_p1;
wire   [63:0] zext_ln97_5_fu_933_p1;
reg   [5:0] j_fu_76;
wire   [5:0] add_ln76_fu_955_p2;
wire    ap_loop_init;
reg   [5:0] ap_sig_allocacmp_j_1;
wire   [31:0] xor_ln97_1_fu_886_p2;
wire   [31:0] xor_ln97_2_fu_921_p2;
wire   [31:0] xor_ln97_3_fu_948_p2;
wire   [7:0] zext_ln80_4_fu_283_p1;
wire   [7:0] add_ln80_2_fu_287_p2;
wire   [8:0] add_ln81_fu_298_p2;
wire   [3:0] trunc_ln5_fu_309_p4;
wire   [3:0] add_ln80_1_fu_319_p2;
wire   [8:0] add_ln82_fu_334_p2;
wire   [7:0] trunc_ln88_1_fu_348_p1;
wire   [7:0] sub_ln186_fu_360_p2;
wire   [7:0] trunc_ln89_1_fu_356_p1;
wire   [7:0] sub_ln186_2_fu_382_p2;
wire   [3:0] sub_ln186_1_fu_414_p2;
wire   [3:0] tmp_6_fu_419_p4;
wire   [3:0] select_ln186_fu_429_p3;
wire   [4:0] p_and_f1_fu_444_p3;
wire   [4:0] p_and_t1_fu_455_p3;
wire   [5:0] zext_ln186_1_fu_462_p1;
wire   [5:0] sub_ln186_9_fu_466_p2;
wire   [5:0] zext_ln186_fu_451_p1;
wire   [5:0] select_ln186_1_fu_472_p3;
wire   [7:0] tmp_7_fu_436_p3;
wire  signed [7:0] sext_ln186_fu_479_p1;
wire   [7:0] add_ln186_fu_483_p2;
wire   [3:0] sub_ln186_3_fu_494_p2;
wire   [3:0] tmp_s_fu_499_p4;
wire   [3:0] select_ln186_2_fu_508_p3;
wire   [4:0] p_and_f2_fu_523_p3;
wire   [3:0] sub_ln186_10_fu_534_p2;
wire   [4:0] p_and_t2_fu_539_p3;
wire   [5:0] zext_ln186_4_fu_547_p1;
wire   [5:0] sub_ln186_11_fu_551_p2;
wire   [5:0] zext_ln186_3_fu_530_p1;
wire   [5:0] select_ln186_3_fu_557_p3;
wire   [7:0] tmp_2_fu_515_p3;
wire  signed [7:0] sext_ln186_1_fu_564_p1;
wire   [7:0] trunc_ln83_1_fu_402_p1;
wire   [7:0] sub_ln186_4_fu_574_p2;
wire   [7:0] trunc_ln87_1_fu_410_p1;
wire   [7:0] sub_ln186_6_fu_590_p2;
wire   [7:0] zext_ln97_7_fu_616_p1;
wire   [7:0] add_ln97_3_fu_620_p2;
wire   [1:0] empty_19_fu_631_p1;
wire   [7:0] temp_0_2_fu_640_p2;
wire   [3:0] sub_ln186_5_fu_653_p2;
wire   [3:0] tmp_4_fu_658_p4;
wire   [3:0] select_ln186_4_fu_667_p3;
wire   [4:0] p_and_f5_fu_682_p3;
wire   [3:0] sub_ln186_12_fu_693_p2;
wire   [4:0] p_and_t7_fu_698_p3;
wire   [5:0] zext_ln186_7_fu_706_p1;
wire   [5:0] sub_ln186_13_fu_710_p2;
wire   [5:0] zext_ln186_6_fu_689_p1;
wire   [5:0] select_ln186_5_fu_716_p3;
wire   [7:0] tmp_5_fu_674_p3;
wire  signed [7:0] sext_ln186_2_fu_723_p1;
wire   [3:0] sub_ln186_7_fu_733_p2;
wire   [3:0] tmp_9_fu_738_p4;
wire   [3:0] select_ln186_6_fu_748_p3;
wire   [4:0] p_and_f_fu_763_p3;
wire   [3:0] sub_ln186_14_fu_774_p2;
wire   [4:0] p_and_t_fu_779_p3;
wire   [5:0] zext_ln186_10_fu_787_p1;
wire   [5:0] sub_ln186_15_fu_791_p2;
wire   [5:0] zext_ln186_9_fu_770_p1;
wire   [5:0] select_ln186_7_fu_797_p3;
wire   [7:0] tmp_10_fu_755_p3;
wire  signed [7:0] sext_ln186_3_fu_804_p1;
wire   [31:0] zext_ln80_2_fu_645_p1;
wire   [8:0] zext_ln97_6_fu_822_p1;
wire   [8:0] add_ln97_4_fu_825_p2;
wire   [8:0] add_ln97_5_fu_836_p2;
wire   [31:0] temp_0_fu_814_p3;
wire   [7:0] zext_ln97_2_fu_857_p1;
wire   [7:0] add_ln97_fu_860_p2;
wire   [31:0] zext_ln81_fu_871_p1;
wire   [31:0] temp_1_2_fu_879_p3;
wire   [8:0] add_ln97_1_fu_896_p2;
wire   [31:0] zext_ln82_fu_907_p1;
wire   [31:0] temp_2_2_fu_915_p3;
wire   [8:0] add_ln97_2_fu_928_p2;
wire   [31:0] zext_ln78_fu_938_p1;
wire   [31:0] select_ln78_fu_942_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [6:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'd1;
#0 ap_done_reg = 1'b0;
end

aes_main_encrypt_Pipeline_VITIS_LOOP_76_3_Rcon0_ROM_AUTO_1R #(
    .DataWidth( 8 ),
    .AddressRange( 30 ),
    .AddressWidth( 5 ))
Rcon0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(Rcon0_address0),
    .ce0(Rcon0_ce0),
    .q0(Rcon0_q0),
    .locking_key(locking_key[99:0])
);

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
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        j_fu_76 <= 6'd4;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        j_fu_76 <= add_ln76_fu_955_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        Rcon0_load_reg_1053 <= Rcon0_q0;
        sub_ln186_8_reg_1048 <= sub_ln186_8_fu_376_p2;
        temp_2_1_reg_1025 <= word_q0;
        tmp_1_reg_1058 <= word_q0[32'd31];
        tmp_reg_1037 <= word_q1[32'd31];
        trunc_ln186_4_reg_1043 <= {{sub_ln186_fu_360_p2[7:4]}};
        trunc_ln186_6_reg_1064 <= {{sub_ln186_2_fu_382_p2[7:4]}};
        trunc_ln88_reg_1020 <= trunc_ln88_fu_344_p1;
        trunc_ln89_reg_1031 <= trunc_ln89_fu_352_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        add_ln186_1_reg_1092 <= add_ln186_1_fu_568_p2;
        empty_20_reg_1119 <= empty_20_fu_606_p2;
        tmp_3_reg_1097 <= word_q1[32'd31];
        tmp_8_reg_1108 <= word_q0[32'd31];
        trunc_ln186_8_reg_1103 <= {{sub_ln186_4_fu_574_p2[7:4]}};
        trunc_ln186_s_reg_1114 <= {{sub_ln186_6_fu_590_p2[7:4]}};
        trunc_ln83_reg_1075 <= trunc_ln83_fu_398_p1;
        trunc_ln87_reg_1081 <= trunc_ln87_fu_406_p1;
        word_load_6_reg_1069 <= word_q1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        add_ln186_2_reg_1146 <= add_ln186_2_fu_727_p2;
        add_ln186_3_reg_1151 <= add_ln186_3_fu_808_p2;
        icmp_ln78_reg_1134 <= icmp_ln78_fu_634_p2;
        xor_ln97_reg_1166 <= xor_ln97_fu_847_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (icmp_ln76_fu_267_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        add_ln80_reg_985 <= add_ln80_fu_273_p2;
        zext_ln80_3_reg_990[5 : 0] <= zext_ln80_3_fu_279_p1[5 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        j_1_reg_972 <= ap_sig_allocacmp_j_1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2))) begin
        reg_251 <= word_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        reg_255 <= word_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        zext_ln97_1_reg_1176[5 : 0] <= zext_ln97_1_fu_893_p1[5 : 0];
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        Rcon0_ce0 = 1'b1;
    end else begin
        Rcon0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln78_reg_1134 == 1'd1))) begin
        Sbox_address0 = zext_ln186_11_fu_911_p1;
    end else if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln78_reg_1134 == 1'd1))) begin
        Sbox_address0 = zext_ln186_8_fu_875_p1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        Sbox_address0 = zext_ln186_5_fu_649_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        Sbox_address0 = zext_ln186_2_fu_489_p1;
    end else begin
        Sbox_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | ((1'b1 == ap_CS_fsm_state5) & (icmp_ln78_reg_1134 == 1'd1)) | ((1'b1 == ap_CS_fsm_state6) & (icmp_ln78_reg_1134 == 1'd1)))) begin
        Sbox_ce0 = 1'b1;
    end else begin
        Sbox_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
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

always @ (*) begin
    if (((ap_start_int == 1'b1) & (icmp_ln76_fu_267_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_j_1 = 6'd4;
    end else begin
        ap_sig_allocacmp_j_1 = j_fu_76;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        word_address0 = zext_ln97_4_fu_902_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        word_address0 = zext_ln97_3_fu_866_p1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        word_address0 = zext_ln97_10_fu_842_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        word_address0 = zext_ln97_8_fu_626_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_address0 = zext_ln80_1_fu_330_p1;
    end else if (((icmp_ln76_fu_267_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        word_address0 = zext_ln81_1_fu_304_p1;
    end else begin
        word_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        word_address1 = zext_ln97_5_fu_933_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        word_address1 = j_1_cast2_fu_853_p1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        word_address1 = zext_ln97_9_fu_831_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        word_address1 = zext_ln97_fu_611_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_address1 = zext_ln82_1_fu_339_p1;
    end else if (((icmp_ln76_fu_267_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        word_address1 = zext_ln80_5_fu_293_p1;
    end else begin
        word_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state6) | ((ap_start_int == 1'b1) & (icmp_ln76_fu_267_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        word_ce0 = 1'b1;
    end else begin
        word_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state7) | ((ap_start_int == 1'b1) & (icmp_ln76_fu_267_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        word_ce1 = 1'b1;
    end else begin
        word_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        word_d0 = xor_ln97_2_fu_921_p2;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        word_d0 = xor_ln97_1_fu_886_p2;
    end else begin
        word_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        word_d1 = xor_ln97_3_fu_948_p2;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        word_d1 = xor_ln97_reg_1166;
    end else begin
        word_d1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        word_we0 = 1'b1;
    end else begin
        word_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state7))) begin
        word_we1 = 1'b1;
    end else begin
        word_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start_int == 1'b1) & (icmp_ln76_fu_267_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Rcon0_address0 = zext_ln80_fu_325_p1;

assign add_ln186_1_fu_568_p2 = ($signed(tmp_2_fu_515_p3) + $signed(sext_ln186_1_fu_564_p1));

assign add_ln186_2_fu_727_p2 = ($signed(tmp_5_fu_674_p3) + $signed(sext_ln186_2_fu_723_p1));

assign add_ln186_3_fu_808_p2 = ($signed(tmp_10_fu_755_p3) + $signed(sext_ln186_3_fu_804_p1));

assign add_ln186_fu_483_p2 = ($signed(tmp_7_fu_436_p3) + $signed(sext_ln186_fu_479_p1));

assign add_ln76_fu_955_p2 = (j_1_reg_972 + 6'd1);

assign add_ln80_1_fu_319_p2 = ($signed(trunc_ln5_fu_309_p4) + $signed(4'd15));

assign add_ln80_2_fu_287_p2 = (zext_ln80_4_fu_283_p1 + 8'd120);

assign add_ln80_fu_273_p2 = ($signed(ap_sig_allocacmp_j_1) + $signed(6'd63));

assign add_ln81_fu_298_p2 = (zext_ln80_3_fu_279_p1 + 9'd240);

assign add_ln82_fu_334_p2 = ($signed(zext_ln80_3_reg_990) + $signed(9'd360));

assign add_ln97_1_fu_896_p2 = (zext_ln97_1_fu_893_p1 + 9'd240);

assign add_ln97_2_fu_928_p2 = ($signed(zext_ln97_1_reg_1176) + $signed(9'd360));

assign add_ln97_3_fu_620_p2 = (zext_ln97_7_fu_616_p1 + 8'd120);

assign add_ln97_4_fu_825_p2 = (zext_ln97_6_fu_822_p1 + 9'd240);

assign add_ln97_5_fu_836_p2 = ($signed(zext_ln97_6_fu_822_p1) + $signed(9'd360));

assign add_ln97_fu_860_p2 = (zext_ln97_2_fu_857_p1 + 8'd120);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage6_iter0 = ~(1'b1 == 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign empty_19_fu_631_p1 = j_1_reg_972[1:0];

assign empty_20_fu_606_p2 = ($signed(j_1_reg_972) + $signed(6'd60));

assign icmp_ln76_fu_267_p2 = ((ap_sig_allocacmp_j_1 == 6'd44) ? 1'b1 : 1'b0);

assign icmp_ln78_fu_634_p2 = ((empty_19_fu_631_p1 == 2'd0) ? 1'b1 : 1'b0);

assign j_1_cast2_fu_853_p1 = j_1_reg_972;

assign p_and_f1_fu_444_p3 = {{1'd0}, {trunc_ln88_reg_1020}};

assign p_and_f2_fu_523_p3 = {{1'd0}, {trunc_ln89_reg_1031}};

assign p_and_f5_fu_682_p3 = {{1'd0}, {trunc_ln83_reg_1075}};

assign p_and_f_fu_763_p3 = {{1'd0}, {trunc_ln87_reg_1081}};

assign p_and_t1_fu_455_p3 = {{1'd0}, {sub_ln186_8_reg_1048}};

assign p_and_t2_fu_539_p3 = {{1'd0}, {sub_ln186_10_fu_534_p2}};

assign p_and_t7_fu_698_p3 = {{1'd0}, {sub_ln186_12_fu_693_p2}};

assign p_and_t_fu_779_p3 = {{1'd0}, {sub_ln186_14_fu_774_p2}};

assign select_ln186_1_fu_472_p3 = ((tmp_reg_1037[0:0] == 1'b1) ? sub_ln186_9_fu_466_p2 : zext_ln186_fu_451_p1);

assign select_ln186_2_fu_508_p3 = ((tmp_1_reg_1058[0:0] == 1'b1) ? sub_ln186_3_fu_494_p2 : tmp_s_fu_499_p4);

assign select_ln186_3_fu_557_p3 = ((tmp_1_reg_1058[0:0] == 1'b1) ? sub_ln186_11_fu_551_p2 : zext_ln186_3_fu_530_p1);

assign select_ln186_4_fu_667_p3 = ((tmp_3_reg_1097[0:0] == 1'b1) ? sub_ln186_5_fu_653_p2 : tmp_4_fu_658_p4);

assign select_ln186_5_fu_716_p3 = ((tmp_3_reg_1097[0:0] == 1'b1) ? sub_ln186_13_fu_710_p2 : zext_ln186_6_fu_689_p1);

assign select_ln186_6_fu_748_p3 = ((tmp_8_reg_1108[0:0] == 1'b1) ? sub_ln186_7_fu_733_p2 : tmp_9_fu_738_p4);

assign select_ln186_7_fu_797_p3 = ((tmp_8_reg_1108[0:0] == 1'b1) ? sub_ln186_15_fu_791_p2 : zext_ln186_9_fu_770_p1);

assign select_ln186_fu_429_p3 = ((tmp_reg_1037[0:0] == 1'b1) ? sub_ln186_1_fu_414_p2 : tmp_6_fu_419_p4);

assign select_ln78_fu_942_p3 = ((icmp_ln78_reg_1134[0:0] == 1'b1) ? zext_ln78_fu_938_p1 : word_load_6_reg_1069);

assign sext_ln186_1_fu_564_p1 = $signed(select_ln186_3_fu_557_p3);

assign sext_ln186_2_fu_723_p1 = $signed(select_ln186_5_fu_716_p3);

assign sext_ln186_3_fu_804_p1 = $signed(select_ln186_7_fu_797_p3);

assign sext_ln186_fu_479_p1 = $signed(select_ln186_1_fu_472_p3);

assign sub_ln186_10_fu_534_p2 = (4'd0 - trunc_ln89_reg_1031);

assign sub_ln186_11_fu_551_p2 = (6'd0 - zext_ln186_4_fu_547_p1);

assign sub_ln186_12_fu_693_p2 = (4'd0 - trunc_ln83_reg_1075);

assign sub_ln186_13_fu_710_p2 = (6'd0 - zext_ln186_7_fu_706_p1);

assign sub_ln186_14_fu_774_p2 = (4'd0 - trunc_ln87_reg_1081);

assign sub_ln186_15_fu_791_p2 = (6'd0 - zext_ln186_10_fu_787_p1);

assign sub_ln186_1_fu_414_p2 = (4'd0 - trunc_ln186_4_reg_1043);

assign sub_ln186_2_fu_382_p2 = (8'd0 - trunc_ln89_1_fu_356_p1);

assign sub_ln186_3_fu_494_p2 = (4'd0 - trunc_ln186_6_reg_1064);

assign sub_ln186_4_fu_574_p2 = (8'd0 - trunc_ln83_1_fu_402_p1);

assign sub_ln186_5_fu_653_p2 = (4'd0 - trunc_ln186_8_reg_1103);

assign sub_ln186_6_fu_590_p2 = (8'd0 - trunc_ln87_1_fu_410_p1);

assign sub_ln186_7_fu_733_p2 = (4'd0 - trunc_ln186_s_reg_1114);

assign sub_ln186_8_fu_376_p2 = (4'd0 - trunc_ln88_fu_344_p1);

assign sub_ln186_9_fu_466_p2 = (6'd0 - zext_ln186_1_fu_462_p1);

assign sub_ln186_fu_360_p2 = (8'd0 - trunc_ln88_1_fu_348_p1);

assign temp_0_2_fu_640_p2 = (Sbox_q0 ^ Rcon0_load_reg_1053);

assign temp_0_fu_814_p3 = ((icmp_ln78_fu_634_p2[0:0] == 1'b1) ? zext_ln80_2_fu_645_p1 : reg_255);

assign temp_1_2_fu_879_p3 = ((icmp_ln78_reg_1134[0:0] == 1'b1) ? zext_ln81_fu_871_p1 : reg_251);

assign temp_2_2_fu_915_p3 = ((icmp_ln78_reg_1134[0:0] == 1'b1) ? zext_ln82_fu_907_p1 : temp_2_1_reg_1025);

assign tmp_10_fu_755_p3 = {{select_ln186_6_fu_748_p3}, {4'd0}};

assign tmp_2_fu_515_p3 = {{select_ln186_2_fu_508_p3}, {4'd0}};

assign tmp_4_fu_658_p4 = {{word_load_6_reg_1069[7:4]}};

assign tmp_5_fu_674_p3 = {{select_ln186_4_fu_667_p3}, {4'd0}};

assign tmp_6_fu_419_p4 = {{reg_251[7:4]}};

assign tmp_7_fu_436_p3 = {{select_ln186_fu_429_p3}, {4'd0}};

assign tmp_9_fu_738_p4 = {{reg_255[7:4]}};

assign tmp_s_fu_499_p4 = {{temp_2_1_reg_1025[7:4]}};

assign trunc_ln5_fu_309_p4 = {{ap_sig_allocacmp_j_1[5:2]}};

assign trunc_ln83_1_fu_402_p1 = word_q1[7:0];

assign trunc_ln83_fu_398_p1 = word_q1[3:0];

assign trunc_ln87_1_fu_410_p1 = word_q0[7:0];

assign trunc_ln87_fu_406_p1 = word_q0[3:0];

assign trunc_ln88_1_fu_348_p1 = word_q1[7:0];

assign trunc_ln88_fu_344_p1 = word_q1[3:0];

assign trunc_ln89_1_fu_356_p1 = word_q0[7:0];

assign trunc_ln89_fu_352_p1 = word_q0[3:0];

assign xor_ln97_1_fu_886_p2 = (temp_1_2_fu_879_p3 ^ reg_255);

assign xor_ln97_2_fu_921_p2 = (temp_2_2_fu_915_p3 ^ reg_251);

assign xor_ln97_3_fu_948_p2 = (select_ln78_fu_942_p3 ^ reg_255);

assign xor_ln97_fu_847_p2 = (word_q1 ^ temp_0_fu_814_p3);

assign zext_ln186_10_fu_787_p1 = p_and_t_fu_779_p3;

assign zext_ln186_11_fu_911_p1 = add_ln186_3_reg_1151;

assign zext_ln186_1_fu_462_p1 = p_and_t1_fu_455_p3;

assign zext_ln186_2_fu_489_p1 = add_ln186_fu_483_p2;

assign zext_ln186_3_fu_530_p1 = p_and_f2_fu_523_p3;

assign zext_ln186_4_fu_547_p1 = p_and_t2_fu_539_p3;

assign zext_ln186_5_fu_649_p1 = add_ln186_1_reg_1092;

assign zext_ln186_6_fu_689_p1 = p_and_f5_fu_682_p3;

assign zext_ln186_7_fu_706_p1 = p_and_t7_fu_698_p3;

assign zext_ln186_8_fu_875_p1 = add_ln186_2_reg_1146;

assign zext_ln186_9_fu_770_p1 = p_and_f_fu_763_p3;

assign zext_ln186_fu_451_p1 = p_and_f1_fu_444_p3;

assign zext_ln78_fu_938_p1 = Sbox_q0;

assign zext_ln80_1_fu_330_p1 = add_ln80_reg_985;

assign zext_ln80_2_fu_645_p1 = temp_0_2_fu_640_p2;

assign zext_ln80_3_fu_279_p1 = add_ln80_fu_273_p2;

assign zext_ln80_4_fu_283_p1 = add_ln80_fu_273_p2;

assign zext_ln80_5_fu_293_p1 = add_ln80_2_fu_287_p2;

assign zext_ln80_fu_325_p1 = add_ln80_1_fu_319_p2;

assign zext_ln81_1_fu_304_p1 = add_ln81_fu_298_p2;

assign zext_ln81_fu_871_p1 = Sbox_q0;

assign zext_ln82_1_fu_339_p1 = add_ln82_fu_334_p2;

assign zext_ln82_fu_907_p1 = Sbox_q0;

assign zext_ln97_10_fu_842_p1 = add_ln97_5_fu_836_p2;

assign zext_ln97_1_fu_893_p1 = j_1_reg_972;

assign zext_ln97_2_fu_857_p1 = j_1_reg_972;

assign zext_ln97_3_fu_866_p1 = add_ln97_fu_860_p2;

assign zext_ln97_4_fu_902_p1 = add_ln97_1_fu_896_p2;

assign zext_ln97_5_fu_933_p1 = add_ln97_2_fu_928_p2;

assign zext_ln97_6_fu_822_p1 = empty_20_reg_1119;

assign zext_ln97_7_fu_616_p1 = empty_20_fu_606_p2;

assign zext_ln97_8_fu_626_p1 = add_ln97_3_fu_620_p2;

assign zext_ln97_9_fu_831_p1 = add_ln97_4_fu_825_p2;

assign zext_ln97_fu_611_p1 = empty_20_fu_606_p2;

always @ (posedge ap_clk) begin
    zext_ln80_3_reg_990[8:6] <= 3'b000;
    zext_ln97_1_reg_1176[8:6] <= 3'b000;
end


//assign new_locking_key= locking_key[99:0];

endmodule //aes_main_encrypt_Pipeline_VITIS_LOOP_76_3
