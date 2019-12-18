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
reg [31:0] temp_result;
initial begin
	lcd_rs <= 1'b0;
	lcd_rw <= 1'b0;
	//Return Home: Set DDRAM address to 8'h00
	lcd_enable <= 1'b1;
	lcd_data <= 8'h02;
	lcd_enable <= 1'b0;
	#0.01;
	//Send Function Set
	lcd_enable <= 1'b1;
	lcd_data <= 8'h38;
	lcd_enable <= 1'b0;
	#0.0039;
	//Send Display On/Off Control
	lcd_enable <= 1'b1;
	lcd_data <= 8'h0C;
	lcd_enable <= 1'b0;
	#0.0039;
	//Send entry mode set
	lcd_enable <= 1'b1;
	lcd_data <= 8'h06;
	lcd_enable <= 1'b0;
	#0.0039;
	//Send display clear
	lcd_enable <= 1'b1;
	lcd_data <= 8'h01;
	lcd_enable <= 1'b0;
	#1.64;
	done <= 1'b1;
	temp_result <= 8'b01001001;
end

assign result = temp_result;
/*initial begin
	if (executed == 2'b00) begin
		lcd_data <= 8'b00001110;
		executed <= 2'b01;
	end
	else if(executed == 2'b01) begin
		lcd_data <= 8'b00010000;
		executed <= 2'b10;
	end
	else begin done <= 1'b1; end
end*/
endmodule
