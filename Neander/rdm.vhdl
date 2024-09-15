library ieee;
use ieee.std_logic_1164.all;

entity regRDM is
   port(        
      datain : in std_logic_vector(7 downto 0);
      clk : in  std_logic;
      pr, cl : in  std_logic;
      rw : in  std_logic;
      dataout : out std_logic_vector(7 downto 0)    
   );
end entity;

architecture reg8RDM of regRDM is
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
      u_reg0 : reg1bit port map(datain(0), clk, pr, cl, rw, dataout(0));    
      u_reg1 : reg1bit port map(datain(1), clk, pr, cl, rw, dataout(1));    
      u_reg2 : reg1bit port map(datain(2), clk, pr, cl, rw, dataout(2));    
      u_reg3 : reg1bit port map(datain(3), clk, pr, cl, rw, dataout(3));
      u_reg4 : reg1bit port map(datain(4), clk, pr, cl, rw, dataout(4));
      u_reg5 : reg1bit port map(datain(5), clk, pr, cl, rw, dataout(5));
      u_reg6 : reg1bit port map(datain(6), clk, pr, cl, rw, dataout(6));
      u_reg7 : reg1bit port map(datain(7), clk, pr, cl, rw, dataout(7));
end architecture;
