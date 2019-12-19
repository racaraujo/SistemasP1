//Interface de envio de dados para LCD 16X2
//Autore Gabriel Miranda
// 08/03/2019
module lcd_driver (dataa, datab, result, clk, clk_en, start, reset, done, rs, rw, en, db);

	input [31:0] dataa;
	input [31:0] datab;
	input clk;
	input clk_en;
	input start;
	input reset;
	
	output reg [31:0] result;
	output reg done;
	
	output reg rs;
	output rw;
	output reg en;
	output reg[7:0] db;

	assign rw = 1'b0;
	
	reg [15:0] contador;
	
	localparam waiting = 2'b00, working = 2'b01, finish = 2'b11;
	
	reg [1:0] state;
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			contador <= 16'd0;
			rs       <= 1'b0;
			en       <= 1'b1;
			db       <= 8'b0;
			state    <= 1'b0;
		end else begin
			if (clk_en) begin
				case (state)
					waiting:begin
						done <= 1'b0;
						en <= 1'b1;
						if (start) begin
							state <= working;
							rs <= dataa[0];
							db <= datab[7:0];
							contador <= 16'd0;
						end else begin
							state <= waiting;
						end
					end
					working:begin // espera 1ms com en = 1;
						done <= 1'b0;
						if (contador == 16'd50_000) begin
							state <= finish;
							en    <= 1'b0;
							contador <= 16'd0;
						end else begin
							contador <= contador + 1'd1;
							state <= working;
						end
					end
					finish:begin //espera 1ms com en = 0;
						if (contador == 16'd50_000) begin
							done <= 1'b1;
							result <= 1'b1;
							state <= waiting;
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
	
endmodule