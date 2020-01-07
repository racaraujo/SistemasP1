
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
input [31:0] datab; //enable
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

reg [2:0] state;

always @ (posedge clk or posedge reset) begin

	if(reset) begin
		counter <= 16'd0;
		state   <= 3'b0;
		lcd_rs  <= 1'b0;
		lcd_rw  <= 1'b0;
		lcd_enable  <= 1'b0;
		lcd_data  <= 8'b0;
	end 
	else begin
		if(clk_en && datab == 32'b0) begin
				case (state)
				3'b001:begin //initializing stage 1, Return Home: Set DDRAM address to 8'h00
					done <= 1'b0;
					lcd_enable <= 1'b1;
					if (start) begin
						state <= 3'b010;
						lcd_rs <= 1'b0;
						lcd_rw <= 1'b0;
						lcd_data <= 8'h02;
						counter <= 16'd0;
					end else begin
						state <= 2'b01;
					end
				end
				
				3'b010:begin //initializing stage 2, Send Function Set
					done <= 1'b0;
					lcd_enable <= 1'b1;
					if (counter == 16'd50_000) begin
						state <= 3'b011;
						lcd_data <= 8'h38;
						counter <= 16'd0;
					end else begin
						counter <= counter + 1'd1;
						state <= 3'b010;
					end
				end
				
				3'b011:begin //initializing stage 3, Send Display On/Off Control
					done <= 1'b0;
					lcd_enable <= 1'b1;
					if (counter == 16'd50_000) begin
						state <= 3'b100;
						lcd_data <= 8'h0C;
						counter <= 16'd0;
					end else begin
						counter <= counter + 1'd1;
						state <= 3'b011;
					end	
				end
				
				3'b100:begin //initializing stage 4, Send entry mode set
					done <= 1'b0;
					lcd_enable <= 1'b1;
					if (counter == 16'd50_000) begin
						state <= 3'b101;
						lcd_data <= 8'h06;
						counter <= 16'd0;
					end else begin
						counter <= counter + 1'd1;
						state <= 3'b100;
					end
				end
				
				3'b101:begin //initializing stage 5, Send display clear
					done <= 1'b0;
					lcd_enable <= 1'b1;
					if (counter == 16'd50_000) begin
						state <= 3'b110;
						lcd_data <= 8'h01;
						counter <= 16'd0;
					end else begin
						counter <= counter + 1'd1;
						state <= 3'b101;
					end
				end
				
				3'b110:begin //initializing next stage. deve enviar a imagem pro lcd
					if (counter == 16'd50_000) begin
						done <= 1'b1;
						lcd_enable <= 1'b0;
						result <= 1'b1
						state <= 3'b111; // indica que acabou a inicialização
						counter <= 16'd0;
					end else begin
						counter <= counter + 1'd1;
					end	
				end	
				
			endcase
		end
		
		if(datab == 32'b1 && state == 3'b111) begin
		
		end//if
	end//else
end//always

assign result = temp_result;

endmodule
