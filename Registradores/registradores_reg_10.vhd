library ieee;
use ieee.std_logic_1164.all;

entity registradores_reg_10 is
	port(	input: in std_logic_vector (9 downto 0);
			clock: in std_logic;
			reset: in std_logic;
			
		   output: out std_logic_vector (9 downto 0)
		 );
	end registradores_reg_10;
	
architecture behav of registradores_reg_10 is
	begin
		process (reset, clock)
			begin
				if reset = '0' then
					output <= "0000000000";					
					elsif rising_edge(clock) then
					output <= input;
				end if;
		end process;
	end architecture;