library ieee;
use ieee.std_logic_1164.all;

entity seletores_mux20_4x1 is
port(
	sel: in std_logic_vector (1 downto 0);
	input1, input2, input3, input4: in std_logic_vector(19 downto 0);
	output: out std_logic_vector(19 downto 0)
);
end entity;

architecture bhv of seletores_mux20_4x1 is
	begin
		with sel select
		output <= input1 when "00",
					 input2 when "01",
					 input3 when "10",
					 input4 when others;
	end architecture;
 
 


