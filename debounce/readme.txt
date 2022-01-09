ghdl -a debounce.vhd
ghdl -a debounce_tb.vhd
ghdl -r debounce_tb --vcd=debounce_wave.vcd --stop-time=40ms