library ieee;
use ieee.std_logic_1164.all;

entity fifo_register is 
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
end fifo_register;

architecture arch of fifo_register is
    type t_fifo_data is array(0 to g_depth-1) of std_logic_vector(g_word_size-1 downto 0);
    signal r_fifo_data: t_fifo_data := (others => (others => '0'));

    signal r_write_pointer: integer range 0 to g_depth-1 := 0;
    signal r_read_pointer: integer range 0 to g_depth-1 := 0;

    signal r_fifo_count: integer := 0;

    signal w_fifo_full: std_logic;
    signal w_fifo_empty: std_logic;

begin
    p_main: process(i_clk)
    begin
        if rising_edge(i_clk) then
            if (i_rst = '1') then
                r_fifo_count <= 0;
                r_write_pointer <= 0;
                r_read_pointer <= 0;
            else
                -- count fifo words
                if (i_write_en = '1' and i_read_en = '0') then
                    r_fifo_count <= r_fifo_count+1;
                elsif (i_write_en ='0' and i_read_en = '1') then
                    r_fifo_count <= r_fifo_count-1;
                end if;

                -- manage fifo write pointer
                if (i_write_en = '1' and w_fifo_full = '0') then
                    if (r_write_pointer = g_depth-1) then
                        r_write_pointer <= 0;
                    else
                        r_write_pointer <= r_write_pointer+1;
                    end if;
                end if;
                    
                -- manage fifo read pointer
                if (i_read_en = '1' and w_fifo_empty = '0') then
                    if (r_read_pointer = g_depth-1) then
                        r_read_pointer <= 0;
                    else
                        r_read_pointer <= r_read_pointer+1;
                    end if;
                end if;

                -- write data
                if (i_write_en = '1') then
                    r_fifo_data(r_write_pointer) <= i_write_data;
                end if;
            end if;
        end if;
    end process p_main;
    
    o_read_data <= r_fifo_data(r_read_pointer);

    w_fifo_full <= '1' when r_fifo_count = g_depth else '0';
    w_fifo_empty <= '1' when r_fifo_count = 0 else '0';

    o_fifo_full <= w_fifo_full;
    o_fifo_empty <= w_fifo_empty;

    p_assert: process(i_clk)
    begin
        if rising_edge(i_clk) then
            if (i_write_en = '1' and w_fifo_full = '1') then
                report "error: fifo is full, but it being written" severity failure;
            end if;
                
            if (i_read_en = '1' and w_fifo_empty = '1') then
                report "error: fifo empty, but is being read";
            end if;
        end if;
    end process p_assert;
end arch;