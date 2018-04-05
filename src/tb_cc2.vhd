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

entity tb_cc2 is
end tb_cc2;

architecture behav of tb_cc2 is

  component cc2
    port(
      q2   : in  std_logic;
      q1   : in  std_logic;
      q0   : in  std_logic;
      z    : out std_logic
    );
  end component;

  signal a : std_logic := '0';
  signal b : std_logic := '0';
  signal c : std_logic := '0';
  signal y : std_logic;

  begin

    uut: cc2 PORT MAP (
      q2 => a,
      q1 => b,
      q0 => c,
      z  => y
    );

    stim_proc: process
      begin

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '0';
        c <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '0';
        c <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '1';
        c <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '1';
        c <= '1';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '1'." severity failure;

        a <= '1';
        b <= '0';
        c <= '0';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '1'." severity failure;

        a <= '1';
        b <= '0';
        c <= '1';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '1'." severity failure;

        a <= '1';
        b <= '1';
        c <= '0';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '1'." severity failure;

        a <= '1';
        b <= '1';
        c <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        wait;

    end process;

end behav;
