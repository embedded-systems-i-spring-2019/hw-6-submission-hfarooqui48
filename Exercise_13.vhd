----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  
-- Create Date: 03/14/2019 01:48:22 AM
-- Design Name: 
-- Module Name: Exercise_2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Dependencies: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Exercise_13 is
 Port (x1,x2,clk: in std_logic;
        y:  out std_logic_vector(2 downto 0);
        cs,rd:  out std_logic );
end Exercise_13;

architecture Behavioral of Exercise_13 is

type state_type is (A,B,C,D);
signal PS,NS : state_type;

begin

sync_proc: process(NS,CLK)

begin
if rising_edge(CLK) then
    PS <= NS;
end if;

end process;
    comb_proc: process(PS,x1,x2)
    begin
    cs <= '0'; 
    rd<='0';   
    case PS is
    when A =>      
    if (x1 = '0') then NS <= B;   cs <='0'; rd <='1';
    else NS <= C; cs <= '1';    rd <= '0';
    end if;
    when B => 
     NS <= C; cs <= '1'; rd <= '1';
    when C => 
    if (x2 = '1') then NS <= C; cs <= '0'; rd <= '1';
    else NS <= A; cs <= '0'; rd <= '0';
    end if;    
    when others => 
        cs <= '1'; rd <= '1'; NS <= A;
    end case;
    end process comb_proc;

with PS select
Y <= "001" when A,
"010" when B,
"100" when C,
"000" when others;

end Behavioral;