ghdl -a half_adder.vhd
ghdl -a half_adder_tb.vhd
ghdl -r half_adder_tb --vcd=half_adder_wave.vcd --stop-time=10us