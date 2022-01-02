ghdl -a full_adder.vhd
ghdl -a full_adder_tb.vhd
ghdl -r full_adder_tb --vcd=full_adder_wave.vcd --stop-time=10us