library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_me is
end entity;

architecture search of tb_me is
    constant CLK_PERIOD : time := 20 ns;

    component me is
        port(
            rst : in std_logic;
            clk : in std_logic;
            m_50, m_25 : in std_logic;
            dev, cofre, disp : out std_logic
        );
    end component;

    signal srst, sdev, scofre, sdisp, sm_50, sm_25 : std_logic;
    signal sclk : std_logic := '1';

begin

    u_me : me port map(srst, sclk, sm_50, sm_25, sdev, scofre, sdisp);

    tbp : process
    begin

        sm_50 <= '0';
        sm_25 <= '0';
        srst <= '0';
        wait for CLK_PERIOD;
        srst <= '1';        
        sm_50 <= '1';
        sm_25 <= '0';
        wait for CLK_PERIOD;
        sm_50 <= '1';        
        sm_25 <= '0';
        wait for CLK_PERIOD;
        sm_50 <= '0';
        sm_25 <= '1';
        wait for CLK_PERIOD;
        sm_50 <= '1';
        sm_25 <= '1';
        wait for CLK_PERIOD;
        sm_50 <= '0';
        sm_25 <= '0';
        wait for CLK_PERIOD;
        sm_50 <= '0';
        sm_25 <= '0';
        wait for CLK_PERIOD;
        wait;

    end process;

    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2; 
    end process;

end architecture;
