-- Test Bench do Somador de 8 bits
-- Rafael Dos Santos
-- Paulo Roberto Bomfim

entity tb_somador_8bits is
end tb_somador_8bits;

architecture testbench of tb_somador_8bits is
    
    component somador_8bits
        port(
            X, Y: in bit_vector(7 downto 0);
            cin, op: in bit;
            cout, soverflow: out bit;
            S: out bit_vector(7 downto 0)
        );
    end component;

    signal X_tb, Y_tb, S_tb: bit_vector(7 downto 0);
    signal cin_tb, op_tb, cout_tb, overflow_tb: bit;

    begin

    tb_somador: somador_8bits port map(X_tb, Y_tb, cin_tb, op_tb, cout_tb, overflow_tb, S_tb);

    utb: process
    begin
        -- 0 + (-1) = -1
        X_tb <= "00000000";
        Y_tb <= "11111111"; 
        op_tb <= '0';

        wait for 10 ns;
        
        -- 0 - (-1) = 1
        op_tb <= '1';

        wait for 10 ns;
        
        -- (-1) + 1 = 0
        X_tb <= "11111111";
        Y_tb <= "00000001";
        op_tb <= '0';

        wait for 10 ns;
        
        -- (-1) - 1 = -2
        op_tb <= '1';

        wait for 10 ns;
        
        -- (-2) + (-2) = -4
        X_tb <= "11111110";
        Y_tb <= "11111110";
        op_tb <= '0';
            
        wait for 10 ns;

        -- (-1) + (-1) = -2
        X_tb <= "11111111";
        Y_tb <= "11111111";
            
        wait for 10 ns;

        -- (120) + (-127) = -7
        X_tb <= "01111000";
        Y_tb <= "10000001";
        
        wait for 10 ns;
    
        -- (127) + 1 = -128 OF
        X_tb <= "01111111";
        Y_tb <= "00000001";

        wait for 10 ns;
        wait;

    end process;

end architecture;


