
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity  alarm_clock_TB is
--  Port ( );
end  alarm_clock_TB;

architecture Behavioral of  alarm_clock_TB is

component  alarm_clock
    Port ( clock_10M : in STD_LOGIC;
           reset : in STD_LOGIC;
           signal_in : in STD_LOGIC;
           alarm : out STD_LOGIC);
end component;
--in
signal clock_10M : STD_LOGIC := '0';
signal reset : STD_LOGIC := '0';
signal signal_inD : STD_LOGIC := '0';
--out
signal alarm : STD_LOGIC := '0';

constant clock_period : time := 20 ns;

begin

uut:  alarm_clock PORT MAP (
    clock_10M => clock_10M,
    reset => reset,
    signal_in => signal_in,
    alarm => alarm);
    
clock_10M <= not clock_10M after 10ns;
reset <= '1', '0' after clock_period * 10;
process
begin
    signal_in <= '1';
    wait for 40us;
    signal_in <= '0';
    wait for 60us;
   
    signal_in <= '1';
    wait for 7us;
    signal_in <= '0';
    wait for 93us;
    
    signal_in <= '1';
    wait for 15us;
    signal_in <= '0';
    wait for 85us;
end process;
   
end Behavioral;