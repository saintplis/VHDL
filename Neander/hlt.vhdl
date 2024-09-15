library ieee;
use ieee.std_logic_1164.all;

entity IHLT is
    port(
        ciclo: in std_logic_vector(2 downto 0);
        saida: out std_logic_vector(10 downto 0)
    );
end entity;

architecture behavior of IHLT is
begin
    saida(10 downto 0) <= "00000000000";
end architecture;

