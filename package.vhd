LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE pack_neuralnet IS
	CONSTANT T    : natural := 100;        -- threshold parameter
	CONSTANT Vmin : natural := 1;          -- output voltage (min)
	CONSTANT Vmax : natural := 16;         -- output voltage (max)
	CONSTANT N    : positive := 8;         -- no. of entries

	TYPE tab_int IS ARRAY(natural RANGE <>) OF integer;
	SUBTYPE tab_int_const IS tab_int(N DOWNTO 1);
END PACKAGE;