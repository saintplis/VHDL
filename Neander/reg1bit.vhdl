library ieee;
use ieee.std_logic_1164.all;

entity reg1bit is
   port(
        d : in  std_logic;
        clk : in  std_logic;
        pr, cl : in  std_logic;
        rw : in  std_logic;
        s : out std_logic    
      );
end entity;

architecture regB1 of reg1bit is
   component ffjk_d is
      port(
         d : in std_logic;
         clock : in  std_logic;
         pr, cl : in  std_logic;
         q, nq : out std_logic
      );
   end component;

   signal datain, dataout : std_logic;
   begin
      s <= dataout;
      datain <= d when rw='1' else dataout;  
      u_reg : ffjk_d port map(datain, clk, pr, cl, dataout);
  end architecture;
