library ieee;
use ieee.std_logic_1164.all;
--ghdl -a *.vhdl
--ghdl -r **tb --stop-time=ns --wave=**.ghw

entity tb_flipflop is
    -- entidade vazia
end tb_flipflop;

architecture test of tb_flipflop is
    constant CLK_PERIOD : time := 20 ns;

    component flipflop is    
    port(        
        j, k   : in  std_logic;
        clock  : in  std_logic;
        pr, cl : in  std_logic;
        q, nq  : out std_logic    
    );    

end component;

    signal sj, sk, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin
    -- instancia de JK e port map
    u_ffjk : flipflop port map(sj, sk, sclk, spr, scl, sq, snq);

    -- process
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        sj  <= '1';
        sk  <= '0';
		wait for CLK_PERIOD;

        spr <= '0';
        scl <= '1';
        sj  <= '0';
        sk  <= '1';
		wait for CLK_PERIOD;

        spr <= '1';
        scl <= '1';
        sj  <= '0';
        sk  <= '1';
		wait for CLK_PERIOD;

        spr <= '1';
        scl <= '1';
        sj  <= '1';
        sk  <= '0';
		wait for CLK_PERIOD;

        -- desativação de clear
        scl <= '1';

        wait for CLK_PERIOD;

        -- alteração de J e K
--????
    
    end process;

    -- process para Clock
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;

    end process;

end architecture test;
