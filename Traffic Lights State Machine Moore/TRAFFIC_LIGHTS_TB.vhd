----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2019 08:46:47 PM
-- Design Name: 
-- Module Name: TRAFFIC_LIGHTS_TB - Behavioral
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

entity traffic_lights is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           RED_W : out STD_LOGIC;
           GREEN_W : out STD_LOGIC;
           RED_C : out STD_LOGIC;
           ORANGE_C : out STD_LOGIC;
           GREEN_C : out STD_LOGIC);
end traffic_lights;

architecture Behavioral of traffic_lights is

type State_Machine is (START, WALK, STOP_WALK, PRE_DRIVE, DRIVE, STOP_DRIVE);
signal state :  State_Machine := START;

signal count : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');

begin

process (CLK)
begin
   if CLK = '1' and CLK'event then
      if (RST = '1') then
         count <= (others => '0');
      elsif count = 2400 then
         count <= (others => '0');
      else
         count <= count + 1;
      end if;
   end if;
end process;

process (CLK)
begin
   if CLK = '1' and CLK'event then
      if (RST = '1') then
         state <= START;
         RED_W <= '1';
         GREEN_W <= '0';
         RED_C <= '1';
         ORANGE_C <= '0';
         GREEN_C <= '0';
      else
         case state is
          when START =>  RED_W <= '1';
                         GREEN_W <= '0';
                         RED_C <= '1';
                         ORANGE_C <= '0';
                         GREEN_C <= '0';
                         if count = 100 then
                             state <= WALK;
                         end if;
          when WALK =>   RED_W <= '0';
                         GREEN_W <= '1';
                         RED_C <= '1';
                         ORANGE_C <= '0';
                         GREEN_C <= '0';
                         if count = 1100 then
                             state <= STOP_WALK;
                         end if;
          when STOP_WALK =>   RED_W <= '1';
                         GREEN_W <= '0';
                         RED_C <= '1';
                         ORANGE_C <= '0';
                         GREEN_C <= '0';
                         if count = 1200 then
                             state <= PRE_DRIVE;
                         end if;
          when PRE_DRIVE =>   RED_W <= '1';
                         GREEN_W <= '0';
                         RED_C <= '0';
                         ORANGE_C <= '1';
                         GREEN_C <= '0';
                         if count = 1300 then
                             state <= DRIVE;
                         end if;
          when DRIVE =>   RED_W <= '1';
                         GREEN_W <= '0';
                         RED_C <= '0';
                         ORANGE_C <= '0';
                         GREEN_C <= '1';
                         if count = 2300 then
                             state <= STOP_DRIVE;
                         end if;
          when STOP_DRIVE =>   RED_W <= '1';
                         GREEN_W <= '0';
                         RED_C <= '1';
                         ORANGE_C <= '0';
                         GREEN_C <= '0';
                         if count = 2400 then
                             state <= START;
                         end if;
          when others => RED_W <= '1';
                         GREEN_W <= '0';
                         RED_C <= '1';
                         ORANGE_C <= '0';
                         GREEN_C <= '0';
                         state <= START;
        end case;
      end if;
   end if;
end process;


end Behavioral;
