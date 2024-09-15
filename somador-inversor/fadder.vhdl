-- Fadder de 1 bit
-- Rafael Dos Santos
-- Paulo Roberto Bomfim

entity fadder is
    port(
        X, Y, cin: in bit;
        S, cout: out bit
    );
end entity;
architecture computar of fadder is

begin
    
    S <= ((X xor Y) xor cin) after 2*4 ns;

    cout <= ((X and cin) or (Y and cin) or (X and Y)) after 2*4 ns;

end architecture;    


