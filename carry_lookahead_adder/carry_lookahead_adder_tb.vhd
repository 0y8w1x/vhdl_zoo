library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_adder_tb is
end carry_lookahead_adder_tb;

architecture testbench of carry_lookahead_adder_tb is
    constant c_width: integer := 3;

    signal r_num_1: std_logic_vector(c_width-1 downto 0) := (others => '0');
    signal r_num_0: std_logic_vector(c_width-1 downto 0) := (others => '0');
    signal r_result: std_logic_vector(c_width downto 0);

    component carry_lookahead_adder is
        generic(
            g_width: natural
        );
        port(
            i_num_1: in std_logic_vector(g_width-1 downto 0);
            i_num_0: in std_logic_vector(g_width-1 downto 0);
            o_result: out std_logic_vector(g_width downto 0)
        );
    end component carry_lookahead_adder;

begin
    UUT: carry_lookahead_adder
        generic map(
            g_width => c_width
        )
        port map(
            i_num_1 => r_num_1,
            i_num_0 => r_num_0,
            o_result => r_result
        );

    process begin
        r_num_1 <= "000";
        r_num_0 <= "001";
        wait for 10 ns;
        r_num_1 <= "100";
        r_num_0 <= "011";
        wait for 10 ns;
        r_num_1 <= "010";
        r_num_0 <= "101";
        wait for 10 ns;
        r_num_1 <= "111";
        r_num_0 <= "111";
        wait for 10 ns;
    end process;
end testbench;
