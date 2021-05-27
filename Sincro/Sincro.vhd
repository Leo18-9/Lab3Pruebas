-- Descripcion: Sincronizador controlado por flanco positivo del reloj y
-- 				 reset activo en bajo. Se usan 2 ff-D en cascada para evitar
-- 				 una señal metaestable a la salida.

------------------------------------------------------------
--Declaracion de Librerias
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Declaracion de Entidad 
------------------------------------------------------------
entity Sincro is
	port(D, CLK, RST: in std_logic;
			Q, Qneg: out std_logic);
end Sincro;

------------------------------------------------------------
-- Arquitectura
------------------------------------------------------------
architecture beh of Sincro is
------- Declaracion de señales internas --------------------
	signal Qint1, Qint2: std_logic;
begin

--Ambos ff-D cuentan con un reset sincronico y una
-- salida negada en caso de necesitarla

------- Descripcion del primer ff-D ------------------------
	ff1_d:process (CLK, RST)
	 begin
		if(RST = '0') then
			Qint1 <= '0';
		elsif(rising_edge (CLK)) then
			Qint1 <= D;
		end if;
	end process ff1_d;
	
------ Descripcion del segundo ff-D ------------------------
	ff2_d:process (CLK)
	 begin
		if(RST = '0') then
			Qint2 <= '0';
		elsif(rising_edge (CLK)) then
			Qint2 <= Qint1;
		end if;
	end process ff2_d;
	
----- Asignacion de la salida del sincronizador-------------
	Q <= Qint2;
	Qneg <= not (Qint2);
end beh;