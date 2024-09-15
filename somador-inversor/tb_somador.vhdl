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
        -- 0x00 + 0xFF = FF
        X_tb <= x"00";
        Y_tb <= x"FF"; 
        op_tb <= '0';

        wait for 300 ns;
        
        -- 0x00 - 0xFF = 01
        op_tb <= '1';

        wait for 300 ns;
        
        -- 0xFF + 0x01 = 00
        X_tb <= x"FF";
        Y_tb <= x"01";
        op_tb <= '0';

        wait for 300 ns;
        
        -- 0xFF - 0x01 = FE
        op_tb <= '1';

        wait for 300 ns;
        
        -- 0xFE + 0xFE = FC
        X_tb <= x"FE";
        Y_tb <= x"FE";
        op_tb <= '0';
            
        wait for 300 ns;

        -- 0xFF + 0xFF = FE
        X_tb <= x"FF";
        Y_tb <= x"FF";
            
        wait for 300 ns;

        wait;

    end process;

end architecture;


