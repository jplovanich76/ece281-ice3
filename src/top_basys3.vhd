
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
    -- 1️⃣ Declare the ripple_adder component
    component ripple_adder is
        port (
            A     : in std_logic_vector(3 downto 0);
            B     : in std_logic_vector(3 downto 0);
            Cin   : in std_logic;
            S     : out std_logic_vector(3 downto 0);
            Cout  : out std_logic
        );
    end component ripple_adder;

    -- 2️⃣ Declare internal signals
    signal A    : std_logic_vector(3 downto 0); 
    signal B    : std_logic_vector(3 downto 0);
    signal Cin  : std_logic;
    signal S    : std_logic_vector(3 downto 0);
    signal Cout : std_logic;

begin
    -- 3️⃣ Connect switches to input signals
    A    <= sw(4 downto 1);   -- Switches 4-1 → A
    B    <= sw(8 downto 5);   -- Switches 8-5 → B
    Cin  <= sw(0);            -- Switch 0 → Cin

    -- 4️⃣ Instantiate the ripple_adder component
    ripple_adder_inst: ripple_adder
    port map(
        A    => A,
        B    => B,
        Cin  => Cin,
        S    => S,
        Cout => Cout
    );

    -- 5️⃣ Map the outputs to LEDs
    led(3 downto 0)  <= S;       -- Sum output on LEDs 3-0
    led(15)          <= Cout;    -- Carry-out on LED 15
    led(14 downto 4) <= (others => '0'); -- Ground unused LEDs

end top_basys3_arch;

