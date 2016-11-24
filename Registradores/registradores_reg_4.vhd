library ieee;
use ieee.std_logic_1164.all;

entity registradores_reg_4 is
	port(	input: in std_logic_vector(9 downto 0);
			enable, clk, reset: in std_logic;
			
			output: out std_logic_vector(9 downto 0)
		 );
	end entity;

architecture behav of registradores_reg_4 is

	signal actual_state, next_state: std_logic_vector(9 downto 0);

	begin
		next_state <= input when enable='1' else actual_state;
	
		process(clk, reset) is
			begin
				if reset='1' then
					actual_state <= (others=>'0');
				elsif rising_edge(clk) then
					actual_state <= next_state;
				end if;
		end process;	

		output <= actual_state;
	end architecture;