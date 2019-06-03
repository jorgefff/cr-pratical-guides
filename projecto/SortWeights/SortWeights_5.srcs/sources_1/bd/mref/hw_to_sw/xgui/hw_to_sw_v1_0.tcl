# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDR_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BLOCK_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NELEMS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUT_SIZE" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDR_BITS { PARAM_VALUE.ADDR_BITS } {
	# Procedure called to update ADDR_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_BITS { PARAM_VALUE.ADDR_BITS } {
	# Procedure called to validate ADDR_BITS
	return true
}

proc update_PARAM_VALUE.BLOCK_ID { PARAM_VALUE.BLOCK_ID } {
	# Procedure called to update BLOCK_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BLOCK_ID { PARAM_VALUE.BLOCK_ID } {
	# Procedure called to validate BLOCK_ID
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.NELEMS { PARAM_VALUE.NELEMS } {
	# Procedure called to update NELEMS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NELEMS { PARAM_VALUE.NELEMS } {
	# Procedure called to validate NELEMS
	return true
}

proc update_PARAM_VALUE.OUT_SIZE { PARAM_VALUE.OUT_SIZE } {
	# Procedure called to update OUT_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUT_SIZE { PARAM_VALUE.OUT_SIZE } {
	# Procedure called to validate OUT_SIZE
	return true
}


proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.NELEMS { MODELPARAM_VALUE.NELEMS PARAM_VALUE.NELEMS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NELEMS}] ${MODELPARAM_VALUE.NELEMS}
}

proc update_MODELPARAM_VALUE.ADDR_BITS { MODELPARAM_VALUE.ADDR_BITS PARAM_VALUE.ADDR_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_BITS}] ${MODELPARAM_VALUE.ADDR_BITS}
}

proc update_MODELPARAM_VALUE.BLOCK_ID { MODELPARAM_VALUE.BLOCK_ID PARAM_VALUE.BLOCK_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BLOCK_ID}] ${MODELPARAM_VALUE.BLOCK_ID}
}

proc update_MODELPARAM_VALUE.OUT_SIZE { MODELPARAM_VALUE.OUT_SIZE PARAM_VALUE.OUT_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUT_SIZE}] ${MODELPARAM_VALUE.OUT_SIZE}
}

