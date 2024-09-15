library ieee;
use ieee.std_logic_1164.all;

entity regCarga1bit is
   port(
        d : in  std_logic;
        clk : in  std_logic;
        pr, cl : in  std_logic;
        nrw : in  std_logic;
        s : out std_logic    
      );
end entity;

architecture reg1bit of regCarga1bit is
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
   -- envio de dataout para saída s    ???????????    
      s <= dataout;
   -- multiplexador    
   -- nrw = 1 -> entrada principal de interface d    
   -- nrw = 0 -> saida temporária dataout (mantém estado)    ???????????
      datain <= d when nrw='1' else dataout;

   -- instância do reg    
      u_reg : ffjk_d port map(datain, clk, pr, cl, dataout);

   end architecture;
