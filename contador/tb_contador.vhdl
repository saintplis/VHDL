library ieee;
use ieee.std_logic_1164.all;

entity tb_contador is
 -- entidade vazia
end entity;

architecture test of tb_contador is
    constant CLK_PERIOD : time := 20 ns;
    
    component contador is
        port(
            rst : in  std_logic;
            clk : in  std_logic;
            s: out std_logic_vector (2 downto 0)
           );
    end component;

    signal srst : std_logic;
    signal sclk : std_logic := '1';
    signal ss : std_logic_vector (2 downto 0);

begin
    u_cont : contador port map(srst, sclk, ss);

    -- process    
    tbp : process
    begin
        
        srst <= '0';
        wait for CLK_PERIOD;

        srst <= '1';
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait;

    end process;

    -- process para Clock
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2; 
    end process;

end architecture test;
