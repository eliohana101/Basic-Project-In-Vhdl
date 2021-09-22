----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2019 07:56:35 PM
-- Design Name: 
-- Module Name: alarm_countr - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alarm_countr is
    Port ( CLK_50M : in STD_LOGIC;
           RST : in STD_LOGIC;
           RAD : in STD_LOGIC;
           ALARM : out STD_LOGIC);
end alarm_countr;

architecture Behavioral of alarm_countr is

signal count : STD_LOGIC_VECTOR (8 downto 0) := (others => '0');

begin

process (CLK_50M)
begin
   if CLK_50M = '1' and CLK_50M'event then
      if (RST = '1') or (RAD ='0') then
         count <= (others => '0');
      elsif count < 500 then
         count <= count + 1;
      else
         count <= count;
      end if;
   end if;
end process;

process (CLK_50M)
begin
   if CLK_50M = '1' and CLK_50M'event then
      if RST = '1' then
         ALARM <= '0';
      elsif count = 500 then
         ALARM <= '1';
      else
         ALARM <= '0';
      end if;
   end if;
end process;

end Behavioral;
