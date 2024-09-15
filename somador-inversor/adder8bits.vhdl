-- Adder de 8 bits
-- Rafael Dos Santos
-- Paulo Roberto Bomfim

entity adder is
    port(
        X, Y: in bit_vector(7 downto 0);
        cin: in bit;
        cout: out bit;
        S: out bit_vector(7 downto 0)
    );
end entity;
architecture computar of adder is
    component fadder is
        port(
            X, Y, cin: in bit;
            S, cout: out bit
        );
    end component;
        signal scout : bit_vector (7 downto 0);
begin
    ufadder0 : fadder port map(X(0), Y(0), cin, S(0), scout(0));
    ufadder1 : fadder port map(X(1), Y(1), scout(0), S(1), scout(1));
    ufadder2 : fadder port map(X(2), Y(2), scout(1), S(2), scout(2));
    ufadder3 : fadder port map(X(3), Y(3), scout(2), S(3), scout(3));
    ufadder4 : fadder port map(X(4), Y(4), scout(3), S(4), scout(4));
    ufadder5 : fadder port map(X(5), Y(5), scout(4), S(5), scout(5));
    ufadder6 : fadder port map(X(6), Y(6), scout(5), S(6), scout(6));
    ufadder7 : fadder port map(X(7), Y(7), scout(6), S(7), cout);
end architecture;
