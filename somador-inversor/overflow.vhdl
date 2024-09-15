-- Overflow do somador
-- Rafael Dos Santos
-- Paulo Roberto Bomfim

entity overflow is
    port(
        X, Y, S: in bit;
        over: out bit
    );
end entity;
architecture computar of overflow is
    begin
        over <= ((not X) and (not Y) and S) or (X and Y and (not S)) after 3*4 ns;
end architecture;

