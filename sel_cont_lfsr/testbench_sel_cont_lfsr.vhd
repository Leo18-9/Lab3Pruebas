-- Descripcion: Simulacion funcional del Contador LFSR por medio de
-- 				 un Test Bench

------------------------------------------------------------
--Declaracion de Librerias
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Declaracion de Entidad
------------------------------------------------------------
entity testbench_sel_cont_lfsr is
end testbench_sel_cont_lfsr;

------------------------------------------------------------
-- Arquitectura
------------------------------------------------------------
architecture tb_behave of testbench_sel_cont_lfsr is
------- Declaracion de señales internas --------------------
	signal test_sel: std_logic_vector(1 downto 0);
	signal test_rst: std_logic := '0';
	signal test_clk: std_logic := '0';
	signal test_sal_lfsr: std_logic_vector(31 downto 0);
	signal test_bcd1, test_bcd2, test_bcd3, test_bcd4, test_bcd5, test_bcd6, test_bcd7, test_bcd8: std_logic_vector(6 downto 0);
begin

------ Instanciacion del Contador LFSR ---------------------
	U: entity work.sel_cont_lfsr port map(clk => test_clk, rst => test_rst, sal_lfsr => test_sal_lfsr, sel => test_sel, bcd1 => test_bcd1, bcd2 => test_bcd2, bcd3 => test_bcd3, bcd4 => test_bcd4, bcd5 => test_bcd5, bcd6 => test_bcd6, bcd7 => test_bcd7, bcd8 => test_bcd8);
	
------ Generacion de Señales de simulacion -----------------
	test_sel <= "00", "10" after 500ns, "01" after 1000ns, "11" after 1500ns;
	test_clk <= not test_CLK after 10ns;
	test_rst <= '1', '0' after 20ns, '1' after 510ns, '0' after 530ns, '1' after 1010ns, '0' after 1030ns,  '1' after 1510ns, '0' after 1530ns; 

end tb_behave;