library ieee;
use ieee.std_logic_1164.all;

entity neander is
   port(        
        rst, clk : in std_logic
   );
end entity;
architecture modNeander of neander is
   component moduloMEM is
      port(        
         rst, clk : in std_logic;
         nbarrPC : in std_logic;
         rem_nrw : in std_logic;
         mem_nrw : in std_logic;
         rdm_nrw : in std_logic;
         end_pc: in std_logic_vector(7 downto 0);
         end_barr : in std_logic_vector(7 downto 0);
         barramento : inout std_logic_vector(7 downto 0) 
      );
   end component;

   component moduloULA is
      port(
         rst, clk, ac_nrw, mem_nrw : in std_logic;
         ula_op : in std_logic_vector(2 downto 0);
         barramento : inout std_logic_vector(7 downto 0);
         flags_nz : out std_logic_vector(1 downto 0)
      );
   end component;

   component moduloControle is
      port(
          nz : in std_logic_vector(1 downto 0);
          outPC : out std_logic_vector(7 downto 0);
          barr : inout std_logic_vector(7 downto 0);
          clk, rst : in std_logic;
          barrCout : out std_logic_vector(10 downto 0);
          pc_rw : in std_logic;
          ri_rw : in std_logic;
          barrInc : in std_logic
      );
  end component;
   
   signal s_barr, s_outPC : std_logic_vector(7 downto 0);
   signal s_barrCout : std_logic_vector(10 downto 0);
   signal s_flagsNZ : std_logic_vector(1 downto 0);
   
   begin

      u_moduloMEM : moduloMEM port map(rst, clk, s_barrCout(9), s_barrCout(2), s_barrCout(3), s_barrCout(1), s_outPC, s_barr, s_barr);

      u_moduloULA : moduloULA port map(rst, clk, s_barrCout(4), s_barrCout(3), s_barrCout(8 downto 6), s_barr, s_flagsNZ);

      u_moduloControle : moduloControle port map(s_flagsNZ, s_outPC, s_barr, clk, rst, s_barrCout, s_barrCout(5), s_barrCout(0), s_barrCout(10));
      
end architecture;
