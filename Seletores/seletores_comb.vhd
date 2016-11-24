library ieee;
use ieee.std_logic_1164.all;

entity seletores_comb is
port ( input: in std_logic_vector(1 downto 0);
		 output: out std_logic
	  );
end entity;

architecture bhv of seletores_comb is
	begin
	output <= input(0);
	end architecture;
	