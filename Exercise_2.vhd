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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating

-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Exercise_2 is
 Port (x1,x2: in std_logic;
        y:  out std_logic_vector(1 downto 0);
        z:  out std_logic );
end Exercise_2;

architecture Behavioral of Exercise_2 is

type state_type is (A,B,C);
signal PS,NS : state_type;

begin
    comb_proc: process(PS,x1,x2)
    begin
    z <= '0';
    case PS is
    when A => 
     z<= '0'; 
    if (x1 = '0') then NS <= A;
    else NS <= B;
    end if;
    when C => 
    if (x2 = '0') then NS <= A; z<='1';
    else NS <= C; z<='0';
    end if;
    when B =>
    if (x2 = '0') then NS <= A; Z <= '1';
    else NS <= C; Z <= '0';
    end if;
    when others => 
    Z <= '1'; NS <= A;
    end case;
    end process comb_proc;

with PS select
Y <= "00" when A,
"10" when B,
"11" when C,
"00" when others;

end Behavioral;