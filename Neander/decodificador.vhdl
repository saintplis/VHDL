library ieee;
use ieee.std_logic_1164.all;

    entity decodificador is
        port(
            instr_in : in std_logic_vector(7 downto 0);
            s_dec2uc : out std_logic_vector(10 downto 0)
        );
    end entity;

architecture behavioral of decodificador is 
begin

    s_dec2uc <= "10000000000" when instr_in(7 downto 4) = "0000" else -- NOP
                "01000000000" when instr_in(7 downto 4) = "0001" else -- STA
                "00100000000" when instr_in(7 downto 4) = "0010" else -- LDA
                "00010000000" when instr_in(7 downto 4) = "0011" else -- ADD
                "00001000000" when instr_in(7 downto 4) = "0100" else -- OR
                "00000100000" when instr_in(7 downto 4) = "0101" else -- AND
                "00000010000" when instr_in(7 downto 4) = "0110" else -- NOT
                "00000001000" when instr_in(7 downto 4) = "1000" else -- JMP
                "00000000100" when instr_in(7 downto 4) = "1001" else -- JN
                "00000000010" when instr_in(7 downto 4) = "1010" else -- JZ
                "00000000001" when instr_in(7 downto 4) = "1111" else -- HLT
                "00000000000"; -- Probelma

end architecture;                                                                                                                                                                                                           