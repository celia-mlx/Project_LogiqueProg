LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.pack_neuralnet.ALL;

ENTITY tb2_neuron IS
END ENTITY;

ARCHITECTURE testing OF tb2_neuron IS
	COMPONENT neuron
		GENERIC (
			wi : tab_int_const := (others => 27)
		);
		PORT (
			input  : IN  tab_int_const;
			output : OUT natural
		);
	END COMPONENT;

	SIGNAL X1 : tab_int_const := (others => 0);
	SIGNAL X2 : tab_int(7 DOWNTO 1) := (others => 0);
	SIGNAL Z1 : natural;
	SIGNAL Z2 : natural;
	SIGNAL WS1 : integer;
	SIGNAL WS2 : integer;
	SIGNAL status1 : string(4 DOWNTO 1);
	SIGNAL status2 : string(4 DOWNTO 1);

	SIGNAL concatZ : tab_int_const;

	CONSTANT weight_array1 : tab_int_const := (2, 2, 11, 3, 1, 7, 1, 1);
	CONSTANT weight_array2 : tab_int_const := (-9, 1, 5, 4, 1, 6, 9, 1);
BEGIN
	n1 : neuron
	GENERIC MAP(wi => weight_array1)
	PORT MAP(input => X1, output => Z1);

	concatZ <= X2(7) & Z1 & X2(6 DOWNTO 1);

	n2 : neuron
	GENERIC MAP(wi => weight_array2)
	PORT MAP(input => concatZ, output => Z2);


	status_control : PROCESS (X1, concatZ)
		VARIABLE weighted_sum1 : integer := 0;
		VARIABLE weighted_sum2 : integer := 0;
	BEGIN
		weighted_sum1 := 0;
		weighted_sum2 := 0;

		FOR i IN 1 TO N LOOP
			weighted_sum1 := weighted_sum1 + weight_array1(i) * X1(i);
			weighted_sum2 := weighted_sum2 + weight_array2(i) * concatZ(i);
		END LOOP;

		WS1 <= weighted_sum1;
		WS2 <= weighted_sum2;

		IF weighted_sum1 > T THEN
			status1 <= "Vmax";
		ELSE
			status1 <= "Vmin";
		END IF;

		IF weighted_sum2 > T THEN
			status2 <= "Vmax";
		ELSE
			status2 <= "Vmin";
		END IF;
	END PROCESS;


	simulation : PROCESS BEGIN
		X1 <= (others => 0);
		X2 <= (others => 0);
		wait for 100 us;
		X1 <= (others => 1);
		X2 <= (others => 1);
		wait for 100 us;
		X1 <= (others => 2);
		X2 <= (others => 2);
		wait for 100 us;
		X1 <= (others => 3);
		X2 <= (others => 3);
		wait for 100 us;
		X1 <= (others => 4);
		X2 <= (others => 4);
		wait for 100 us;
		X1 <= (others => 5);
		X2 <= (others => 5);
		wait for 100 us;
		X1 <= (others => 6);
		X2 <= (others => 6);
		wait for 100 us;
		X1 <= (others => 7);
		X2 <= (others => 7);
		wait for 100 us;
		X1 <= (others => 8);
		X2 <= (others => 8);
		wait for 100 us;
		X1 <= (others => 9);
		X2 <= (others => 9);
		wait for 100 us;
		X1 <= (others => 10);
		X2 <= (others => 10);
		wait for 100 us;
		X1 <= (others => 15);
		X2 <= (others => 15);
		wait for 100 us;
		X1 <= (others => 20);
		X2 <= (others => 20);
		wait for 100 us;
		X1 <= (6, 2, 3, 0, 5, 1, 2, 7);
		X2 <= (1, 9, 1, 4, 8, 2, 1);
		wait for 100 us;
		X1 <= (-6, 2, 3, 0, -5, 1, -2, -7);
		X2 <= (1, -9, 1, 4, -8, 2, 1);
		wait for 100 us;
	END PROCESS;
END ARCHITECTURE;