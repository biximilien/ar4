-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception de circuits integrés                   --
--             : Projet de conception d'un registre d'adresse mémoire        --
-- Par         : Maxime Gauthier                                             --
--               Jérémie St-Pierre Robitaille                                --
--               Philippe Tanguay                                            --
-- Date        : 04 / 18 / 2018                                              --
-- Fichier     : ar4.vhd                                                     --
-- Description : VHDL pour un registre d'adresse mémoire à 4 bits.           --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ar4 is
  port (
    Ia, Ib, Ic, Id  : in  std_logic;
    LD, INC, CLR    : in  std_logic;
    CLK             : in  std_logic;
    OA, OB, OC, OD  : out std_logic
  );
end ar4;

architecture behav of ar4 is

  component mux81
    port(
      i : in  std_logic_vector (7 downto 0);
      s : in  std_logic_vector (2 downto 0);
      z : out std_logic
    );
  end component;

  component dff
    port(
      d   : in  std_logic;
      clk : in  std_logic;
      q   : out std_logic
    );
  end component;

  component cc3 is
    port(
      q3   : in  std_logic;
      q2   : in  std_logic;
      q1   : in  std_logic;
      q0   : in  std_logic;
      z    : out std_logic
    );
  end component;

  component cc2 is
    port(
      q2   : in  std_logic;
      q1   : in  std_logic;
      q0   : in  std_logic;
      z    : out std_logic
    );
  end component;

  signal s3     : std_logic := '0';
  signal s2     : std_logic := '0';
  signal s1     : std_logic := '0';
  signal s0     : std_logic := '0';

  signal M3toD3 : std_logic := '0';
  signal M2toD2 : std_logic := '0';
  signal M1toD1 : std_logic := '0';
  signal M0toD0 : std_logic := '0';

  signal CC3toM3 : std_logic := '0';
  signal CC2toM2 : std_logic := '0';
  signal CC1toM1 : std_logic := '0';
  signal CC0toM0 : std_logic := '0';

  signal zero   : std_logic := '0';

  begin

    M3 : mux81 port map(
      s(2) => CLR,
      s(1) => INC,
      s(0) => LD,
      i(0) => s3,
      i(1) => Ia,
      i(2) => CC3toM3,
      i(3) => zero,
      i(4) => zero,
      i(5) => zero,
      i(6) => zero,
      i(7) => zero,
      z    => M3toD3
    );

    M2 : mux81 port map(
      s(2) => CLR,
      s(1) => INC,
      s(0) => LD,
      i(0) => s2,
      i(1) => Ib,
      i(2) => CC2toM2,
      i(3) => zero,
      i(4) => zero,
      i(5) => zero,
      i(6) => zero,
      i(7) => zero,
      z    => M2toD2
    );

    M1 : mux81 port map(
      s(2) => CLR,
      s(1) => INC,
      s(0) => LD,
      i(0) => s1,
      i(1) => Ic,
      i(2) => CC1toM1,
      i(3) => zero,
      i(4) => zero,
      i(5) => zero,
      i(6) => zero,
      i(7) => zero,
      z    => M1toD1
    );

    M0 : mux81 port map(
      s(2) => CLR,
      s(1) => INC,
      s(0) => LD,
      i(0) => s0,
      i(1) => Id,
      i(2) => CC0toM0,
      i(3) => zero,
      i(4) => zero,
      i(5) => zero,
      i(6) => zero,
      i(7) => zero,
      z    => M0toD0
    );

    D3 : dff port map(
      d   => M3toD3,
      q   => s3,
      clk => CLK
    );

    D2 : dff port map(
      d   => M2toD2,
      q   => s2,
      clk => CLK
    );

    D1 : dff port map(
      d   => M1toD1,
      q   => s1,
      clk => CLK
    );

    D0 : dff port map(
      d   => M0toD0,
      q   => s0,
      clk => CLK
    );

    C3 : CC3 port map(
      q3 => s3,
      q2 => s2,
      q1 => s1,
      q0 => s0,
      z  => CC3toM3
    );

    C2 : CC2 port map(
      q2 => s2,
      q1 => s1,
      q0 => s0,
      z  => CC2toM2
    );

    CC1toM1 <= not(s1) xor not(s0);
    CC0toM0 <= not(s0);

    OA <= s3;
    OB <= s2;
    OC <= s1;
    OD <= s0;

    -- process(clk) is
    --   begin
    --
    --
    --
    -- end process;

end behav;
