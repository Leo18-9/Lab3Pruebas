library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity cont_bin_down is
	generic(cont_ancho: natural := 4);
	port(	clk, rst: in std_logic;
			bin_down: out std_logic_vector(cont_ancho-1 downto 0));
end cont_bin_down;

architecture rtl of cont_bin_down is
	signal cont_i: unsigned(cont_ancho-1 downto 0) := (others =>'1');
begin
	cont_bcd_proc: process(clk, rst)
	begin
		if(rst = '1') then
			cont_i <= (others => '1');
		elsif(rising_edge(clk)) then
			cont_i <= cont_i - 1;
		end if;
	end process cont_bcd_proc;
	
	bin_down <= std_logic_vector(cont_i);
	
end rtl;