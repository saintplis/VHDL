-- multiplexador de 2 canais com 1 bit cada
-- 13/10/2023

entity mux2x1 is
    port(
        c0, c1, sel : in bit;
        z : out bit
    );
end entity;

architecture comutar of mux2x1 is
    -- sem componentes e sem sinais
begin
    z <= (c0 and not(sel)) or (c1 and sel);
end architecture;
