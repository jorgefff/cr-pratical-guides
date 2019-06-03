// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu May 30 20:10:19 2019
// Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/aulas/cr/projects/projecto/SortWeights_5/SortWeights_5.srcs/sources_1/bd/design_1/ip/design_1_select_in_0_0/design_1_select_in_0_0_stub.v
// Design      : design_1_select_in_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "select_in,Vivado 2018.3" *)
module design_1_select_in_0_0(in_1, in_2, sel, \output )
/* synthesis syn_black_box black_box_pad_pin="in_1[6:0],in_2[6:0],sel,\output [6:0]" */;
  input [6:0]in_1;
  input [6:0]in_2;
  input sel;
  output [6:0]\output ;
endmodule
