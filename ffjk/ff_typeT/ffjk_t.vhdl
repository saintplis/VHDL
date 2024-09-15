library ieee;
use ieee.std_logic_1164.all;

entity ffjk_t is
    port(
        t : in std_logic;
        clock : in  std_logic;
        pr, cl : in  std_logic;
        q, nq : out std_logic
       );
end ffjk_t;

architecture ff of ffjk_t is
    signal sj, sk : std_logic;
    signal s_snj, s_snk : std_logic;
    signal s_sns, s_snr : std_logic;
    signal s_sns2, s_snr2 : std_logic;
    signal s_eloS, s_eloR : std_logic;
    signal s_eloQ, s_elonQ : std_logic;
    signal s_nClock : std_logic;
begin    

    s_nClock <= not(clock);    

    sj <= t;

    sk <= t;

    s_snj <= not(sj and clock and s_elonQ);
       
    s_snk <= not(sk and clock and s_eloQ);

    s_sns <= not(s_snj and pr and s_eloR);
 
    s_snr <= not(s_snk and cl and s_eloS);

    s_eloS <= s_sns;
  
    s_eloR <= s_snr;
   
    s_sns2 <= s_sns nand s_nClock;
 
    s_snr2 <= s_snr nand s_nClock;

    s_eloQ <= not(pr and s_sns2 and s_elonQ);

    q <= s_eloQ;

    s_elonQ <= not(cl and s_snr2 and s_eloQ);

    nq <= s_elonQ;
    
end architecture ff;
