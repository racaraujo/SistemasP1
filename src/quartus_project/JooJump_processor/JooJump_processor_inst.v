	JooJump_processor u0 (
		.clk_clk               (<connected-to-clk_clk>),               //          clk.clk
		.counter_8bit_export   (<connected-to-counter_8bit_export>),   // counter_8bit.export
		.lcd_data_lcd_data     (<connected-to-lcd_data_lcd_data>),     //     lcd_data.lcd_data
		.lcd_enable_lcd_enable (<connected-to-lcd_enable_lcd_enable>), //   lcd_enable.lcd_enable
		.lcd_rs_lcd_rs         (<connected-to-lcd_rs_lcd_rs>),         //       lcd_rs.lcd_rs
		.lcd_rw_lcd_rw         (<connected-to-lcd_rw_lcd_rw>),         //       lcd_rw.lcd_rw
		.reset_reset_n         (<connected-to-reset_reset_n>)          //        reset.reset_n
	);

