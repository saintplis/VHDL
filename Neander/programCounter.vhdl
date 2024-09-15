library ieee;
use ieee.std_logic_1164.all;

entity programCounter is
   port(        
        barrInc : in std_logic;
        pc_rw : in std_logic;
        clk : in std_logic;
        cl : in std_logic;
        endPC2MEM : out std_logic_vector(7 downto 0);
        barramento : in std_logic_vector(7 downto 0)
   );
end entity;
architecture pc of programCounter is
    component regPC is
        port(        
           d : in std_logic_vector(7 downto 0);
           clk : in  std_logic;
           pr, cl : in  std_logic;
           rw : in  std_logic;
           s : out std_logic_vector(7 downto 0)    
        );
    end component;

    signal s_mux2pc, s_endPC2MEM, s_PCatual, saddc, sadd, x: std_logic_vector(7 downto 0);
    signal saddoverflow : std_logic;

    begin

    -- MUX
    s_mux2pc <= barramento when barrInc = '0' else sadd;

    -- REGISTRADOR PC
    u_regPC : regPC port map(s_mux2pc, clk, '1', cl, pc_rw, s_endPC2MEM);

    s_PCatual <= s_endPC2MEM;

    endPC2MEM <= s_endPC2MEM;

    -- ADDER
    x <= "00000001";
    sadd(0) <= x(0) xor s_PCatual(0);
    saddc(0) <= x(0) and s_PCatual(0);
    gen3 : for i in 1 to 7 generate
        genadd : sadd(i) <= (x(i) xor s_PCatual(i)) xor saddc(i-1);
        genaddc : saddc(i) <= (x(i) and saddc(i-1)) or (saddc(i-1) and s_PCatual(i)) or (x(i) and s_PCatual(i));
    end generate;
    saddoverflow <= saddc(7);
end architecture;

