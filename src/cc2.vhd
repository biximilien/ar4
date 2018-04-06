-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception de circuits integrés                   --
--             : Projet de conception d'un registre d'adresse mémoire        --
-- Par         : Maxime Gauthier                                             --
--               Jérémie St-Pierre Robitaille                                --
--               Philippe Tanguay                                            --
-- Date        : 04 / 18 / 2018                                              --
-- Fichier     : cc2.vhd                                                     --
-- Description : VHDL pour le circuit combinatoire de la fonction            --
--               incrémentation du deuxième bit le plus significatif.        --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity cc2 is
  port(
    q2   : in  std_logic;
    q1   : in  std_logic;
    q0   : in  std_logic;
    z    : out std_logic
  );
end cc2;

architecture behav of cc2 is
  begin
    z <= (q2 and not(q1)) or (not(q2) and q1 and q0) or (q2 and not(q0)) ;
end behav;
