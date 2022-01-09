library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity fir_filter_tb is
end fir_filter_tb;

architecture testbench of fir_filter_tb is
    signal r_clk: std_logic := '0';
    signal r_rst: std_logic := '0';
    -- for testing purposes this is -3 
    signal r_data_sample: std_logic_vector(data_width-1 downto 0) := "1101";
    -- for testing purposes this is [7, 2, 1, 3]
    signal r_coefficients: coefficient_array := ("0111", "0010", "0001", "0011");

    signal w_filtered_data_sample: std_logic_vector(filtered_data_width-1 downto 0);

    component fir_filter is
        port(
            -- input
            i_clk: in std_logic;
            i_rst: in std_logic;
            i_data_sample: in std_logic_vector(data_width-1 downto 0);
            i_filter_coefficients: in coefficient_array;
            -- output
            o_filtered_data_sample: out std_logic_vector(filtered_data_width-1 downto 0)
        );
    end component fir_filter;

begin
    UUT: fir_filter
        port map(
            i_clk => r_clk,
            i_rst => r_rst,
            i_data_sample => r_data_sample,
            i_filter_coefficients => r_coefficients,
            o_filtered_data_sample => w_filtered_data_sample
        );
        
    r_clk <= not r_clk after 5 ns;
end testbench;