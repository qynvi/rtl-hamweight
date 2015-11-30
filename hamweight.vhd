-- William Fan
-- 01/24/2011
-- Hamming Weight RTL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hamweight is
	generic (N: positive := 7);
	port (x: in bit_vector(N downto 0);
		  y: out bit_vector(6 downto 0));
end entity;

architecture hw of hamweight is
	type matrix is array (0 to N+1) of integer range 0 to N+1;
	signal count: matrix;
	begin
		count(0) <= 0;
		gen: for i in 0 to N generate
			count(i+1) <= count(i) + 1 WHEN x(i)='1' ELSE count(i);
		end generate;
		WITH count(N) SELECT
			y <= "0000001" when 0,
				 "1001111" when 1,
				 "0010010" when 2,
				 "0000110" when 3,
				 "1001100" when 4,
				 "0100100" when 5,
				 "0100000" when 6,
				 "0001111" when 7,
				 "0000000" when 8,
				 "0110000" when others;
end architecture;
