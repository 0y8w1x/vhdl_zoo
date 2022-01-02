library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder_tb is
end ripple_carry_adder_tb;

architecture arch_tb of ripple_carry_adder_tb is

    constant c_width: integer := 2;

    signal r_num_1: std_logic_vector(c_width-1 downto 0) := (others => '0');
    signal r_num_0: std_logic_vector(c_width-1 downto 0) := (others => '0');
    signal w_result: std_logic_vector(c_width downto 0);

    component ripple_carry_adder is 
        generic(
            g_width: natural
        );
        port(
            i_num_1: std_logic_vector(g_width-1 downto 0);
            i_num_0: std_logic_vector(g_width-1 downto 0);
            o_result: out std_logic_vector(g_width downto 0)
        );
    end component ripple_carry_adder;

begin
    UUT: ripple_carry_adder
        generic map(
            g_width => c_width
        )
        port map(
            i_num_1 => r_num_1,
            i_num_0 => r_num_0,
            o_result => w_result
        );

    process begin
        r_num_1 <= "00";
        r_num_0 <= "01";
        wait for 10 ns;
        r_num_1 <= "10";
        r_num_0 <= "01";
        wait for 10 ns;
        r_num_1 <= "01";
        r_num_0 <= "11";
        wait for 10 ns;
        r_num_1 <= "11";
        r_num_0 <= "11";
        wait for 10 ns;
    end process;
end arch_tb;
