LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.pack_neuralnet.ALL;

ENTITY tb_neuron_input_weights IS
END ENTITY;

ARCHITECTURE testing OF tb_neuron_input_weights IS
	COMPONENT neuron_input_weights IS
		PORT (
			input   : IN  tab_int_const;
			weights : IN  tab_int_const;
			output  : OUT short_natural
		);
	END COMPONENT;

	SIGNAL X : tab_int_const := (others => 0);   -- testbench input vector
	SIGNAL W : tab_int_const := (others => 0);   -- neuron synaptic weights
	SIGNAL Z : natural;                          -- testbench output value
	SIGNAL WS : integer := 0;                    -- internal weighted_sum value
	SIGNAL status : string(4 DOWNTO 1);          -- status string
BEGIN
	-- Device Under Test (DUT)
	dut : neuron_input_weights
	PORT MAP(input => X, weights => W, output => Z);
	
	
	-- status control process
	status_control : PROCESS(X, W)
		VARIABLE weighted_sum : integer := 0;
	BEGIN
		weighted_sum := 0;

		FOR i IN 1 TO N LOOP
			weighted_sum := weighted_sum + W(i) * X(i);
		END LOOP;

		WS <= weighted_sum;

		IF weighted_sum > T THEN
			status <= "Vmax";         -- the weighted sum surpasses the neuron's threshold
		ELSE
			status <= "Vmin";         -- the weighted sum does not surpass the neuron's threshold
		END IF;
	END PROCESS;

	
	
	-- simulation course
	simulation : PROCESS BEGIN
		X <= (others => 0);
		W <= (others => 0);
		wait for 100 us;
		X <= (3, 7, 12, 5);
		W <= (10, 0, 1, 4);
		wait for 100 us;
		X <= (3, 7, 12, 5);
		W <= (10, 0, 5, 4);
		wait for 100 us;
		X <= (3, 4, 9, 5);
		W <= (10, 3, 5, 4);
		wait for 100 us;
		X <= (9, 14, 2, 8);
		W <= (0, 0, 0, 0);
		wait for 100 us;
	END PROCESS;
END ARCHITECTURE;