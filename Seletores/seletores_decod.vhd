library ieee;
use ieee.std_logic_1164.all;

entity seletores_decod is
port(
	input: in std_logic_vector(9 downto 0);
	output: out std_logic_vector(19 downto 0)
);
end entity;

architecture bhv of seletores_decod is 
	begin
		
		output <= input & "0000000000";
	
	end architecture;