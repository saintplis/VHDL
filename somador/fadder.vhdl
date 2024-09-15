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
    
    S <= ((X xor Y) xor cin);

    cout <= ((X and cin) or (Y and cin) or (X and Y));

end architecture;    


