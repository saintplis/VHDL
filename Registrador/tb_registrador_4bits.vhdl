library ieee;
use ieee.std_logic_1164.all;

entity tb_regCarga4bit is
 -- entidade vazia
end entity;

architecture test of tb_regCarga4bit is
    constant CLK_PERIOD : time := 20 ns;
    
    component regCarga4bit is
      port(        
         d : in std_logic_vector(3 downto 0);
         clk : in  std_logic;
         pr, cl : in  std_logic;
         nrw : in  std_logic;
         s : out std_logic_vector(3 downto 0)    
      );
    end component;

    signal spr, scl, snrw : std_logic;
    signal sd : std_logic_vector(3 downto 0);
    signal ss : std_logic_vector(3 downto 0);
    signal sclk : std_logic := '1';

begin
    -- instancia de JK e port map    
    u_reg : regCarga4bit port map(sd, sclk, spr, scl, snrw, ss);

    -- process    
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        sd <= "0000";
        snrw <= '0';
        
        wait for CLK_PERIOD;

        scl <= '1';
      
        wait for CLK_PERIOD;

        sd <= "0010";
        snrw <= '1';
        
        wait for CLK_PERIOD;

        sd <= "1100";
        
        wait for CLK_PERIOD;

        snrw <= '0';

        wait for CLK_PERIOD;

        snrw <= '1';
        sd <= "1111";

        wait for CLK_PERIOD;

        snrw <= '0';

        wait for CLK_PERIOD;

        sd <= "0000";
        snrw <= '1';

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
