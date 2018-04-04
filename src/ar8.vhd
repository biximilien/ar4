-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception des circuits integrés                  --
--             : Projet de conception d'un registre d'adressage              --
-- Par         : Maxime Gauthier, Jérémie St-Pierre Robitaille, Bobby        --
-- Date        : 04 / 18 / 2018                                              --
-- Fichier     : ar8.vhd                                                     --
-- Description : VHDL pour un registre d'adressage a 8 bits                  --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ar8 is
  port (
    Ia, Ib, Ic, Id  : in  std_logic;
    LD, INC, CLR    : in  std_logic;
    CLK             : in  std_logic;
    OA, OB, OC, OD  : out std_logic
  );
end ar8;

architecture ar8 of ar8 is

  begin

    OA <= Ia;
    OB <= Ib;
    OC <= Ic;
    OD <= Id;

end ar8;
