ghdl -a fifo_register.vhd
ghdl -a fifo_register_tb.vhd
ghdl -r fifo_register_tb --vcd=fifo_register_wave.vcd --stop-time=5us
