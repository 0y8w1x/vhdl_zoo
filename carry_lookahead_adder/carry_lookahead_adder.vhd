library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_adder is
    generic(
        g_width: natural := 2
    );
    port(
        --inputs
        i_num_1: in std_logic_vector(g_width-1 downto 0);
        i_num_0: in std_logic_vector(g_width-1 downto 0);
        --outputs
        o_result: out std_logic_vector(g_width downto 0)
    );
end carry_lookahead_adder;

architecture arch of carry_lookahead_adder is
    component full_adder is
        port(
            i_bit_1: in std_logic;
            i_bit_0: in std_logic;
            i_carry: in std_logic;
            o_sum: out std_logic;
            o_carry: out std_logic
        );
    end component full_adder;

    signal w_generate: std_logic_vector(g_width-1 downto 0);
    signal w_propagate: std_logic_vector(g_width-1 downto 0);
    signal w_carry: std_logic_vector(g_width downto 0);

    signal w_sum: std_logic_vector(g_width-1 downto 0);

begin
    generate_full_adders: for i in 0 to g_width-1 generate
        inst_full_adder: full_adder port map(
            i_bit_1 => i_num_1(i),
            i_bit_0 => i_num_0(i),
            i_carry => w_carry(i),
            o_sum => w_sum(i),
            o_carry => open
        );
    end generate generate_full_adders;

    generate_carry_lookahead_adders: for j in 0 to g_width-1 generate
        w_generate(j) <= i_num_1(j) and i_num_0(j);
        w_propagate(j) <= (i_num_1(j) or i_num_0(j)) and w_carry(j);
        w_carry(j+1) <= w_generate(j) or w_propagate(j);
    end generate generate_carry_lookahead_adders;

    --no carry input for first carry lookahead adder
    w_carry(0) <= '0';

    o_result <= w_carry(g_width) & w_sum;
end arch;