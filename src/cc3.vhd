-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception des circuits integrés                  --
--             : Projet de conception d'un registre d'adressage              --
-- Par         : Maxime Gauthier, Jérémie St-Pierre Robitaille, Bobby        --
-- Date        : 04 / 18 / 2018                                              --
-- Fichier     : mux81.vhd                                                   --
-- Description : MUX81                                                       --
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
