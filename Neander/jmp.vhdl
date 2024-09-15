library ieee;
use ieee.std_logic_1164.all;

entity IJMP is
    port(
        ciclo: in std_logic_vector(2 downto 0);
        saida: out std_logic_vector(10 downto 0)
    );
end entity;

architecture behavior of IJMP is
begin
    saida(10) <= not ciclo(2) or not ciclo(0) or ciclo(1);
    saida(9) <= '1';
    saida(8 downto 6) <= "000";
    saida(5) <= not ciclo(1) and ciclo(0);
    saida(4) <= '0';
    saida(3) <= '0';
    saida(2) <= (not ciclo(0) and not ciclo(1) and not ciclo(2)) or (not ciclo(2) and ciclo(1) and ciclo(0));
    saida(1) <= (not ciclo(2) and not ciclo(1) and ciclo(0)) or (not ciclo(0) and not ciclo(1) and ciclo(2));
    saida(0) <= not ciclo(0) and ciclo(1) and not ciclo(2);
end architecture;
