library ieee;
use ieee.std_logic_1164.all;

entity seletores_top_level is
port(	out_pot, reg_alarm, reg_open, conta: in std_logic_vector(9 downto 0);
		mode: in std_logic_vector(39 downto 0);
		sel_disp, sel_led: in std_logic_vector(1 downto 0);
		
		led_out, sel_time, sel_pot: out std_logic_vector(9 downto 0);
		reg: out std_logic_vector(19 downto 0)
);   
end entity;

architecture arch of seletores_top_level is

signal decod_mux20 : std_logic_vector(19 downto 0);
signal comb_to_mux : std_logic;

component seletores_decod
port (
	input: in std_logic_vector(9 downto 0);
	output: out std_logic_vector(19 downto 0)
);
-- decod : seletores_decod port map (conta, decod_mux20);
end component;


component seletores_mux10_4x1
port(
	sel: in std_logic_vector(1 downto 0);
	input1, input2, input3, input4: in std_logic_vector(9 downto 0);
	output: out std_logic_vector(9 downto 0)
);
-- mux10_4x1 : seletores_mux10_4x1 port map (sel_led, "0000000000", reg_open, out_pot, reg_alarm, led_out);
end component;


component seletores_mux20_4x1
port(
	sel: in std_logic_vector(1 downto 0);
	input1, input2, input3, input4: in std_logic_vector(19 downto 0);
	output: out std_logic_vector(19 downto 0)
);
-- mux20_4x1 : seletores_mux20_4x1 port map (sel_disp, "00000110010111101111", mode(39 downto 21), decod_mux20, "11111100011100111110", reg);
end component;

component seletores_comb
port ( input: in std_logic_vector(1 downto 0);
		 output: out std_logic
	  );
end component;

component seletores_mux2_1
port(
	sel: in std_logic;
	input1, input2: in std_logic_vector(9 downto 0);
	output: out std_logic_vector(9 downto 0)
);
-- mux2x1_1 : seletores_mux2_1 port map (in_pot, SW(9 downto 0), mode(9 downto 0), sel_pot);
-- mux2x1_2 : seletores_mux2_1 port map (sel_disp, SW(9 downto 0), mode(19 downto 0), sel_time);
	end component;
	
	begin

		decod : seletores_decod port map (conta, decod_mux20);

		mux10_4x1 : seletores_mux10_4x1 port map (sel_led, "0000000000", reg_open, out_pot, reg_alarm, led_out);
	
		mux20_4x1 : seletores_mux20_4x1 port map (sel_disp, "00000110010111101111", mode(39 downto 20), decod_mux20, "11111100011100111110", reg);
		
		mux2x1_1 : seletores_mux2_1 port map ('0', "0000000000", mode(9 downto 0), sel_pot);
		
		
		mux2x1_comb : seletores_comb port map (sel_disp, comb_to_mux);
		mux2x1_2 : seletores_mux2_1 port map (comb_to_mux, "0000000000", mode(19 downto 10), sel_time);
		
	end architecture;
