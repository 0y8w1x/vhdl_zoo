library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package types is
    constant taps: integer := 4;
    constant coefficient_width: integer := 4;
    constant data_width: integer := 4;
    constant filtered_data_width: integer := data_width + coefficient_width + integer(ceil(log2(real(taps))));

    -- number of fir filter taps
    type coefficient_array is array (0 to taps-1) of std_logic_vector(coefficient_width-1 downto 0);
    -- width of data input including sign bit
    type data_array is array (0 to taps-1) of signed(data_width-1 downto 0);
    -- array of coefficient * data products
    type product_array is array (0 to taps-1) of signed((data_width + coefficient_width)-1 downto 0);
end package types;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.types.all;

entity fir_filter is
    port(
        -- input
        i_clk: in std_logic;
        i_rst: in std_logic;
        i_data_sample: in std_logic_vector(data_width-1 downto 0);
        i_filter_coefficients: in coefficient_array;
        -- output
        o_filtered_data_sample: out std_logic_vector(filtered_data_width-1 downto 0)
    );
end fir_filter;

architecture arch of fir_filter is
    signal r_coefficients: coefficient_array;
    signal r_data_array: data_array;
    signal w_products: product_array;   
begin
    process(i_clk, i_rst)
        variable sum: signed(filtered_data_width - 1 downto 0);
    begin
        if (i_rst = '1') then
            r_data_array <= (others => (others => '0'));
            r_coefficients <= (others => (others => '0'));
            o_filtered_data_sample <= (others => '0');
        elsif (rising_edge(i_clk)) then
            -- the coefficients are assigned all at once
            r_coefficients <= i_filter_coefficients;
            -- the data samples are shifted into the data array by concatenating
            r_data_array <= signed(i_data_sample) & r_data_array(0 to taps-1 - 1);
            
            -- reset the sum
            sum := (others => '0');
            -- take the sum of the products
            for i in 0 to taps-1 loop
                sum := sum + w_products(i);
            end loop;

            o_filtered_data_sample <= std_logic_vector(sum);
        end if;
    end process;

    generate_multiplications: for i in 0 to taps-1 generate
        w_products(i) <= r_data_array(i) * signed(r_coefficients(i));
    end generate generate_multiplications;
end arch;