
module JooJump_processor (
	clk_clk,
	counter_8bit_export,
	lcd_data_lcd_data,
	lcd_enable_lcd_enable,
	lcd_rs_lcd_rs,
	lcd_rw_lcd_rw,
	reset_reset_n,
	buttons_export);	

	input		clk_clk;
	input	[7:0]	counter_8bit_export;
	output	[7:0]	lcd_data_lcd_data;
	output		lcd_enable_lcd_enable;
	output		lcd_rs_lcd_rs;
	output		lcd_rw_lcd_rw;
	input		reset_reset_n;
	input	[2:0]	buttons_export;
endmodule
