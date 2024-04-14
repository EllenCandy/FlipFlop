library ieee;
use ieee.std_logic_1164.all;
--ghdl -a *.vhdl
--ghdl -r **tb --stop-time=ns --wave=**.ghw

entity tb_flipflop_t is
    -- entidade vazia
end tb_flipflop_t;

architecture testt of tb_flipflop_t is
    constant CLK_PERIOD : time := 20 ns;

    component flipflop_t is    
    port(        
        t      : in  std_logic;
        clock  : in  std_logic;
        pr, cl : in  std_logic;
        q, nq  : out std_logic    
    );    

end component;

    signal st, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin
    -- instancia de JK e port map
    u_fft : flipflop_t port map(st, sclk, spr, scl, sq, snq);

    -- process
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        st  <= '1';
		wait for CLK_PERIOD;

        spr <= '0';
        scl <= '1';
        st  <= '0';
		wait for CLK_PERIOD;

        spr <= '1';
        scl <= '1';
        st  <= '0';
		wait for CLK_PERIOD;

        spr <= '1';
        scl <= '1';
        st  <= '1';
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

end architecture testt;
