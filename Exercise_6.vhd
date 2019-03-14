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

entity Exercise_6 is
Port (x,clk: in std_logic;
        y:  out std_logic_vector(1 downto 0);
        z1,z2:  out std_logic );
end Exercise_6;

architecture Behavioral of Exercise_6 is

type state_type is (A,B,C,D);
signal PS,NS : state_type;

begin
sync_proc: process(NS,CLK)

begin
if rising_edge(CLK) then
    PS <= NS;
end if;
end process;

    comb_proc: process(PS,x)
    begin
    z1 <= '0'; 
    z2 <= '0';    
    case PS is
    when A => 
     z1 <= '1'; 
    if (x = '1') then NS <= A;   z2 <='0';
    else NS <= C; z2<='0';
    end if;
    when B => 
     z1<='0';  
    if (x = '1') then NS <= B; z2 <='0';
    else NS <= D; z2 <='0';
    end if;
    when C => 
    z1 <= '1'; 
    if (x = '1') then NS <= A; Z2 <= '0';
    else NS <= B; Z2 <= '0';
    end if;
    when D => 
    z1 <= '0';   
    if (x = '1') then NS <= B; Z2 <= '0';
    else NS <= A; Z2 <= '1';
    end if;
    when others => 
    Z1 <= '1'; z2 <='1'; NS <= A;
    end case;
    end process comb_proc;

with PS select
Y <= "00" when A,
"01" when B,
"10" when C,
"11" when D,
"00" when others;

end Behavioral;
