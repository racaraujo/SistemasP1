`timescale 1ms/1000 us
module LCD_Initializer (
	dataa,
	datab,
	result,
	clk,
	clk_en,
	start,
	reset,
	done,
	lcd_enable,
	lcd_rs,
	lcd_rw,
	lcd_data
);

input [31:0] dataa;
input [31:0] datab;
input clk;
input clk_en;
input start;
input reset;
output [31:0] result;
output reg done;

output reg lcd_rs;
output reg lcd_rw;
output reg [7:0] lcd_data;
output reg lcd_enable;

reg [1:0] executed;

initial begin
	executed <= 2'b00;
	lcd_rs <= 1'b0;
	lcd_rw <= 1'b0;
	lcd_data <= 8'b00111000;
	#15;
	lcd_data <= 8'b00111000;
	#15;
	lcd_data <= 8'b00000110;
end
always @(lcd_data[7] == 0) begin
	if (executed == 2'b00) begin
		lcd_data <= 8'b00001110;
		executed <= 2'b01;
	end
	else if (executed == 2'b01) begin
		lcd_data <= 8'b00010000;
		executed <= 2'b10;
	end
	else begin done <= 1'b1; end
end
endmodule
