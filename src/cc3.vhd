-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception de circuits integrés                   --
--             : Projet de conception d'un registre d'adresse mémoire        --
-- Par         : Maxime Gauthier                                             --
--               Jérémie St-Pierre Robitaille                                --
--               Philippe Tanguay                                            --
-- Date        : 04 / 18 / 2018                                              --
-- Fichier     : cc3.vhd                                                     --
-- Description : VHDL pour le circuit combinatoire de la fonction            --
--               incrémentation du bit le plus significatif.                 --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity cc3 is
  port(
    q3   : in  std_logic;
    q2   : in  std_logic;
    q1   : in  std_logic;
    q0   : in  std_logic;
    z    : out std_logic
  );
end cc3;

architecture behav of cc3 is
  begin
    z <= (q3 and not(q1)) or (q3 and not(q2)) or (q3 and not(q0)) or (not(q3) and q2 and q1 and q0);
end behav;
