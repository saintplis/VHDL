library ieee;
use ieee.std_logic_1164.all;

entity reg is
	port(
		rst, clk : in std_logic;
		pe : in std_logic_vector (2 downto 0);
		ea : out std_logic_vector (2 downto 0)
    	);
end entity;

architecture storage of reg is
	component ffd is
		port(
		    d      : in std_logic;
		    clk    : in std_logic;
		    pr, cl : in std_logic;
		    q, nq  : out std_logic
		);
    end component;
begin
	u_reg0 : ffd port map(pe(0), clk, '1', rst, ea(0));
	u_reg1 : ffd port map(pe(1), clk, '1', rst, ea(1));
	u_reg2 : ffd port map(pe(2), clk, '1', rst, ea(2));
end architecture;

