module draw_heap(clock, resetn, heap, x, y, colour, heap_finished);
	input clock, resetn, heap;
	output reg [6:0] x, y;
	output reg [2:0] colour;
	output heap_finished;
	reg [4:0] count;
	wire [2:0] q;
	wire counter;
	reg [1:0] times;
	
	
	always @(posedge counter)//draw heap have to draw the cube 1/60 frame
	begin
		if (!resetn) begin
			x <= 7'd0;
			y <= 7'd110;
			colour <= 3'b111;
			count <= 0;
			times <= 2'b00;
		end
		if (heap)
			begin
				if (count == 5'd0) begin
					x <= 7'd0;
					y <= 7'd110;
					colour <= 3'b111;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd1) begin
					x <= 7'd10;
					y <= 7'd110;
					count <= count + 1'b1;
					colour <= 3'b001;
					times <= times;
				end
				else if (count == 5'd2) begin
					x <= 7'd10;
					y <= 7'd100;
					colour <= 3'b010;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd3) begin
					x <= 7'd20;
					y <= 7'd110;
					colour <= 3'b100;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd4) begin
					x <= 7'd20;
					y <= 7'd100;
					colour <= 3'b101;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd5) begin
					x <= 7'd20;
					y <= 7'd90;
					colour <= 3'b110;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd6) begin
					x <= 7'd30;
					y <= 7'd110;
					colour <= 3'b111;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd7) begin
					x <= 7'd30;
					y <= 7'd100;
					colour <= 3'b011;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd8) begin
					x <= 7'd30;
					y <= 7'd90;
					colour <= 3'b001;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd9) begin
					x <= 7'd30;
					y <= 7'd80;
					colour <= 3'b101;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd10) begin
					x <= 7'd40;
					y <= 7'd110;
					colour <= 3'b101;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd11) begin
					x <= 7'd40;
					y <= 7'd100;
					colour <= 3'b010;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd12) begin
					x <= 7'd40;
					y <= 7'd90;
					colour <= 3'b011;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd13) begin
					x <= 7'd50;
					y <= 7'd110;
					colour <= 3'b110;
					count <= count + 1'b1;
					times <= times;
				end
				else if (count == 5'd14) begin
					x <= 7'd60;
					y <= 7'd110;
					colour <= 3'b111;
					count <= count + 1'b1;					
					times <= times;
				end
				else if (count == 5'd15) begin
					count <= count + 1'b1;
					times <= times + 1'b1;
				end
				else begin
					count <= 0;
				end
			end
		else
			begin
//				x <= 7'd0;
//				y <= 7'd110;
//				colour <= 3'b000;
				count <= 0;
				times <= 2'b00;
			end
	end
	
	assign heap_finished = (count == 5'd16) ? 1: 0;
	
	counter c0 (
		.clock(clock),
		.resetn(resetn),
		.enable(1'b1),
		.en(counter),
		.select(3'b101));
	
endmodule