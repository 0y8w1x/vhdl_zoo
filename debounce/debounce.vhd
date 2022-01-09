library ieee;
use ieee.std_logic_1164.all;

entity debounce is
    port(
        -- inputs
        i_clk: in std_logic;
        i_rst: in std_logic;
        i_button: in std_logic;
        -- output
        o_debounced_button: out std_logic := '0'
    );
end debounce;

architecture arch of debounce is
    -- 500000 ticks @ 50MHz = 10ms
    signal r_counter: integer range 0 to 500_000 := 0;
    signal r_internal_button_state: std_logic := '0';
    signal w_counter_reset: std_logic;
begin
    w_counter_reset <= i_button xor r_internal_button_state;

    process(i_clk, i_rst) 
    begin
        if (i_rst = '1') then
            r_counter <= 0;
            r_internal_button_state <= '0';
            o_debounced_button <= '0';
        elsif (rising_edge(i_clk)) then
            r_internal_button_state <= i_button;
            if (w_counter_reset = '1') then
                r_counter <= 0;
            elsif (r_counter < 500_000) then
                r_counter <= r_counter + 1;
            else
                o_debounced_button <= r_internal_button_state;
            end if;
        end if;
    end process;
end arch;