-- Somador de 8 bits
-- Rafael Dos Santos
-- Paulo Roberto Bomfim

entity somador_8bits is
    port(
        X, Y: in bit_vector(7 downto 0);
        cin, op: in bit;
        cout, soverflow: out bit;
        S: out bit_vector(7 downto 0)
    );
end entity;

architecture computar of somador_8bits is
    component not_8bits is
        port(
            op : in bit;
            Y : in bit_vector(7 downto 0);
            F : out bit_vector(7 downto 0)
        );
    end component;

    component adder is
        port(
            X, Y: in bit_vector(7 downto 0);
            cin: in bit;
            cout: out bit;
            S: out bit_vector(7 downto 0)
        );
    end component;
    component overflow is
        port(
            X, Y, S: in bit;
            over: out bit
        );
    end component;

    signal sF, sS: bit_vector(7 downto 0);
    
begin
    u_not_8bits: not_8bits port map(op, Y, sF);
    u_adder: adder port map(X, sF, op, cout ,sS);
    u_overflow: overflow port map(X(7), sF(7), sS(7), soverflow);
    S <= sS;
end architecture;

