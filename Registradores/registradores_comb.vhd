library ieee;
use ieee.std_logic_1164.all;

entity registradores_comb is
	port( input1, input2: in std_logic;
	
			output: out std_logic
		 );
end entity;

architecture behav of registradores_comb is
begin
		output <=  input1 AND input2;
		
end architecture;