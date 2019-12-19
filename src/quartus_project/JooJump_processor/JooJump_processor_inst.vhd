	component JooJump_processor is
		port (
			clk_clk                 : in  std_logic                    := 'X';             -- clk
			counter_8bit_export     : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			jump_button_export      : in  std_logic                    := 'X';             -- export
			lcd_data_lcd_data       : out std_logic_vector(7 downto 0);                    -- lcd_data
			lcd_data_1_lcd_data     : out std_logic_vector(7 downto 0);                    -- lcd_data
			lcd_enable_lcd_enable   : out std_logic;                                       -- lcd_enable
			lcd_enable_1_lcd_enable : out std_logic;                                       -- lcd_enable
			lcd_rs_lcd_rs           : out std_logic;                                       -- lcd_rs
			lcd_rs_1_lcd_rs         : out std_logic;                                       -- lcd_rs
			lcd_rw_lcd_rw           : out std_logic;                                       -- lcd_rw
			lcd_rw_1_lcd_rw         : out std_logic;                                       -- lcd_rw
			pause_button_export     : in  std_logic                    := 'X';             -- export
			reset_reset_n           : in  std_logic                    := 'X';             -- reset_n
			reset_button_export     : in  std_logic                    := 'X'              -- export
		);
	end component JooJump_processor;

	u0 : component JooJump_processor
		port map (
			clk_clk                 => CONNECTED_TO_clk_clk,                 --          clk.clk
			counter_8bit_export     => CONNECTED_TO_counter_8bit_export,     -- counter_8bit.export
			jump_button_export      => CONNECTED_TO_jump_button_export,      --  jump_button.export
			lcd_data_lcd_data       => CONNECTED_TO_lcd_data_lcd_data,       --     lcd_data.lcd_data
			lcd_data_1_lcd_data     => CONNECTED_TO_lcd_data_1_lcd_data,     --   lcd_data_1.lcd_data
			lcd_enable_lcd_enable   => CONNECTED_TO_lcd_enable_lcd_enable,   --   lcd_enable.lcd_enable
			lcd_enable_1_lcd_enable => CONNECTED_TO_lcd_enable_1_lcd_enable, -- lcd_enable_1.lcd_enable
			lcd_rs_lcd_rs           => CONNECTED_TO_lcd_rs_lcd_rs,           --       lcd_rs.lcd_rs
			lcd_rs_1_lcd_rs         => CONNECTED_TO_lcd_rs_1_lcd_rs,         --     lcd_rs_1.lcd_rs
			lcd_rw_lcd_rw           => CONNECTED_TO_lcd_rw_lcd_rw,           --       lcd_rw.lcd_rw
			lcd_rw_1_lcd_rw         => CONNECTED_TO_lcd_rw_1_lcd_rw,         --     lcd_rw_1.lcd_rw
			pause_button_export     => CONNECTED_TO_pause_button_export,     -- pause_button.export
			reset_reset_n           => CONNECTED_TO_reset_reset_n,           --        reset.reset_n
			reset_button_export     => CONNECTED_TO_reset_button_export      -- reset_button.export
		);

