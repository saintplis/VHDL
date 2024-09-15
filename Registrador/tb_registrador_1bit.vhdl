library ieee;
use ieee.std_logic_1164.all;

entity tb_regCarga1bit is    
    -- entidade vazia
end tb_regCarga1bit;

architecture test of tb_regCarga1bit is
    constant CLK_PERIOD : time := 20 ns;
    
    component regCarga1bit is
    port(
        d : in std_logic;
        clk : in std_logic;
        pr, cl : in std_logic;
        nrw : in std_logic;
        s : out std_logic
    );    
    end component;

    signal sd, spr, scl, snrw, ss : std_logic;
    signal sclk : std_logic := '1';

begin
    -- instancia de JK e port map    
    u_reg : regCarga1bit port map(sd, sclk, spr, scl, snrw, ss);

    -- process    
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        sd <= '0';
        snrw <= '0';
        
        wait for CLK_PERIOD;

        scl <= '1';
      
        wait for CLK_PERIOD;

        sd <= '1';
        
        wait for CLK_PERIOD;

        snrw <= '1';
        
        wait for CLK_PERIOD;

        sd <= '0';
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
