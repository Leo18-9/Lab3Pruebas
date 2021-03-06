-- Descripcion: Simulacion funcional del Modulo generador de PWM por medio de
-- 				 un Test Bench

------------------------------------------------------------
--Declaracion de Librerias
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

------------------------------------------------------------
-- Declaracion de Entidad (Vacia)
------------------------------------------------------------
entity testbench_pwm_8b is
end;

------------------------------------------------------------
-- Arquitectura
------------------------------------------------------------
architecture tb_behave of testbench_pwm_8b is
------- Declaracion de señales internas --------------------
	signal test_rst, test_load: std_logic := '0';
	signal test_clk: std_logic := '0';
	signal test_pwm_out: std_logic := '1';
	signal test_duty_cicle: std_logic_vector(7 downto 0);
	signal test_bcd_sal: std_logic_vector(6 downto 0);
begin

------ Instanciacion del Modulo PWM ------------------------
	U: entity work.pwm_8b port map(clk => test_clk, rst => test_rst, load => test_load, duty_cicle => test_duty_cicle, pwm_out => test_pwm_out, bcd_sal => test_bcd_sal);

------ Generacion de Señales de simulacion -----------------
	test_clk <= not test_clk after 10ns;
	test_duty_cicle <= "01100100", "00101111" after 5000ns, "00000111" after 60000ns;
	test_load <= '0', '1' after 100ns, '0' after 140ns, '1' after 50100ns, '0' after 50140ns, '1' after 120000ns, '0' after 120040ns;
	test_rst <= '0';
	
end tb_behave;