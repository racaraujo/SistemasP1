	component JooJump_processor is
		port (
			clk_clk             : in  std_logic                    := 'X';             -- clk
			counter_8bit_export : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			display_lcd_export  : out std_logic_vector(7 downto 0);                    -- export
			reset_reset_n       : in  std_logic                    := 'X'              -- reset_n
		);
	end component JooJump_processor;

	u0 : component JooJump_processor
		port map (
			clk_clk             => CONNECTED_TO_clk_clk,             --          clk.clk
			counter_8bit_export => CONNECTED_TO_counter_8bit_export, -- counter_8bit.export
			display_lcd_export  => CONNECTED_TO_display_lcd_export,  --  display_lcd.export
			reset_reset_n       => CONNECTED_TO_reset_reset_n        --        reset.reset_n
		);

