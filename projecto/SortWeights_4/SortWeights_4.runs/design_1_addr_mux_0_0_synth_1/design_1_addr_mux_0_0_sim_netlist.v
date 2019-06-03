// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed May 29 06:36:52 2019
// Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_addr_mux_0_0_sim_netlist.v
// Design      : design_1_addr_mux_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addr_mux
   (addr_out,
    addr_1,
    sel,
    addr_2);
  output [6:0]addr_out;
  input [6:0]addr_1;
  input sel;
  input [6:0]addr_2;

  wire [6:0]addr_1;
  wire [6:0]addr_2;
  wire [6:0]addr_out;
  wire sel;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addr_out[0]_INST_0 
       (.I0(addr_1[0]),
        .I1(sel),
        .I2(addr_2[0]),
        .O(addr_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addr_out[1]_INST_0 
       (.I0(addr_1[1]),
        .I1(sel),
        .I2(addr_2[1]),
        .O(addr_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addr_out[2]_INST_0 
       (.I0(addr_1[2]),
        .I1(sel),
        .I2(addr_2[2]),
        .O(addr_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addr_out[3]_INST_0 
       (.I0(addr_1[3]),
        .I1(sel),
        .I2(addr_2[3]),
        .O(addr_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addr_out[4]_INST_0 
       (.I0(addr_1[4]),
        .I1(sel),
        .I2(addr_2[4]),
        .O(addr_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addr_out[5]_INST_0 
       (.I0(addr_1[5]),
        .I1(sel),
        .I2(addr_2[5]),
        .O(addr_out[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \addr_out[6]_INST_0 
       (.I0(addr_1[6]),
        .I1(sel),
        .I2(addr_2[6]),
        .O(addr_out[6]));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_addr_mux_0_0,addr_mux,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "addr_mux,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (addr_1,
    addr_2,
    sel,
    addr_out);
  input [6:0]addr_1;
  input [6:0]addr_2;
  input sel;
  output [6:0]addr_out;

  wire [6:0]addr_1;
  wire [6:0]addr_2;
  wire [6:0]addr_out;
  wire sel;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_addr_mux U0
       (.addr_1(addr_1),
        .addr_2(addr_2),
        .addr_out(addr_out),
        .sel(sel));
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
