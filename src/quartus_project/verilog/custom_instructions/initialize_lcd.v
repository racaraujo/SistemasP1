
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

reg [2:0] state;

always @ (posedge clk or posedge reset) begin

	if (reset) begin
		counter <= 16'd0;
		state   <= 3'b0;
		lcd_rs  <= 1'b0;
		lcd_rw  <= 1'b0;
		lcd_enable  <= 1'b0;
		lcd_data  <= 8'b0;
	end else begin
		if (clk_en) begin
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
						
					3'b110:begin //initializing next stage. deve enviar a imagem pro lcd
						done <= 1'b1;
						lcd_enable <= 1'b1;
						if (counter == 16'd50_000) begin
							state <= ;
							counter <= 16'd0;
						end else begin
							counter <= counter + 1'd1;
							state <= 3'b110;
						end	
						
					
					2'b10:begin // espera 1ms com en = 1; working
						done <= 1'b0;
						if (counter == 16'd50_000) begin
							state <= 2'b11;
							en    <= 1'b0;
							counter <= 16'd0;
						end else begin
							contador <= contador + 1'd1;
							state <= 2'b10;
						end
					end
					2'b11:begin //espera 1ms com en = 0; finish
						if (contador == 16'd50_000) begin
							done <= 1'b1;
							result <= 1'b1;
							state <= 2'b01;
							contador <= 16'd0;
							en <= 1'b0;
						end else begin
							contador <= contador + 16'd1;
						end
					end
				endcase
			end
	
	end
end

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
