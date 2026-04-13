LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.pack_neuralnet.ALL;

ENTITY neuron IS
	GENERIC (
		wi : tab_int_const := (others => 27)
	);
	PORT (
		input  : IN  tab_int_const;
		output : OUT natural
	);
END ENTITY;

ARCHITECTURE behavior OF neuron IS
BEGIN
	PROCESS(input)
		VARIABLE weighted_sum : integer := 0;
	BEGIN
		weighted_sum := 0;

		FOR i IN 1 TO N LOOP
			weighted_sum := weighted_sum + (wi(i) * input(i));
		END LOOP;

		IF weighted_sum > T THEN
			output <= Vmax;
		ELSE
			output <= Vmin;
		END IF;
	END PROCESS;
END ARCHITECTURE;