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

entity tb_mux81 is
end tb_mux81;

architecture behav of tb_mux81 is

  component mux81
    port(
      i : in  std_logic_vector (7 downto 0);
      s : in  std_logic_vector (2 downto 0);
      z : out std_logic
    );
  end component;

  -- inputs
  signal ins  : std_logic_vector (7 downto 0) := (others => '0');

  -- selects
  signal sel : std_logic_vector (2 downto 0) := (others => '0');

  -- outputs
  signal o : std_logic;

  begin

    uut: mux81 PORT MAP (
      i => ins,
      s => sel,
      z => o
    );

    stim_proc: process
  begin

     -- hold reset state for 100 ns.
     wait for 100 ns;

     assert (o = '0') report "Test failed. Expected output to be '0' for initial state." severity failure;

     ins <= "00000001";
     sel <= "000";

     wait for 100 ns;

     assert (o = '1') report "Test failed. Expected output to be '1' for select='000'" severity failure;

     ins <= "00000010";
     sel <= "001";

     wait for 100 ns;

     assert (o = '1') report "Test failed. Expected output to be '1' for select='001'" severity failure;

     ins <= "00000100";
     sel <= "010";

     wait for 100 ns;

     assert (o = '1') report "Test failed. Expected output to be '1' for select='010'" severity failure;

     ins <= "00001000";
     sel <= "011";

     wait for 100 ns;

     assert (o = '1') report "Test failed. Expected output to be '1' for select='011'" severity failure;

     ins <= "00010000";
     sel <= "100";

     wait for 100 ns;

     assert (o = '1') report "Test failed. Expected output to be '1' for select='100'" severity failure;

     ins <= "00100000";
     sel <= "101";

     wait for 100 ns;

     assert (o = '1') report "Test failed. Expected output to be '1' for select='101'" severity failure;

     ins <= "01000000";
     sel <= "110";

     wait for 100 ns;

     assert (o = '1') report "Test failed. Expected output to be '1' for select='110'" severity failure;

     ins <= "10000000";
     sel <= "111";

     wait for 100 ns;

     assert (o = '1') report "Test failed. Expected output to be '1' for select='111'" severity failure;

     wait;

   end process;

end behav;
