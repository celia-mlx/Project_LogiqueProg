LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.pack_neuralnet.ALL;  -- ajoute cette ligne !

ENTITY tb_network IS
END ENTITY;

ARCHITECTURE sim OF tb_network IS
    SIGNAL input_test  : tab_int_const := (OTHERS => 0);
    SIGNAL output_test : tab_layer(1 TO 2);  -- remet tab_layer
BEGIN
    DUT : ENTITY work.network
        GENERIC MAP (Nb_Layers => 3)
        PORT MAP (
            input  => input_test,
            output => output_test
        );
    PROCESS
    BEGIN
        input_test <= (0,0,0,0,0,0,0,0);
        WAIT FOR 20 ns;
        input_test <= (1,0,1,0,1,0,1,0);
        WAIT FOR 20 ns;
        input_test <= (1,1,1,1,1,1,1,1);
        WAIT FOR 20 ns;
        input_test <= (16,16,16,16,16,16,16,16);
        WAIT FOR 20 ns;
	-- Test 5 : entrées maximales répétées
	input_test <= (63,63,63,63,63,63,63,63);
	WAIT FOR 20 ns;
        WAIT;
    END PROCESS;
END ARCHITECTURE;