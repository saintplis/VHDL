library ieee;
use ieee.std_logic_1164.all;

entity regFLAG is
   port(        
      d : in std_logic_vector(1 downto 0);
      clk : in  std_logic;
      pr, cl : in  std_logic;
      rw : in  std_logic;
      s : out std_logic_vector(1 downto 0)    
   );
end entity;

architecture reg2B of regFLAG is
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
      u_reg0 : reg1bit port map(d(0), clk, pr, cl, rw, s(0));    
      u_reg1 : reg1bit port map(d(1), clk, pr, cl, rw, s(1));    
end architecture;
