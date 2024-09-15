-- multiplexador de 2 canais com 1 bit cada
-- 13/10/2023

entity mux2x4 is
    port(
        -- c00, c01, c02, c03 : in bit;
        c0 : in bit_vector(3 downto 0);
        c1 : in bit_vector(3 downto 0);
        sel : in bit;
        z : out bit_vector(3 downto 0)
    );
end entity;

architecture comutar of mux2x4 is
    -- sem componentes e sem sinais
begin
    z <= c0 when sel='0' else c1;
end architecture;
