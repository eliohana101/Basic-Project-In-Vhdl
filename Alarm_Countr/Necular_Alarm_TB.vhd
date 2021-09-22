----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2019 08:18:18 PM
-- Design Name: 
-- Module Name: Necular_Alarm_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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

entity Necular_Alarm_TB is
--  Port ( );
end Necular_Alarm_TB;

architecture Behavioral of Necular_Alarm_TB is

component Necular_Alarm
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

uut: Necular_Alarm PORT MAP (
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
