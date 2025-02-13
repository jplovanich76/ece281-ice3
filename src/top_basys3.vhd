
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;


entity top_basys3 is
    port(
        -- Switches for input
        sw  : in  std_logic_vector(8 downto 0);

        -- LEDs for output
        led : out std_logic_vector(15 downto 0)
    );
end top_basys3;

architecture top_basys3_arch of top_basys3 is 
    component ripple_adder is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
    end component ripple_adder;

    signal w_carry  : STD_LOGIC_VECTOR(3 downto 0); -- 4 bits, 0/1/2/3
begin
    ripple_adder_inst: ripple_adder
    port map(
    Cin => sw(0),
    
    A(0) => sw(1),
    A(1) => sw(2),
    A(2) => sw(3),
    A(3) => sw(4),
    
    B(0) => sw(12),
    B(1) => sw(13),
    B(2) => sw(14),
    B(3) => sw(15),
    
    S(0) => led(0),
    S(1) => led(1),
    S(2) => led(2),
    S(3) => led(3),
    
    Cout => led(15)
    );
 
   led(14 downto 4) <= (others => '0');
end top_basys3_arch;

