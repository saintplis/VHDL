entity tb_mux2x4 is
end entity;

architecture testa of tb_mux2x4 is
    component mux2x4 is
        port(
            -- c00, c01, c02, c03 : in bit;
            c0 : in bit_vector(3 downto 0);
            c1 : in bit_vector(3 downto 0);
            sel : in bit;
            z : out bit_vector(3 downto 0)
        );
    end component;

    signal sc0, sc1, sz : bit_vector(3 downto 0);
    signal ssel : bit;
begin
    umux2x4 : mux2x4 port map(sc0, sc1, ssel, sz);
    
    utb : process
    begin
        sc0 <= "0000";
        sc1 <= "1111";
        ssel <= '0';
        wait for 10 ns;

        ssel <= '1';
        wait for 10 ns;

        sc0 <= "1111";
        sc1 <= "0000";
        wait for 10 ns;

        ssel <= '0';
        wait for 10 ns;

        wait;
    end process;

end architecture;
