library ieee;
use ieee.std_logic_1164.all;

entity flipflop_t is
    port(
        t      : in  std_logic;
        clock  : in  std_logic;
        pr, cl : in  std_logic;
        q, nq  : out std_logic
    );

end flipflop_t;

architecture fft of flipflop_t is

    signal s_snj , s_snk  : std_logic;
    signal s_sns , s_snr  : std_logic;
    signal s_sns2, s_snr2 : std_logic;
    signal s_eloS, s_eloR : std_logic;
    signal s_eloQ, s_elonQ: std_logic;
    signal s_nClock       : std_logic;
begin

    s_nClock <= not(clock);

    --  s_snj
    s_snj <= not(t and  clock and s_elonQ);

    --  s_snk
    s_snk   <= not(t and clock and s_eloQ);

    --  s_sns
    s_sns   <= not(pr and s_snj and s_eloR);

    --  s_snr
    s_snr   <= not(cl and s_snk and s_eloS);

    --  s_sns2
    s_sns2  <= not(s_sns and s_nClock);

    --  s_snr2
    s_snr2  <= not(s_snr and s_nClock);

    --  s_eloS
    s_eloS  <= not(pr and s_snj and s_eloR);

    --  s_eloR
    s_eloR  <= not(cl and s_snk and s_eloS);

    --  s_eloQ
    s_eloQ  <= not(pr and s_sns2 and s_elonQ);

    --  s_elonQ
    s_elonQ <= not(cl and s_snr2 and s_eloQ);

    q       <= s_eloQ;
    
    nq      <= s_elonQ;

end architecture fft;
