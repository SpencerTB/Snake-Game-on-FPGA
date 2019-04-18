
##CLK
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports {CLK}]; 

##RESET
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {RESET}];

##BTN's
##LEFT
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {LEFT}]; 
##RIGHT
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports {RIGHT}]; 
##UP
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports {UP}]; 
##DOWN
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {DOWN}]; 


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

##VGA INTERFACE
##RED
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[0]}];
set_property -dict {PACKAGE_PIN H19 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[1]}];
set_property -dict {PACKAGE_PIN J19 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[2]}];
set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[3]}];
##BLUE
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[4]}];
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[5]}];
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[6]}];
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[7]}];
##GREEN
set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[8]}];
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[9]}];
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[10]}];
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports {COLOUR_OUT[11]}];
##VS & HS
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports {HS}];
set_property -dict {PACKAGE_PIN R19 IOSTANDARD LVCMOS33} [get_ports {VS}];