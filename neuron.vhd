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
		clk    : IN  std_logic;
		output : OUT short_natural
	);
END ENTITY;

ARCHITECTURE behavior OF neuron IS
	SIGNAL sync_input : tab_int_const;
BEGIN	
	PROCESS(clk)
		VARIABLE weighted_sum : long_natural := 0;
		VARIABLE sync_ws      : long_natural := 0;
	BEGIN
		IF rising_edge(clk) THEN
			sync_input <= input;
			sync_ws := weighted_sum;
			weighted_sum := 0;

			-- computing y = w * x
			FOR i IN 1 TO N LOOP
				weighted_sum := weighted_sum + (wi(i) * sync_input(i));
			END LOOP;

			-- activation function (shifted Heaviside function)
			IF sync_ws > T THEN
				output <= Vmax;
			ELSE
				output <= Vmin;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;

