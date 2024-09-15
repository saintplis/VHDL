library ieee;
use ieee.std_logic_1164.all;

entity moduloULA is
   port(
      rst, clk, ac_nrw, mem_nrw : in std_logic;
      ula_op : in std_logic_vector(2 downto 0);
      barramento : inout std_logic_vector(7 downto 0);
      flags_nz : out std_logic_vector(1 downto 0)
   );
end entity;

architecture ALU of moduloULA is
    component regAC is
       port(        
          d : in std_logic_vector(7 downto 0);
          clk : in  std_logic;
          pr, cl : in  std_logic;
          rw : in  std_logic;
          s : out std_logic_vector(7 downto 0)    
       );
    end component;
    component regFLAG is
       port(        
          d : in std_logic_vector(1 downto 0);
          clk : in  std_logic;
          pr, cl : in  std_logic;
          rw : in  std_logic;
          s : out std_logic_vector(1 downto 0)    
       );
    end component;
    component moduloULAinterno is
        port(
            x, y : in std_logic_vector(7 downto 0);
            s : out std_logic_vector(7 downto 0);
            ula_op : in std_logic_vector(2 downto 0);
            flags_nz : out std_logic_vector(1 downto 0)      
        );
    end component;

    signal s_ula2ac, s_ac2ula : std_logic_vector(7 downto 0);
    signal s_ac2flags : std_logic_vector(1 downto 0);

    begin

        -- Registador AC
        u_regAC : regAC port map(s_ula2ac, clk, '1', rst, ac_nrw, s_ac2ula);
        
        -- Registrador FLAG
        u_regFLAG : regFLAG port map(s_ac2flags, clk, '1', rst, ac_nrw, flags_nz);

        -- Modulo ULA
        u_ULA: moduloULAinterno port map(s_ac2ula, barramento, s_ula2ac, ula_op, s_ac2flags);

        barramento <= s_ac2ula when mem_nrw='1' else (others => 'Z');

end architecture;
