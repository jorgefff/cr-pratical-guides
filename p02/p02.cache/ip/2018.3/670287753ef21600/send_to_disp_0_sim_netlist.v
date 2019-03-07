// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Mar  5 05:25:09 2019
// Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ send_to_disp_0_sim_netlist.v
// Design      : send_to_disp_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_send_to_disp
   (bcd,
    select_disp,
    segments,
    toggle_disp);
  input [3:0]bcd;
  input [2:0]select_disp;
  output [6:0]segments;
  output [7:0]toggle_disp;

  wire [3:0]bcd;
  wire [6:0]segments;
  wire [2:0]select_disp;
  wire [7:0]toggle_disp;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2094)) 
    \segments[0]_INST_0 
       (.I0(bcd[3]),
        .I1(bcd[2]),
        .I2(bcd[0]),
        .I3(bcd[1]),
        .O(segments[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA4C8)) 
    \segments[1]_INST_0 
       (.I0(bcd[3]),
        .I1(bcd[2]),
        .I2(bcd[1]),
        .I3(bcd[0]),
        .O(segments[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hA210)) 
    \segments[2]_INST_0 
       (.I0(bcd[3]),
        .I1(bcd[0]),
        .I2(bcd[1]),
        .I3(bcd[2]),
        .O(segments[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hC214)) 
    \segments[3]_INST_0 
       (.I0(bcd[3]),
        .I1(bcd[2]),
        .I2(bcd[0]),
        .I3(bcd[1]),
        .O(segments[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h5710)) 
    \segments[4]_INST_0 
       (.I0(bcd[3]),
        .I1(bcd[1]),
        .I2(bcd[2]),
        .I3(bcd[0]),
        .O(segments[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h5190)) 
    \segments[5]_INST_0 
       (.I0(bcd[3]),
        .I1(bcd[2]),
        .I2(bcd[0]),
        .I3(bcd[1]),
        .O(segments[5]));
  LUT4 #(
    .INIT(16'h4025)) 
    \segments[6]_INST_0 
       (.I0(bcd[3]),
        .I1(bcd[0]),
        .I2(bcd[2]),
        .I3(bcd[1]),
        .O(segments[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \toggle_disp[0]_INST_0 
       (.I0(select_disp[2]),
        .I1(select_disp[0]),
        .I2(select_disp[1]),
        .O(toggle_disp[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \toggle_disp[1]_INST_0 
       (.I0(select_disp[2]),
        .I1(select_disp[0]),
        .I2(select_disp[1]),
        .O(toggle_disp[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \toggle_disp[2]_INST_0 
       (.I0(select_disp[2]),
        .I1(select_disp[1]),
        .I2(select_disp[0]),
        .O(toggle_disp[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \toggle_disp[3]_INST_0 
       (.I0(select_disp[2]),
        .I1(select_disp[0]),
        .I2(select_disp[1]),
        .O(toggle_disp[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \toggle_disp[4]_INST_0 
       (.I0(select_disp[0]),
        .I1(select_disp[1]),
        .I2(select_disp[2]),
        .O(toggle_disp[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \toggle_disp[5]_INST_0 
       (.I0(select_disp[0]),
        .I1(select_disp[1]),
        .I2(select_disp[2]),
        .O(toggle_disp[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \toggle_disp[6]_INST_0 
       (.I0(select_disp[1]),
        .I1(select_disp[0]),
        .I2(select_disp[2]),
        .O(toggle_disp[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \toggle_disp[7]_INST_0 
       (.I0(select_disp[0]),
        .I1(select_disp[1]),
        .I2(select_disp[2]),
        .O(toggle_disp[7]));
endmodule

(* CHECK_LICENSE_TYPE = "send_to_disp_0,send_to_disp,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "send_to_disp,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (bcd,
    select_disp,
    segments,
    toggle_disp);
  input [3:0]bcd;
  input [2:0]select_disp;
  output [6:0]segments;
  output [7:0]toggle_disp;

  wire [3:0]bcd;
  wire [6:0]segments;
  wire [2:0]select_disp;
  wire [7:0]toggle_disp;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_send_to_disp U0
       (.bcd(bcd),
        .segments(segments),
        .select_disp(select_disp),
        .toggle_disp(toggle_disp));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
