library ieee;
use ieee.std_logic_1164.all;

entity seletores_mux2_1 is
port( sel: in std_logic;
		input1, input2: in std_logic_vector(9 downto 0);
		output: out std_logic_vector(9 downto 0)
);
end entity;

architecture bhv of seletores_mux2_1 is
	begin
		with sel select
		output <= input1 when '0',
		input2 when others;
	
	end architecture;
	