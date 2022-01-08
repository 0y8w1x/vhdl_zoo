ghdl -a fir_filter.vhd
ghdl -a fir_filter_tb.vhd
ghdl -r fir_filter_tb --vcd=fir_filter_wave.vcd --stop-time=10us