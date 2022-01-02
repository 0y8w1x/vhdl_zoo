library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_register_tb is
end fifo_register_tb;

architecture testbench of fifo_register_tb is
    constant c_word_size: integer := 8;
    constant c_depth: integer := 4;
   
    signal r_clk: std_logic := '0';
    signal r_rst: std_logic := '0';
    signal r_write_en: std_logic := '0';
    signal r_read_en: std_logic := '0';
    signal r_write_data: std_logic_vector(c_word_size-1 downto 0) := X"DE";

    signal w_fifo_full: std_logic;
    signal w_fifo_empty: std_logic;
    signal w_read_data: std_logic_vector(c_word_size-1 downto 0);

    component fifo_register is
        generic(
            g_word_size: positive := 8;
            g_depth: positive := 32
        );
        port(
            --input
            i_clk: in std_logic;
            i_rst: in std_logic;
            i_write_en: in std_logic;
            i_read_en: in std_logic;
            i_write_data: in std_logic_vector(g_word_size-1 downto 0);
            --output
            o_fifo_full: out std_logic;
            o_fifo_empty: out std_logic;
            o_read_data: out std_logic_vector(g_word_size-1 downto 0)
        );
    end component fifo_register;

begin
    UUT: fifo_register
        generic map(
            g_word_size => c_word_size,
            g_depth => c_depth
        )
        port map(
            i_clk => r_clk,
            i_rst => r_rst,
            i_write_en => r_write_en,
            i_read_en => r_read_en,
            i_write_data => r_write_data,
            o_fifo_full => w_fifo_full,
            o_fifo_empty => w_fifo_empty,
            o_read_data => w_read_data
        );
    
    r_clk <= not r_clk after 5 ns;

    p_test: process
    begin
        wait until r_clk = '1';
        r_write_en <= '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        r_write_en <= '0';
        r_read_en <= '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        r_read_en <= '0';
        r_write_en <= '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        r_write_en <= '0';
        r_read_en <= '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        r_read_en <= '0';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
        wait until r_clk = '1';
    end process;
end testbench;