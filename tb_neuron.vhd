LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.pack_neuralnet.ALL;

ENTITY tb_neuron IS
END ENTITY;

ARCHITECTURE testing OF tb_neuron IS
	COMPONENT neuron
		GENERIC (
			wi : tab_int_const := (others => 27)
		);
		PORT (
			input  : IN  tab_int_const;
			output : OUT natural
		);
	END COMPONENT;

	SIGNAL X : tab_int_const := (others => 0);        -- testbench input vector
	SIGNAL Z : natural;                               -- testbench output value
	SIGNAL WS : integer := 0;                         -- internal weighted_sum value
	SIGNAL status : string(4 DOWNTO 1);               -- status string

	-- neuron synaptic weights
	CONSTANT weight_array : tab_int_const := (3, -2, 4, -9, 5, 1, 4, 6);
BEGIN
	-- Device Under Test (DUT)
	dut : neuron
	GENERIC MAP(wi => weight_array)
	PORT MAP(input => X, output => Z);
	
	
	-- status control process
	status_control : PROCESS (X)
		VARIABLE weighted_sum : integer := 0;
	BEGIN
		weighted_sum := 0;

		FOR i IN 1 TO N LOOP
			weighted_sum := weighted_sum + weight_array(i) * X(i);
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
		wait for 100 us;
		X <= (3, 7, 12, 5, 9, 14, 2, 8);
		wait for 100 us;
		X <= (11, 4, 6, 15, 1, 10, 13, 2);
		wait for 100 us;
		X <= (0, 0, 1, 1, 0, 0, 4, 0);
		wait for 100 us;
		X <= (5, 9, 3, 7, 12, 8, 16, 2);
		wait for 100 us;
		X <= (9, 14, 2, 8, 3, 7, 12, 5);
		wait for 100 us;
		X <= (1, 1, 1, 0, 3, 6, 2, 1);
		wait for 100 us;
		X <= (1, 1, 0, 0, 16, 9, 0, 0);
		wait for 100 us;
		X <= (9, 14, 2, 8, 3, 7, 12, 5);
		wait for 100 us;
		X <= (0, 0, 0, 1, 0, 22, 0, 5);
		wait for 100 us;
		X <= (0, 0, 2, 0, 0, 0, 7, 7);
		wait for 100 us;
		X <= (0, 2, 2, 0, 12, 0, 0, 0);
		wait for 100 us;
		X <= (3, 0, 2, 0, 0, 0, 0, 0);
		wait for 100 us;
		X <= (0, 5, 0, 0, 1, 1, 1, 1);
		wait for 100 us;
		X <= (33, 0, 0, 0, 0, 0, 0, 0);
		wait for 100 us;
		X <= (34, 0, 0, 0, 0, 0, 0, 0);
		wait for 100 us;
		X <= (4, 2, 1, 0, 8, 5, 17, 8);
		wait for 100 us;
		X <= (5, 2, 1, 0, 0, 0, 0, 0);
		wait for 100 us;
	END PROCESS;
END ARCHITECTURE;