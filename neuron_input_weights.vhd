LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.pack_neuralnet.ALL;

ENTITY neuron_input_weights IS
	PORT (
		input   : IN  tab_int_const;
		weights : IN  tab_int_const;
		output  : OUT short_natural
	);
END ENTITY;

ARCHITECTURE behavior OF neuron_input_weights IS
BEGIN	
	PROCESS(input, weights)
		VARIABLE weighted_sum : long_natural := 0;
	BEGIN
		weighted_sum := 0;

		-- computing y = w * x
		FOR i IN 1 TO N LOOP
			weighted_sum := weighted_sum + (weights(i) * input(i));
		END LOOP;

		-- activation function (shifted Heaviside function)
		IF weighted_sum > T THEN
			output <= Vmax;
		ELSE
			output <= Vmin;
		END IF;
	END PROCESS;
END ARCHITECTURE;

