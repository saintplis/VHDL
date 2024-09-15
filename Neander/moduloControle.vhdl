library ieee;
use ieee.std_logic_1164.all;

entity moduloControle is
    port(
        nz : in std_logic_vector(1 downto 0);
        outPC : out std_logic_vector(7 downto 0);
        barr : in std_logic_vector(7 downto 0);
        clk, rst : in std_logic;
        barrCout : out std_logic_vector(10 downto 0);
        pc_rw : in std_logic;
        ri_rw : in std_logic;
        barrInc : in std_logic
    );
end entity;

architecture behavioral of moduloControle is 
    component regRI is
        port(        
        d : in std_logic_vector(7 downto 0);
        clk : in  std_logic;
        pr, cl : in  std_logic;
        rw : in  std_logic;
        s : out std_logic_vector(7 downto 0)    
        );
    end component;

    component decodificador is
        port(
            instr_in : in std_logic_vector(7 downto 0);
            s_dec2uc : out std_logic_vector(10 downto 0)
        );
    end component;

    component uc is
        port(
            dec2uc : in std_logic_vector(10 downto 0);
            nz : in std_logic_vector(1 downto 0);
            clk, rst : in std_logic;
            barramento : out std_logic_vector(10 downto 0)
        );
    end component;

    component programCounter is
        port(        
             barrInc : in std_logic;
             pc_rw : in std_logic;
             clk : in std_logic;
             cl : in std_logic;
             endPC2MEM : out std_logic_vector(7 downto 0);
             barramento : in std_logic_vector(7 downto 0)
        );
     end component;

    component UnidadeControle is
        port(
            rst, clk: in std_logic;
            sel_op: in std_logic_vector(10 downto 0);
            flags_nz: in std_logic_vector(1 downto 0);
            saida: out std_logic_vector(10 downto 0)
        );
    end component;
    
    signal s_instIn : std_logic_vector(7 downto 0);
    signal s_instOut: std_logic_vector(10 downto 0);

begin
    
    u_programCounter : programCounter port map(barrInc, pc_rw, clk, rst, outPC, barr); --(5) == Pc_rw
    
    u_regRI : regRI port map(barr, clk, '1', rst, ri_rw, s_instIn);

    u_decodificador : decodificador port map(s_instIn, s_instOut);

    map_controle: UnidadeControle port map(rst, clk, s_instOut, nz, barrCout);
        
end architecture;


