-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception de circuits integrés                   --
--             : Projet de conception d'un registre d'adresse mémoire        --
-- Par         : Maxime Gauthier                                             --
--               Jérémie St-Pierre Robitaille                                --
--               Philippe Tanguay                                            --
-- Date        : 04 / 18 / 2018                                              --
-- Fichier     : dff.vhd                                                     --
-- Description : VHDL pour une implémentation d'une bascule D.               --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity dff is
  port(
    d   : in  std_logic;
    clk : in  std_logic;
    q   : out std_logic
  );
end dff;

architecture behav of dff is
  begin
    process (clk) is
     begin
        if rising_edge(clk) then
          q <= d;
        end if;
     end process;
end behav;
