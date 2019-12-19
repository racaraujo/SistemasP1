
module JooJump_processor (
	clk_clk,
	counter_8bit_export,
	jump_button_export,
	lcd_data_lcd_data,
	lcd_data_1_lcd_data,
	lcd_enable_lcd_enable,
	lcd_enable_1_lcd_enable,
	lcd_rs_lcd_rs,
	lcd_rs_1_lcd_rs,
	lcd_rw_lcd_rw,
	lcd_rw_1_lcd_rw,
	pause_button_export,
	reset_reset_n,
	reset_button_export);	

	input		clk_clk;
	input	[7:0]	counter_8bit_export;
	input		jump_button_export;
	output	[7:0]	lcd_data_lcd_data;
	output	[7:0]	lcd_data_1_lcd_data;
	output		lcd_enable_lcd_enable;
	output		lcd_enable_1_lcd_enable;
	output		lcd_rs_lcd_rs;
	output		lcd_rs_1_lcd_rs;
	output		lcd_rw_lcd_rw;
	output		lcd_rw_1_lcd_rw;
	input		pause_button_export;
	input		reset_reset_n;
	input		reset_button_export;
endmodule
