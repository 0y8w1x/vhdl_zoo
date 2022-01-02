library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity half_adder_tb is
end half_adder_tb;

architecture testbench of half_adder_tb is
    signal r_bit_1: std_logic;
    signal r_bit_0: std_logic;
    signal w_sum: std_logic;
    signal w_carry: std_logic;
begin
    UUT: entity work.half_adder port map (
        i_bit_1 => r_bit_1,
        i_bit_0 => r_bit_0,
        o_sum => w_sum,
        o_carry => w_carry
        );

    process begin
        r_bit_1 <= '0';
        r_bit_0 <= '0';
        wait for 10 ns;
        r_bit_1 <= '0';
        r_bit_0 <= '1';
        wait for 10 ns;
        r_bit_1 <= '1';
        r_bit_0 <= '0';
        wait for 10 ns;
        r_bit_1 <= '1';
        r_bit_0 <= '1';
        wait for 10 ns;
    end process;
end testbench ;