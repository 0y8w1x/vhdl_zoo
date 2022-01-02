library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_tb is
end full_adder_tb;

architecture testbench of full_adder_tb is
    signal r_bit_1: std_logic;
    signal r_bit_0: std_logic;
    signal r_carry: std_logic;
    signal w_sum: std_logic;
    signal w_carry: std_logic;
begin
    UUT: entity work.full_adder port map(
        i_bit_1 => r_bit_1,
        i_bit_0 => r_bit_0,
        i_carry => r_carry,
        o_sum => w_sum,
        o_carry => w_carry
        );

    process begin
        r_bit_1 <= '0';
        r_bit_0 <= '0';
        r_carry <= '0';
        wait for 10 ns;
        r_bit_1 <= '0';
        r_bit_0 <= '0';
        r_carry <= '1';
        wait for 10 ns;
        r_bit_1 <= '0';
        r_bit_0 <= '1';
        r_carry <= '0';
        wait for 10 ns;
        r_bit_1 <= '0';
        r_bit_0 <= '1';
        r_carry <= '1';
        wait for 10 ns;
        r_bit_1 <= '1';
        r_bit_0 <= '0';
        r_carry <= '0';
        wait for 10 ns;
        r_bit_1 <= '1';
        r_bit_0 <= '0';
        r_carry <= '1';
        wait for 10 ns;
        r_bit_1 <= '1';
        r_bit_0 <= '1';
        r_carry <= '0';
        wait for 10 ns;
        r_bit_1 <= '1';
        r_bit_0 <= '1';
        r_carry <= '1';
        wait for 10 ns;
    end process;
end testbench;