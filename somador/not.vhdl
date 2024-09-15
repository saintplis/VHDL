-- Not de 8 Bits
-- Rafael Dos Santos
-- Paulo Roberto Bomfim

entity not_8bits is
    port(
        op : in bit;
        Y : in bit_vector(7 downto 0);
        F : out bit_vector(7 downto 0)
    );
end entity;

architecture computar of not_8bits is
begin
    F <= not Y when op = '1' else Y;
end architecture;
