library ieee;
use ieee.std_logic_1164.all;

entity registradores_comb10 is
	port( input: in std_logic_vector(9 downto 0);
	
			output: out std_logic_vector(9 downto 0)
		 );
end entity;

architecture behav of registradores_comb10 is
begin
		output <=  input;
		
end architecture;