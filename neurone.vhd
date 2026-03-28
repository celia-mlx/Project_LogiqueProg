library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pack_neurones.all;

entity neurone is 
    generic (
        Wi : Tab_int_const := (others => 27)
    );
    port (
        X : in  Tab_int_const;
        Z : out natural
    );
end entity neurone;

architecture rtl of neurone is
begin
    process(X)
        variable Y : integer := 0;
    begin	
        Y := 0;
        for i in 1 to N loop
            Y := Y + Wi(i) * X(i);
        end loop;

        if Y > T then
            Z <= VMAX;
        else
            Z <= VMIN;
        end if;
    end process;
end architecture rtl;
