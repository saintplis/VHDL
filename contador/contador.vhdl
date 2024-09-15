library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port(
        rst : in  std_logic;
        clk  : in  std_logic;
        s: out std_logic_vector (2 downto 0)
    );
end entity;

architecture cont of contador is
    component controlador is
        port(
            q : in  std_logic_vector (2 downto 0);
            j, k : out std_logic_vector (2 downto 0)
        );
    end component;

    component ffjk is
    port(
        j, k   : in std_logic;
        clk    : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
    );
    end component;



    signal sj, sk : std_logic_vector (2 downto 0);
    signal sq, snq : std_logic_vector (2 downto 0);

begin

    u_control : controlador port map(sq, sj, sk);

    u_cont0 : ffjk port map(sj(0), sk(0), clk, rst, '1', sq(0));
    u_cont1 : ffjk port map(sj(1), sk(1), clk, '1', rst, sq(1));
    u_cont2 : ffjk port map(sj(2), sk(2), clk, '1', rst, sq(2));

    s <= sq;

end architecture cont;

