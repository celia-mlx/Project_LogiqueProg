library ieee;
use ieee.std_logic_1164.all;
use work.pack_neurones.all;

entity tb_neurone is
end entity tb_neurone;

architecture sim of tb_neurone is

    signal X_test : Tab_int_const := (others => 0);
    signal Z_test : natural;

begin

    UUT : entity work.neurone
        generic map (Wi => (1, 2, 3, 4, 1, 2, 3, 4))
        port map (X => X_test, Z => Z_test);

    process
    begin
        -- Test 1 : tout à 0
        X_test <= (0, 0, 0, 0, 0, 0, 0, 0);
        wait for 10 ns;

        -- Test 2 : petites valeurs -> VMIN
        X_test <= (1, 2, 3, 4, 1, 2, 3, 4);
        wait for 10 ns;

        -- Test 3 : valeurs moyennes
        X_test <= (5, 5, 5, 5, 5, 5, 5, 5);
        wait for 10 ns;

        -- Test 4 : grandes valeurs -> VMAX
        X_test <= (20, 20, 20, 20, 20, 20, 20, 20);
        wait for 10 ns;

        wait;
    end process;

end architecture sim;