module move_x( left, right, move_l, move_r, already_moved);
	input already_moved;
	input left, right;
	output reg [3:0] move_l, move_r;
	
//	output [4:0] move;
	
//	assign move = move_l + move_r;
	
	always @(posedge left, posedge already_moved)
		begin
//		if (!resetn) begin
//			move_l <= 5'd0;
//		end
		if (already_moved) begin
			move_l <= 4'd0;
		end
		else
			 move_l <= 4'd10;
		end
		
	always @(posedge right, posedge already_moved)
		begin
//		if (!resetn) begin
//			move_r <= 5'd0;
//		end
		if (already_moved) begin
			move_r <= 4'd0;
		end
		else
			 move_r <= 4'd10;
		end
	
endmodule 