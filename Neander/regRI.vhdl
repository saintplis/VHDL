library ieee;
use ieee.std_logic_1164.all;

entity regRI is
   port(        
      d : in std_logic_vector(7 downto 0);
      clk : in  std_logic;
      pr, cl : in  std_logic;
      rw : in  std_logic;
      s : out std_logic_vector(7 downto 0)    
   );
end entity;

architecture reg8B of regRI is
   component reg1bit is
      port(        
         d : in  std_logic;
         clk : in  std_logic;
         pr, cl : in  std_logic;
         rw : in  std_logic;
         s : out std_logic    
      );    
   end component;
   begin       
      u_reg0 : reg1bit port map(d(0), clk, '1', cl, rw, s(0));    
      u_reg1 : reg1bit port map(d(1), clk, '1', cl, rw, s(1));    
      u_reg2 : reg1bit port map(d(2), clk, '1', cl, rw, s(2));    
      u_reg3 : reg1bit port map(d(3), clk, '1', cl, rw, s(3));
      u_reg4 : reg1bit port map(d(4), clk, '1', cl, rw, s(4));
      u_reg5 : reg1bit port map(d(5), clk, '1', cl, rw, s(5));
      u_reg6 : reg1bit port map(d(6), clk, '1', cl, rw, s(6));
      u_reg7 : reg1bit port map(d(7), clk, '1', cl, rw, s(7));
end architecture;
