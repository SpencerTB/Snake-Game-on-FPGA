##CLK
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports {CLK}]; 

##RESET
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {RESET}];

##BTN's
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {TARGET_ATE}]; 

##SEG DISP
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {SEG_SELECT_OUT[0]}]; 
set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports {SEG_SELECT_OUT[1]}]; 
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports {SEG_SELECT_OUT[2]}];
set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVCMOS33} [get_ports {SEG_SELECT_OUT[3]}]; 
set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports {HEX_OUT[0]}]; 
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports {HEX_OUT[1]}];
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports {HEX_OUT[2]}]; 
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports {HEX_OUT[3]}]; 
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {HEX_OUT[4]}];
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {HEX_OUT[5]}]; 
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {HEX_OUT[6]}]; 
set_property -dict {PACKAGE_PIN V7 IOSTANDARD LVCMOS33} [get_ports {HEX_OUT[7]}];  