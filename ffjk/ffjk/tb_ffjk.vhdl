library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjk is    
    -- entidade vazia
end tb_ffjk;

architecture test of tb_ffjk is
    constant CLK_PERIOD : time := 20 ns;
    
    component ffjk is
    port(
        j, k : in  std_logic;
        clock  : in  std_logic;
        pr, cl : in  std_logic;
        q, nq  : out std_logic
    );    
    end component;

    signal sj, sk, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin
    -- instancia de JK e port map    
    u_ffjk : ffjk port map(sj, sk, sclk, spr, scl, sq, snq);

    -- process    
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        sk <= '0';
        sj <= '0';
        
        wait for CLK_PERIOD;

        scl <= '1';
      
        wait for CLK_PERIOD;

        sj <= '1';
        
        wait for CLK_PERIOD;

        sk <= '1';

        wait for CLK_PERIOD;

        sj <= '0';

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
