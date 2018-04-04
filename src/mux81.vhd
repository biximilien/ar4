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

entity mux81 is
  port(
    i : in  std_logic_vector (7 downto 0);
    s : in  std_logic_vector (2 downto 0);
    z : out std_logic
  );
end mux81;

architecture behav of mux81 is
  begin
    process (i,s) is
      begin
        case s is
          when "000"  => z <= i(0);
          when "001"  => z <= i(1);
          when "010"  => z <= i(2);
          when "011"  => z <= i(3);
          when "100"  => z <= i(4);
          when "101"  => z <= i(5);
          when "110"  => z <= i(6);
          when others => z <= i(7);
        end case;
    end process;
end behav;
