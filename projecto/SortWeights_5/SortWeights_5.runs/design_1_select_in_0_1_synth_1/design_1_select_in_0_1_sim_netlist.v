// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu May 30 20:07:05 2019
// Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_select_in_0_1_sim_netlist.v
// Design      : design_1_select_in_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_select_in_0_1,select_in,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "select_in,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (in_1,
    in_2,
    sel,
    \output );
  input [7:0]in_1;
  input [7:0]in_2;
  input sel;
  output [7:0]\output ;

  wire [7:0]in_1;
  wire [7:0]in_2;
  wire [7:0]\output ;
  wire sel;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_select_in U0
       (.in_1(in_1),
        .in_2(in_2),
        .\output (\output ),
        .sel(sel));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_select_in
   (\output ,
    in_1,
    in_2,
    sel);
  output [7:0]\output ;
  input [7:0]in_1;
  input [7:0]in_2;
  input sel;

  wire [7:0]in_1;
  wire [7:0]in_2;
  wire [7:0]\output ;
  wire sel;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output[0]_INST_0 
       (.I0(in_1[0]),
        .I1(in_2[0]),
        .I2(sel),
        .O(\output [0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output[1]_INST_0 
       (.I0(in_1[1]),
        .I1(in_2[1]),
        .I2(sel),
        .O(\output [1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output[2]_INST_0 
       (.I0(in_1[2]),
        .I1(in_2[2]),
        .I2(sel),
        .O(\output [2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output[3]_INST_0 
       (.I0(in_1[3]),
        .I1(in_2[3]),
        .I2(sel),
        .O(\output [3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output[4]_INST_0 
       (.I0(in_1[4]),
        .I1(in_2[4]),
        .I2(sel),
        .O(\output [4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output[5]_INST_0 
       (.I0(in_1[5]),
        .I1(in_2[5]),
        .I2(sel),
        .O(\output [5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output[6]_INST_0 
       (.I0(in_1[6]),
        .I1(in_2[6]),
        .I2(sel),
        .O(\output [6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output[7]_INST_0 
       (.I0(in_1[7]),
        .I1(in_2[7]),
        .I2(sel),
        .O(\output [7]));
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
