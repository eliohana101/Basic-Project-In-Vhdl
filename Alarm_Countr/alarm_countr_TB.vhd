
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

entity alarm_countr_TB is
--  Port ( );
end alarm_countr_TB;

architecture Behavioral of alarm_countr_TB is

component alarm_countr
    Port ( CLK_50M : in STD_LOGIC;
           RST : in STD_LOGIC;
           RAD : in STD_LOGIC;
           ALARM : out STD_LOGIC);
end component;
--in
signal CLK_50M : STD_LOGIC := '0';
signal RST : STD_LOGIC := '0';
signal RAD : STD_LOGIC := '0';
--out
signal ALARM : STD_LOGIC := '0';

constant clock_period : time := 20 ns;

begin

uut: alarm_countr PORT MAP (
    CLK_50M => CLK_50M,
    RST => RST,
    RAD => RAD,
    ALARM => ALARM);
    
CLK_50M <= not CLK_50M after 10ns;
RST <= '1', '0' after clock_period * 10;
process
begin
    RAD <= '1';
    wait for 40us;
    RAD <= '0';
    wait for 60us;
   
    RAD <= '1';
    wait for 7us;
    RAD <= '0';
    wait for 93us;
    
    RAD <= '1';
    wait for 15us;
    RAD <= '0';
    wait for 85us;
end process;
    
end Behavioral;
