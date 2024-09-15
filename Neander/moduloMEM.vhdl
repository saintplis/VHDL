library ieee;
use ieee.std_logic_1164.all;

entity moduloMEM is
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
end entity;
architecture modMEM of moduloMEM is
    component regRDM is
        port(        
            datain : in std_logic_vector(7 downto 0);
            clk : in  std_logic;
            pr, cl : in  std_logic;
            rw : in  std_logic;
            dataout : out std_logic_vector(7 downto 0)    
        );
    end component;
    component regREM is
        port(        
            datain : in std_logic_vector(7 downto 0);
            clk : in  std_logic;
            pr, cl : in  std_logic;
            rw : in  std_logic;
            dataout : out std_logic_vector(7 downto 0)    
        );
    end component;
    component as_ram is
	    port(
		    addr  : in    std_logic_vector(7 downto 0);
		    data  : inout std_logic_vector(7 downto 0);
		    notrw : in    std_logic;
		    reset : in    std_logic
	    );
    end component;
    
    signal s_mux2rem, s_rem2mem, s_mem2rdm, s_rdm2barramento : std_logic_vector(7 downto 0) := (others => 'Z');

    begin
        s_mux2rem <= end_barr when nbarrPC = '0' else end_pc;

        u_regREM : regREM port map(s_mux2rem,  clk, '1', rst, rem_nrw, s_rem2mem);

        u_mem : as_ram port map(s_rem2mem, s_mem2rdm, mem_nrw, rst);       
    
        u_regRDM : regRDM port map(s_mem2rdm, clk, '1', rst, rdm_nrw, s_rdm2barramento);

        barramento <= s_rdm2barramento when mem_nrw = '0' else (others => 'Z');
        
        s_mem2rdm <= barramento when mem_nrw = '1' else (others => 'Z');
end architecture;
