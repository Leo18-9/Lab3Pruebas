library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity cont_BCD is
	generic(cont_ancho: natural := 4);
	port(	clk, rst: in std_logic;
			bcd: out std_logic_vector(cont_ancho-1 downto 0));
end cont_BCD;

architecture rtl of cont_BCD is
	signal cont_i: unsigned(cont_ancho-1 downto 0) := (others =>'0');
begin
	cont_bcd_proc: process(clk, rst)
	begin
		if(rst = '1') then
			cont_i <= (others => '0');
		elsif(rising_edge(clk)) then
			if(cont_i = "1001") then
				cont_i <= (others => '0');
			else
				cont_i <= cont_i + 1;
			end if;
		end if;
	end process cont_bcd_proc;
	
	bcd <= std_logic_vector(cont_i);
	
end rtl;