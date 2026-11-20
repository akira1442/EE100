----------------------------------------------------------------------------------
-- Company: UPMC
-- Engineer: Julien Denoulet
-- 
-- Diviseur d'Horloge : 100 MHz --> 25 MHz et 25 Hz
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ClkDiv is
    Port ( clk100,reset : in  STD_LOGIC;	-- Horloge 100 Mhz et Reset Asynchrone
           clk25 : out  STD_LOGIC);			-- Horloge 25 MHz
end ClkDiv;

architecture Behavioral of ClkDiv is

-- Compteur pour le Facteur de Division de l'Horloge 100 MHé
signal CPT_25M: std_logic_vector(1 downto 0);

-- Signal Interne de l'Horloge 25 MHz
signal clk_int: std_logic;
begin

-- Affectation Horloge 25 MHz en Sortie
clk25<=clk_int;

--------------------------------------------
-- GESTION DU COMPTEUR DE DIVISION
--		ET GENERATION DE L'HORLOGE 25 Hz
process(clk100,reset)

begin
        
    -- Reset Asynchrone
    if reset = '0' then 
        
        CPT_25M <= "00"; Clk_int <= '0';
    
    -- Sinon Test Front d'Horloge
	elsif rising_edge(clk100) then
		
	-- Incrémentation du Compteur de Division
	CPT_25M <= CPT_25M + 1;
		      
	   -- Si la Valeur Limite Est Atteinte
	   if CPT_25M = "10" then
			     
	       -- RAZ Compteur et Changement Etat Horloge 25 MHz
	       CPT_25M <= "00";
	       clk_int <= not clk_int;
	   end if;
	end if;
end process;
---------------------------------------------------------------	
end Behavioral;
