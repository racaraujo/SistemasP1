
module JooJump_processor (
	clk_clk,
	counter_8bit_export,
	display_lcd_export,
	reset_reset_n);	

	input		clk_clk;
	input	[7:0]	counter_8bit_export;
	output	[7:0]	display_lcd_export;
	input		reset_reset_n;
endmodule
