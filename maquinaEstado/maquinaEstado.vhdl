library ieee;
use ieee.std_logic_1164.all; 

entity me is
    port(
        rst : in std_logic;
        clk : in std_logic;
        m_50, m_25: in std_logic;
        dev, cofre, disp : out std_logic
    );
end entity;

architecture arch_me of me is
    component ccea is
	    port(
            ea : in std_logic_vector(2 downto 0);
		    disp : out std_logic;
            dev : out std_logic;
            cofre : out std_logic
        	);
    end component;

    component ccpe is
	    port(
		    m_25, m_50 : in std_logic;
		    ea : in std_logic_vector (2 downto 0);
		    pe : out std_logic_vector (2 downto 0)
        	);
    end component;

    component reg is
	    port(
		    rst, clk : in std_logic;
		    pe : in std_logic_vector (2 downto 0);
		    ea : out std_logic_vector (2 downto 0)
        	);
    end component;

    signal sreg_ea, sreg_pe : std_logic_vector (2 downto 0);

begin

    u_ccpe : ccpe port map(m_25, m_50, sreg_ea, sreg_pe);

    u_reg : reg port map(rst, clk, sreg_pe, sreg_ea);
    
    u_ccea : ccea port map(sreg_ea, disp, dev, cofre);

end architecture;
