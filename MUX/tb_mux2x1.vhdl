-- testador de mux2x1
-- 13/10/2023

entity tb_mux2x1 is
end entity;

architecture teste of tb_mux2x1 is
    -- incorporar o componente
    component mux2x1 is
        port(
            c0, c1, sel : in bit;
            z : out bit
        );
    end component;

    -- sinais para manipular e observar
    signal sc0, sc1, ssel, sz : bit;

begin
    -- instância de mux2x1
    umux2x1 : mux2x1 port map(sc0, sc1, ssel, sz);

    utb : process
    begin
        sc0 <= '0';
        sc1 <= '1';
        ssel <= '0';
        wait for 10 ns;

        ssel <= '1';
        wait for 10 ns;

        sc0 <= '1';
        sc1 <= '0';
        wait for 10 ns;

        ssel <= '0';
        wait for 10 ns;

        wait;
    end process;
end architecture;
