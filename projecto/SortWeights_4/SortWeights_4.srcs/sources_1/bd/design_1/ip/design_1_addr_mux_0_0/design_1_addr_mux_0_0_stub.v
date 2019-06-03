// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed May 29 06:36:52 2019
// Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/aulas/cr/projects/projecto/SortWeights_4/SortWeights_4.srcs/sources_1/bd/design_1/ip/design_1_addr_mux_0_0/design_1_addr_mux_0_0_stub.v
// Design      : design_1_addr_mux_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "addr_mux,Vivado 2018.3" *)
module design_1_addr_mux_0_0(addr_1, addr_2, sel, addr_out)
/* synthesis syn_black_box black_box_pad_pin="addr_1[6:0],addr_2[6:0],sel,addr_out[6:0]" */;
  input [6:0]addr_1;
  input [6:0]addr_2;
  input sel;
  output [6:0]addr_out;
endmodule
