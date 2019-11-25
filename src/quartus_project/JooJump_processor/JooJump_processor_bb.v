
module JooJump_processor (
	clk_clk,
	display_lcd_export,
	reset_reset_n,
	counter_8bit_export);	

	input		clk_clk;
	output	[7:0]	display_lcd_export;
	input		reset_reset_n;
	input	[7:0]	counter_8bit_export;
endmodule
