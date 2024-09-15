library ieee;
use ieee.std_logic_1164.all;

entity ccea is
	port(
        ea : in std_logic_vector(2 downto 0);
		disp : out std_logic;
        dev : out std_logic;
        cofre : out std_logic
    	);
end entity;

architecture ea of ccea is

begin
	disp <= ea(2) and (not ea(1));
    cofre <= ea(2) and (not ea(1));
    dev <= ea(1) and ea(2);
end architecture;

