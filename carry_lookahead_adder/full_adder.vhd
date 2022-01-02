library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder is
    port(
        --inputs
        i_bit_1: in std_logic;
        i_bit_0: in std_logic;
        i_carry: in std_logic;
        --outputs
        o_sum: out std_logic;
        o_carry: out std_logic
        );
end full_adder;

architecture arch of full_adder is
begin
        o_sum <= i_bit_1 xor i_bit_0 xor i_carry;
        o_carry <= (i_bit_1 and i_bit_0) or ((i_bit_1 xor i_bit_0) and i_carry);
end arch;
