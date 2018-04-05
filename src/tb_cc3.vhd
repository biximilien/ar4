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

entity tb_cc3 is
end tb_cc3;

architecture behav of tb_cc3 is

  component cc3
    port(
      q3   : in std_logic;
      q2   : in  std_logic;
      q1   : in  std_logic;
      q0   : in  std_logic;
      z    : out std_logic
    );
  end component;

  signal a : std_logic := '0';
  signal b : std_logic := '0';
  signal c : std_logic := '0';
  signal d : std_logic := '0';
  signal y : std_logic;

  begin

    uut: cc3 PORT MAP (
      q3 => a,
      q2 => b,
      q1 => c,
      q0 => d,
      z  => y
    );

    stim_proc: process
      begin

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '0';
        c <= '0';
        d <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '0';
        c <= '0';
        d <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '0';
        c <= '1';
        d <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '0';
        c <= '1';
        d <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '1';
        c <= '0';
        d <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '1';
        c <= '0';
        d <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '1';
        c <= '1';
        d <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        a <= '0';
        b <= '1';
        c <= '1';
        d <= '1';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '0'." severity failure;

        a <= '1';
        b <= '0';
        c <= '0';
        d <= '0';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '0'." severity failure;

        a <= '1';
        b <= '0';
        c <= '0';
        d <= '1';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '0'." severity failure;

        a <= '1';
        b <= '0';
        c <= '1';
        d <= '0';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '0'." severity failure;

        a <= '1';
        b <= '0';
        c <= '1';
        d <= '1';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '0'." severity failure;

        a <= '1';
        b <= '1';
        c <= '0';
        d <= '0';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '0'." severity failure;

        a <= '1';
        b <= '1';
        c <= '0';
        d <= '1';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '0'." severity failure;

        a <= '1';
        b <= '1';
        c <= '1';
        d <= '0';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '0'." severity failure;

        a <= '1';
        b <= '1';
        c <= '1';
        d <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        wait;

    end process;

end behav;
