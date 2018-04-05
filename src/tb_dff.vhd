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

entity tb_dff is
end tb_dff;

architecture behav of tb_dff is
  component dff
    port(
      d   : in  std_logic;
      clk : in  std_logic;
      q   : out std_logic
    );
  end component;

  -- input
  signal x  : std_logic := '0';
  signal ck : std_logic := '0';

  -- output
  signal y  : std_logic;

  begin

    uut: dff PORT MAP (
      d => x,
      clk => ck,
      q => y
    );

    stim_proc: process

      begin

        -- hold reset state for 100 ns.
        wait for 100 ns;

        assert (y = 'U') report "Test failed. Expected output to be 'U'." severity failure;

        x <= '0';
        ck <= '0';

        wait for 100 ns;

        assert (y = 'U') report "Test failed. Expected output to be 'U'." severity failure;

        x <= '0';
        ck <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        x <= '0';
        ck <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        x <= '0';
        ck <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        x <= '1';
        ck <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        x <= '1';
        ck <= '1';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '1'." severity failure;

        x <= '1';
        ck <= '0';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '1'." severity failure;

        x <= '1';
        ck <= '1';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '1'." severity failure;

        x <= '0';
        ck <= '0';

        wait for 100 ns;

        assert (y = '1') report "Test failed. Expected output to be '1'." severity failure;

        x <= '0';
        ck <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        x <= '0';
        ck <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        x <= '0';
        ck <= '1';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        x <= '0';
        ck <= '0';

        wait for 100 ns;

        assert (y = '0') report "Test failed. Expected output to be '0'." severity failure;

        wait;

    end process;

end behav;
