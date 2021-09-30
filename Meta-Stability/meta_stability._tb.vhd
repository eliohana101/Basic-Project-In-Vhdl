
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE ieee.numeric_std.ALL;
 
ENTITY meta_stability_tb IS
END meta_stability_tb;
 
ARCHITECTURE behavior OF meta_stability_tb IS 
 
 
    COMPONENT meta_stability
    PORT(
         clk_dst : IN  std_logic;
         rst_in : IN  std_logic;
         rst_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_dst : std_logic := '0';
   signal rst_in : std_logic := '0';

 	--Outputs
   signal rst_out : std_logic;

   constant clk_dst_period : time := 10ns;
 
BEGIN
 
   uut: meta_stability PORT MAP (
          clk_dst => clk_dst,
          rst_in => rst_in,
          rst_out => rst_out
        );
	
	clk_dst <= not clk_dst after 5 ns;
	
	makeRst: process
      begin
			rst_in <= '0';
			wait for clk_dst_period * 20;
			
			rst_in <= '1';
			wait for clk_dst_period;
			
			-- clear
			rst_in <= '0';
			wait for clk_dst_period * 10;
			
			rst_in <= '1';
			wait for clk_dst_period * 0.3;
			
			-- clear
			rst_in <= '0';
			wait for clk_dst_period * 10;
			
			rst_in <= '1';
			wait for clk_dst_period * 2;
			
			rst_in <= '0';
			wait for clk_dst_period * 10;
			
			wait for clk_dst_period * 0.2;
			
			rst_in <= '1';
			wait for clk_dst_period * 0.5;
			
			rst_in <= '0';
			wait;
			
		end process makeRst;		
	

END;
