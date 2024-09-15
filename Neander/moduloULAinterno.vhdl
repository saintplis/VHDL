library ieee;
use ieee.std_logic_1164.all;

entity moduloULAinterno is
    port(
        x, y : in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0);
        ula_op : in std_logic_vector(2 downto 0);
        flags_nz : out std_logic_vector(1 downto 0)      
    );
end entity;

architecture modALU of moduloULAinterno is
    component adder is
        port(
            X, Y: in bit_vector(7 downto 0);
            cin: in bit;
            cout: out bit;
            S: out bit_vector(7 downto 0)
        );
    end component;
    
    signal snot, sand, sor, slda, s_resultado, sadd, saddc: std_logic_vector(7 downto 0);
    signal saddoverflow : std_logic;

        begin

        -- AND
        gen1 : for i in 0 to 7 generate
            genand: sand(i) <= x(i) and y(i);
        end generate;

        -- OR 
        gen2 : for i in 0 to 7 generate
            genor: sor(i) <= x(i) or y(i);
        end generate;

        -- LDA
        slda <= y;

        -- NOT
        snot <= not(x);

        -- RESULTADO
        s <= s_resultado;
        
        -- ADDER
        sadd(0) <= x(0) xor y(0);
        saddc(0) <= x(0) and y(0);
        gen3 : for i in 1 to 7 generate
            genadd : sadd(i) <= (x(i) xor y(i)) xor saddc(i-1);
            genaddc : saddc(i) <= (x(i) and saddc(i-1)) or (saddc(i-1) and y(i)) or (x(i) and y(i));
        end generate;
        saddoverflow <= saddc(7);

        -- MUX
        s_resultado <= slda when ula_op="000" else 
                       sadd when ula_op = "001" else 
                       sor when ula_op = "010" else
                       sand when ula_op = "011" else
                       snot when ula_op = "100" else
                       (others => 'Z');

         -- FLAGS
         -- FLAG N (numero negativo)
         flags_nz(1) <= s_resultado(7);

         -- FLAG Z (s em zero)
         flags_nz(0) <= not(s_resultado(7) or s_resultado(6) or s_resultado(5) or s_resultado(4) or s_resultado(3) or s_resultado(2) or s_resultado(1) or s_resultado(0));

end architecture;


