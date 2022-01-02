library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity half_adder is 
    port(
        --inputs
        i_bit_1: in std_logic;
        i_bit_0: in std_logic;
        --outputs
        o_sum: out std_logic;
        o_carry : out std_logic
    );
end half_adder;

architecture arch of half_adder is
begin
    o_sum <= i_bit_1 xor i_bit_0;
    o_carry <= i_bit_1 and i_bit_0;
end arch;