library ieee;
use ieee.std_logic_1164.all;

entity debounce_tb is
    end debounce_tb;

architecture testbench of debounce_tb is
    signal r_clk: std_logic := '0';
    signal r_rst: std_logic := '0';
    signal r_button: std_logic := '0';

    signal w_debounced_button: std_logic;

    component debounce is
        port(
            -- input
            i_clk: in std_logic;
            i_rst: in std_logic;
            i_button: in std_logic;
            -- output
            o_debounced_button: out std_logic
        );
    end component debounce;
begin
    UUT: debounce
        port map(
            i_clk => r_clk,
            i_rst => r_rst,
            i_button => r_button,
            o_debounced_button => w_debounced_button
        );

    r_clk <= not r_clk after 10 ns;

    p_test: process
    begin
        -- simulate bounce
        wait for 1 ms;
        r_button <= '1';
        wait for 2 ms;
        r_button <= '0';
        wait for 1 ms;
        r_button <= '1';
        wait for 250 us;
        r_button <= '0';
        wait for 500 us;
        r_button <= '1';
        -- release button
        wait for 20 ms;
        r_button <= '0';
        wait for 100 ms;
    end process p_test;

end testbench;