library ieee;
use ieee.std_logic_1164.all;

entity IJCOND is
    port(
        flag: in std_logic;
        ciclo: in std_logic_vector(2 downto 0);
        saida: out std_logic_vector(10 downto 0)
    );
end entity;

architecture behavior of IJCOND is
    component IJMP is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    signal s_comm, s_jmp: std_logic_vector(10 downto 0);
begin
    map_jmp: IJMP port map(ciclo, s_jmp);

    s_comm(10) <= '1';
    s_comm(9) <= '1';
    s_comm(8 downto 6) <= "000";
    s_comm(5) <= not ciclo(2) and ciclo(0);
    s_comm(4) <= '0';
    s_comm(3) <= '0';
    s_comm(2) <= not ciclo(0) and not ciclo(1) and not ciclo(2);
    s_comm(1) <= not ciclo(2) and ciclo(0) and not ciclo(1);
    s_comm(0) <= not ciclo(0) and ciclo(1) and not ciclo(2);

    saida <= s_comm when flag = '0' else s_jmp;

end architecture;
