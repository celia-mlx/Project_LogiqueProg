library ieee;
use ieee.std_logic_1164.all;
use work.pack_neuralnet.all;

ENTITY Test_network is
END Test_network;

ARCHITECTURE arch_test OF Test_network IS

    SIGNAL Vect_X_in  : tab_int_const := (others => 0);
    SIGNAL Vect_Z_out : tab_layer(1 to 2);

BEGIN
    Net : ENTITY work.network
        GENERIC MAP (Nb_Layers => 3)
        PORT MAP (
            input  => Vect_X_in,
            output => Vect_Z_out
        );

    PROCESS
        VARIABLE i : natural;
    BEGIN
        FOR i IN 0 TO 255 LOOP
            Vect_X_in(1) <= (i MOD 2) * 16;
            Vect_X_in(2) <= ((i/2) MOD 2) * 16;
            Vect_X_in(3) <= ((i/4) MOD 2) * 16;
            Vect_X_in(4) <= ((i/8) MOD 2) * 16;
            Vect_X_in(5) <= ((i/16) MOD 2) * 16;
            Vect_X_in(6) <= ((i/32) MOD 2) * 16;
            Vect_X_in(7) <= ((i/64) MOD 2) * 16;
            Vect_X_in(8) <= ((i/128) MOD 2) * 16;
            WAIT FOR 1 ns;
        END LOOP;
        WAIT;
    END PROCESS;

END arch_test;