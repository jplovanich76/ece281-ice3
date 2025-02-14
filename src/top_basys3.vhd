
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
 
 
entity top_basys3 is
	port(
		-- Switches
		sw		:	in  std_logic_vector(15 downto 0);
		-- LEDs
		led	    :	out	std_logic_vector(15 downto 0)
	);
end top_basys3;
 
architecture top_basys3_arch of top_basys3 is 
    -- declare the component of your top-level design
    component ripple_adder
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Cin : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Cout : out STD_LOGIC);
    end component;
 
    -- declare any signals you will need
    signal w_A, w_B, w_S : std_logic_vector(3 downto 0);
    signal w_Cin, w_Cout : std_logic;	
begin
	-- PORT MAPS --------------------
	w_A   <= sw(4 downto 1);   -- A from switches 4-1
    w_B   <= sw(15 downto 12); -- B from switches 15-12
    w_Cin <= sw(0);            -- Cin from switch 0
	---------------------------------
	-- Instantiate ripple_adder
    ripple_adder_inst : ripple_adder
        port map(
            A    => w_A,
            B    => w_B,
            Cin  => w_Cin,
            S    => w_S,
            Cout => w_Cout
        );
 
    -- Connect the switches and LEDs
    led(3 downto 0) <= w_S;    -- Sum to LED
    led(15) <= w_Cout; -- Carry-out to LED


	-- CONCURRENT STATEMENTS --------
	led(14 downto 4) <= (others => '0'); -- Ground unused LEDs
	---------------------------------
end top_basys3_arch;

