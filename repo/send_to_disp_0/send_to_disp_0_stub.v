// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Mar  5 05:25:10 2019
// Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub d:/aulas/cr/projects/repo/send_to_disp_0/send_to_disp_0_stub.v
// Design      : send_to_disp_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "send_to_disp,Vivado 2018.3" *)
module send_to_disp_0(bcd, select_disp, segments, toggle_disp)
/* synthesis syn_black_box black_box_pad_pin="bcd[3:0],select_disp[2:0],segments[6:0],toggle_disp[7:0]" */;
  input [3:0]bcd;
  input [2:0]select_disp;
  output [6:0]segments;
  output [7:0]toggle_disp;
endmodule
