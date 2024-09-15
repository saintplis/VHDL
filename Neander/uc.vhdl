library ieee;
use ieee.std_logic_1164.all;

entity UnidadeControle is
    port(
        rst, clk: in std_logic;      
        sel_op: in std_logic_vector(10 downto 0);
        flags_nz: in std_logic_vector(1 downto 0);
        saida: out std_logic_vector(10 downto 0)
    );
end entity;

architecture behavior of UnidadeControle is 
    component contador is
        port(
            rst : in  std_logic;
            clk  : in  std_logic;
            s: out std_logic_vector (2 downto 0)
        );
    end component;

    component IADD is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    component ILDA is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    component IOR is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    component IAND is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    component IJMP is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    component IJCOND is
        port(
            flag: in std_logic;
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    component INOP is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    component ISTA is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    component IHLT is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;

    component INOT is
        port(
            ciclo: in std_logic_vector(2 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
     end component;

    signal b_nop, b_sta, b_lda, b_add, b_and, b_or, b_not, b_jmp, b_jn, b_jz, b_hlt: std_logic_vector(10 downto 0);
    
    signal ciclo: std_logic_vector(2 downto 0);
begin
    map_contador: contador port map(rst, clk, ciclo);

    map_nop: INOP port map(ciclo, b_nop);

    map_sta: ISTA port map(ciclo, b_sta);

    map_lda: ILDA port map(ciclo, b_lda);

    map_add: IADD port map(ciclo, b_add);
    
    map_and: IAND port map(ciclo, b_and);

    map_or: IOR port map(ciclo, b_or);

    map_not: INOT port map(ciclo, b_not);

    map_jmp: IJMP port map(ciclo, b_jmp);

    map_jn: IJCOND port map(flags_nz(1), ciclo, b_jn); -- se usa o COND pros dois

    map_jz: IJCOND port map(flags_nz(0), ciclo, b_jz); -- se usa o COND pros dois

    map_hlt: IHLT port map(ciclo, b_hlt);

    saida <= b_nop when sel_op = "10000000000" else
         b_sta when sel_op = "01000000000" else
         b_lda when sel_op = "00100000000" else
         b_add when sel_op = "00010000000" else
         b_and when sel_op = "00001000000" else
         b_or when sel_op = "00000100000" else
         b_not when sel_op = "00000010000" else
         b_jmp when sel_op = "00000001000" else
         b_jn when sel_op = "00000000100" else
         b_jz when sel_op = "00000000010" else
         b_hlt when sel_op = "00000000001" else
         (others => 'Z');
end architecture;