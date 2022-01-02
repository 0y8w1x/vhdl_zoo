ghdl -a full_adder.vhd
ghdl -a ripple_carry_adder.vhd
ghdl -a ripple_carry_adder_tb.vhd
ghdl -r ripple_carry_adder_tb --vcd=ripple_carry_adder_wave.vcd --stop-time=10us