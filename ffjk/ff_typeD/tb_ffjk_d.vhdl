library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjk_d is    
    -- entidade vazia
end tb_ffjk_d;

architecture test of tb_ffjk_d is
    constant CLK_PERIOD : time := 20 ns;
    
    component ffjk_d is
    port(
        d : in std_logic;
        clock  : in  std_logic;
        pr, cl : in  std_logic;
        q, nq  : out std_logic
    );    
    end component;

    signal sd, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin
    -- instancia de JK e port map    
    u_ffjk : ffjk_d port map(sd, sclk, spr, scl, sq, snq);

    -- process    
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        sd <= '0';
        
        wait for CLK_PERIOD;

        scl <= '1';
      
        wait for CLK_PERIOD;

        sd <= '1';
        
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
