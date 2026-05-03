LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.pack_neuralnet.ALL;

ENTITY tb_neuron_sync IS
END ENTITY;

ARCHITECTURE testing OF tb_neuron_sync IS
	COMPONENT neuron
		GENERIC (
			wi : tab_int_const := (others => 27)
		);
		PORT (
			input  : IN  tab_int_const;
			clk    : IN  std_logic;
			output : OUT short_natural
		);
	END COMPONENT;

	SIGNAL X      : tab_int_const := (others => 0);  -- testbench input vector
	SIGNAL Z      : short_natural;                   -- testbench output value
	SIGNAL WS     : long_natural := 0;               -- internal weighted_sum value
	SIGNAL CLOCK  : std_logic := '0';                -- testbench clock
	SIGNAL status : string(4 DOWNTO 1);              -- status string

	-- neuron synaptic weights
	CONSTANT weight_array : tab_int_const := (3, 1, 4, 2);
	CONSTANT CLOCK_PERIOD : time := 10 us;
BEGIN
	dut : neuron
	GENERIC MAP(wi => weight_array)
	PORT MAP(input => X, clk => CLOCK, output => Z);
	
	
	-- clock source
	clock_generation : PROCESS(CLOCK) BEGIN
		CLOCK <= not CLOCK after (CLOCK_PERIOD / 2);
	END PROCESS;
	
	
	
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
		X <= (0, 0, 0, 0);
		wait for CLOCK_PERIOD;
		X <= (1, 1, 0, 0);
		wait for CLOCK_PERIOD;
		X <= (1, 1, 1, 1);
		wait for CLOCK_PERIOD;
		X <= (5, 5, 5, 5);
		wait for CLOCK_PERIOD;
		X <= (9, 0, 5, 2);
		wait for CLOCK_PERIOD;
		X <= (10, 10, 10, 10);
		wait for CLOCK_PERIOD;
		X <= (10, 11, 10, 10);
		wait for CLOCK_PERIOD;
		X <= (33, 1, 0, 0);
		wait for CLOCK_PERIOD;
		X <= (34, 1, 0, 0);
		wait for CLOCK_PERIOD;
		X <= (35, 1, 0, 0);
		wait for CLOCK_PERIOD;
		X <= (33, 1, 0, 0);
		wait for CLOCK_PERIOD;
		X <= (38, 1, 0, 0);
		wait for CLOCK_PERIOD;
		X <= (33, 1, 0, 0);
		wait for CLOCK_PERIOD;
	END PROCESS;
END ARCHITECTURE;