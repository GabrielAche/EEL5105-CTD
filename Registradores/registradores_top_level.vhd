library ieee;
use ieee.std_logic_1164.all;

entity registradores_top_level is
	port( btn0, clk1, clk2, sel_pot, reset_pot: in std_logic;
			sel_pot10: in std_logic_vector(9 downto 0);
			
			reg_open, reg_alarm, out_pot: out std_logic_vector(9 downto 0)
		 );
	end entity;

architecture arch of registradores_top_level is

signal sg_reg_open, comb_reg_10, sg_reg_alarm, decod_red_4: std_logic_vector(9 downto 0);
signal rst_p: std_logic;


component registradores_comb10
	port( input: in std_logic_vector (9 downto 0);
	
			output: out std_logic_vector (9 downto 0)
		 );
end component;

	-- comb10_reg_10_2: registradores_comb10 port map (sg_reg_alarm, comb_reg_10);

component registradores_reg_10
	port(	input: in std_logic_vector (9 downto 0);
			clock: in std_logic;
			reset: in std_logic;
			
		   output: out std_logic_vector (9 downto 0)
		 );
	end component;

	-- reg_10_1: registradores_reg_10 port map (not(reg_open), clk1, btn0, reg_open);
	-- reg_10_2: registradores_reg_10 port map (comb_reg_10, clk2, btn0, reg_alarm);

component registradores_decod
	port( input: in std_logic_vector(9 downto 0);
	
			output: out std_logic_vector(9 downto 0)
		 );
end component;

	-- decod_to_red_4: registradores_decod(sel_pot, decod_red_4);

component registradores_comb
	port( input1, input2: in std_logic;
	
			output: out std_logic
		 );
end component;
	
	-- comb_to_reg_4: registradores_comb port map(btn0, reset_pot, rst_p);
	
component registradores_reg_4
	port(	input: in std_logic_vector(9 downto 0);
			enable, clk, reset: in std_logic;
			
			output: out std_logic_vector(9 downto 0)
		 );
	end component;
	
	-- reg_4: registradores_reg_4 port map (decod_red_4, en_pot, clk1, rst_p, out_pot);

	begin
	
	reg_10_1: registradores_reg_10 port map (not(sg_reg_open), clk1, btn0, sg_reg_open);
	
	comb10_reg_10_2: registradores_comb10 port map (sg_reg_alarm, comb_reg_10);
	reg_10_2: registradores_reg_10 port map (comb_reg_10, clk2, btn0, sg_reg_alarm);

	decod_to_red_4: registradores_decod port map (sel_pot10, decod_red_4);
	comb_to_reg_4: registradores_comb port map(btn0, reset_pot, rst_p);
	reg_4: registradores_reg_4 port map (decod_red_4, '0', clk1, rst_p, out_pot);
	
	reg_open <= sg_reg_open;
	reg_alarm <= sg_reg_alarm;

	end architecture;