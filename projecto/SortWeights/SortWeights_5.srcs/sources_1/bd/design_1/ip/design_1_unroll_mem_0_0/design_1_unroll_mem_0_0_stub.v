// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu May 30 02:39:26 2019
// Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/aulas/cr/projects/projecto/SortWeights_5/SortWeights_5.srcs/sources_1/bd/design_1/ip/design_1_unroll_mem_0_0/design_1_unroll_mem_0_0_stub.v
// Design      : design_1_unroll_mem_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "unroll_mem,Vivado 2018.3" *)
module design_1_unroll_mem_0_0(clk, addr, data_in, rst, data_out, completed)
/* synthesis syn_black_box black_box_pad_pin="clk,addr[6:0],data_in[23:0],rst,data_out[3071:0],completed" */;
  input clk;
  output [6:0]addr;
  input [23:0]data_in;
  input rst;
  output [3071:0]data_out;
  output completed;
endmodule
