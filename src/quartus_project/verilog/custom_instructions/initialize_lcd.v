//`timescale 1ns/100 ps`
module LCD_Initializer (
	dataa,
	datab,
	result,
	clk,
	clk_en,
	start,
	reset,
	done
);

input [31:0] dataa;
input [31:0] datab;
input clk;
input clk_en;
input start;
input reset;
output [31:0] result;
output done;

/*
initial begin
#10;                        // added small delay
result = dataa;
done = 1;
end
*/
endmodule
