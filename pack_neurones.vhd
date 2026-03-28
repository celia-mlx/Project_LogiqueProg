library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package pack_neurones is
	-- constante globales--
	constant T : natural :=100;
	constant VMAX : natural := 16;
	constant VMIN : natural :=1;
	constant N : natural :=8;

-- Type tableau non contraint entier--
type Tab_int is array (natural range <>) of integer;
-- sous type contraint (indice 1 à N)--
subtype Tab_int_const is Tab_int(1 to N);

end package pack_neurones; 