library ieee;
use ieee.std_logic_1164.all;

entity ILDA is
    port(
        ciclo: in std_logic_vector(2 downto 0);
        saida: out std_logic_vector(10 downto 0)
    );
end entity;

architecture behavior of ILDA is
begin
    saida(10) <= '1';
    saida(9) <= not ciclo(2) or ciclo(1) or not ciclo(0);
    saida(8 downto 6) <= "000";
    saida(5) <= not ciclo(1) and (ciclo(2) xor ciclo(0)); 
    saida(4) <= ciclo(2) and ciclo(1) and ciclo(0);
    saida(3) <= '0';
    saida(2) <= (not ciclo(1) and (ciclo(2) xnor ciclo(0))) or (not ciclo(2) and ciclo(1) and ciclo(0));
    saida(1) <= (ciclo(2) and not ciclo(0)) or (not ciclo(2) and not ciclo(1) and ciclo(0));
    saida(0) <= not ciclo(2) and ciclo(1) and not ciclo(0);
end architecture;
