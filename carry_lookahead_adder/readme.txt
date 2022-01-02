ghdl -a full_adder.vhd
ghdl -a carry_lookahead_adder.vhd
ghdl -a carry_lookahead_adder_tb.vhd
ghdl -r carry_lookahead_adder_tb --vcd=carry_lookahead_adder_wave.vcd --stop-time=10us