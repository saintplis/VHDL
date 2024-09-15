library ieee;
use ieee.std_logic_1164.all;

entity ccpe is
	port(
		m_25, m_50 : in std_logic;
		ea : in std_logic_vector (2 downto 0);
		pe : out std_logic_vector (2 downto 0)
    	);
end entity;

architecture storage of ccpe is

begin
	pe(2) <= (m_50 and m_25) or ((not ea(2)) and ea(0) and m_50) or ((not ea(2)) and ea(1) and ea(0) and m_25);
	pe(1) <= ((not ea(1)) and m_25) or (m_50 and m_25) or ((not ea(2)) and ea(1) and (not m_25)) or (ea(2) and m_25);
	pe(0) <= (ea(1) and m_50) or ((not ea(0)) and m_50) or ((not ea(0)) and ea(1) and m_25) or (ea(0) and (not ea(1)) and m_25) or ((not ea(2)) and ea(0) and (not m_50) and m_25);
end architecture;

