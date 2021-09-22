set_property IOSTANDARD LVCMOS33 [get_ports {a_in[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y_out[0]}]
set_property PACKAGE_PIN J15 [get_ports {a_in[0]}]
set_property PACKAGE_PIN L16 [get_ports {a_in[1]}]
set_property PACKAGE_PIN M13 [get_ports {a_in[2]}]
set_property PACKAGE_PIN R15 [get_ports {a_in[3]}]
set_property PACKAGE_PIN R17 [get_ports {a_in[4]}]
set_property PACKAGE_PIN T18 [get_ports {a_in[5]}]
set_property PACKAGE_PIN U18 [get_ports {a_in[6]}]
set_property PACKAGE_PIN R13 [get_ports {a_in[7]}]
set_property PACKAGE_PIN T8 [get_ports {b_in[0]}]
set_property PACKAGE_PIN U8 [get_ports {b_in[1]}]
set_property PACKAGE_PIN R16 [get_ports {b_in[2]}]
set_property PACKAGE_PIN T13 [get_ports {b_in[3]}]
set_property PACKAGE_PIN H6 [get_ports {b_in[4]}]
set_property PACKAGE_PIN U12 [get_ports {b_in[5]}]
set_property PACKAGE_PIN U11 [get_ports {b_in[6]}]
set_property PACKAGE_PIN V10 [get_ports {b_in[7]}]
set_property PACKAGE_PIN H17 [get_ports {y_out[0]}]
set_property PACKAGE_PIN K15 [get_ports {y_out[1]}]
set_property PACKAGE_PIN J13 [get_ports {y_out[2]}]
set_property PACKAGE_PIN N14 [get_ports {y_out[3]}]
set_property PACKAGE_PIN R18 [get_ports {y_out[4]}]
set_property PACKAGE_PIN V17 [get_ports {y_out[5]}]
set_property PACKAGE_PIN U17 [get_ports {y_out[6]}]
set_property PACKAGE_PIN U16 [get_ports {y_out[7]}]
set_property PACKAGE_PIN V16 [get_ports {y_out[8]}]
set_property PACKAGE_PIN T15 [get_ports {y_out[9]}]
set_property PACKAGE_PIN U14 [get_ports {y_out[10]}]
set_property PACKAGE_PIN T16 [get_ports {y_out[11]}]
set_property PACKAGE_PIN V11 [get_ports y_ready]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports in_ready]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports y_ready]

set_property PACKAGE_PIN E3 [get_ports clk]
create_clock -period 10.000 -name clk -waveform {0.000 5.000} -add [get_ports clk]

set_property PACKAGE_PIN P17 [get_ports in_ready]
set_property PACKAGE_PIN M17 [get_ports rst]
