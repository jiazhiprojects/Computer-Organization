module check_move(clock, resetn, x, y, c1, c2, c3,c4, c5, c6, c7, can_move_l, can_move_r);
	input clock, resetn;
	input [6:0] x, y;
	input [35:0] c1, c2, c3,c4, c5, c6, c7;
	output reg can_move_l, can_move_r;
	
	always @(posedge clock)
	begin
		if (!resetn) begin
			can_move_l <= 1'b1;
			can_move_r <= 1'b1;
		end
	else if (x == 7'd0) begin
		can_move_l <= 1'b0;
			if (y == 7'd0) begin
				if (c2[35:33] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd10) begin
				if (c2[32:30] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd20) begin
				if (c2[29:27] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd30) begin
				if (c2[26:24] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd40) begin
				if (c2[23:21] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd50) begin
				if (c2[20:18] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd60) begin
				if (c2[17:15] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd70) begin
				if (c2[14:12] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd80) begin
				if (c2[11:9] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end	
		else if (y == 7'd90) begin
				if (c2[8:6] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd100) begin
				if (c2[5:2] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
		end
		else if (y == 7'd110) begin
				if (c2[2:0] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else begin
					can_move_r <= 1'b1;
				end
			end	
		end
		
		
		else if (x == 7'd10) begin
			if (y == 7'd0) begin
				if (c1[35:33] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c3[35:33] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c1[35:33] == 3'b000 && c3[35:33] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd10) begin
				if (c1[32:30] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c3[32:30] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c1[32:30] == 3'b000 && c3[32:30] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd20) begin
			    if (c1[29:27] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if(c3[29:27] != 3'b000) begin	
						can_move_r <= 1'b0;
				 end
				 else if (c1[29:27] == 3'b000 && c3[29:27] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end				 
			end 
			else if (y == 7'd30) begin
			    if (c1[26:24] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if (c3[26:24] != 3'b000) begin
						can_move_r <= 1'b0;
				 end
			else if(c1[26:24] == 3'b000 && c3[26:24] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end	
				 
			end
			else if (y == 7'd40) begin
				if (c1[23:21] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c3[23:21] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c1[23:21] == 3'b000 && c3[23:21] != 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end	
							
			end
			else if (y == 7'd50)  begin
				if(c1[20:18] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c3[20:18] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c1[20:18] == 3'b000 && c3[20:18] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd60) begin
				if (c1[17:15] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c3[17:15] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c1[17:15] == 3'b000 && c3[17:15] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd70) begin
				if (c1[14:12] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c3[14:12] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c1[14:12] == 3'b000 && c3[14:12] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd80) begin
				if(c1[11:9] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c3[11:9] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c1[11:9] == 3'b000 && c3[11:9] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd90) begin
				if(c1[8:6] != 3'b000)  begin
					can_move_l <= 1'b0;
				end
				if(c3[8:6] != 3'b000)  begin
					can_move_r <= 1'b0;
				end
				else if (c1[8:6] == 3'b000 && c3[8:6] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd100) begin
				if (c1[5:3] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c3[5:3] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c1[5:3] == 3'b000 && c3[5:3] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end				
			end
			else if (y == 7'd110) begin
				if (c1[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c3[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else if (c1[2:0] == 3'b000 && c3[2:0] == 3'b000  ) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
		end

		
		
		else if (x == 7'd20) begin
			if (y == 7'd0) begin
				if (c2[35:33] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c4[35:33] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c2[35:33] == 3'b000 && c4[35:33] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd10) begin
				if (c2[32:30] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c4[32:30] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c2[32:30] == 3'b000 && c4[32:30] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd20) begin
			    if (c2[29:27] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if(c4[29:27] != 3'b000) begin	
						can_move_r <= 1'b0;
				 end
				 else if (c2[29:27] == 3'b000 && c4[29:27] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end				 
			end 
			else if (y == 7'd30) begin
			    if (c2[26:24] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if (c4[26:24] != 3'b000) begin
						can_move_r <= 1'b0;
				 end
			else if(c2[26:24] == 3'b000 && c4[26:24] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end	
				 
			end
			else if (y == 7'd40) begin
				if (c2[23:21] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c4[23:21] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c2[23:21] == 3'b000 && c4[23:21] != 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end	
							
			end
			else if (y == 7'd50)  begin
				if(c2[20:18] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c4[20:18] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c2[20:18] == 3'b000 && c4[20:18] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd60) begin
				if (c2[17:15] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c4[17:15] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c2[17:15] == 3'b000 && c4[17:15] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd70) begin
				if (c2[14:12] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c4[14:12] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c2[14:12] == 3'b000 && c4[14:12] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd80) begin
				if(c2[11:9] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c4[11:9] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c2[11:9] == 3'b000 && c4[11:9] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd90) begin
				if(c2[8:6] != 3'b000)  begin
					can_move_l <= 1'b0;
				end
				if(c4[8:6] != 3'b000)  begin
					can_move_r <= 1'b0;
				end
				else if (c2[8:6] == 3'b000 && c4[8:6] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd100) begin
				if (c2[5:3] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c4[5:3] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c2[5:3] == 3'b000 && c4[5:3] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end				
			end
			else if (y == 7'd110) begin
				if (c2[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c4[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else if (c2[2:0] == 3'b000 && c4[2:0] == 3'b000  ) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
		end

		
		else if (x == 7'd30) begin
			if (y == 7'd0) begin
				if (c3[35:33] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c5[35:33] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c3[35:33] == 3'b000 && c5[35:33] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd10) begin
				if (c3[32:30] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c5[32:30] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c3[32:30] == 3'b000 && c5[32:30] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd20) begin
			    if (c3[29:27] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if(c5[29:27] != 3'b000) begin	
						can_move_r <= 1'b0;
				 end
				 else if (c3[29:27] == 3'b000 && c5[29:27] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end				 
			end 
			else if (y == 7'd30) begin
			    if (c3[26:24] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if (c5[26:24] != 3'b000) begin
						can_move_r <= 1'b0;
				 end
			else if(c3[26:24] == 3'b000 && c5[26:24] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end	
				 
			end
			else if (y == 7'd40) begin
				if (c3[23:21] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c5[23:21] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c3[23:21] == 3'b000 && c5[23:21] != 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end	
							
			end
			else if (y == 7'd50)  begin
				if(c3[20:18] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c5[20:18] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c3[20:18] == 3'b000 && c5[20:18] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd60) begin
				if (c3[17:15] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c5[17:15] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c3[17:15] == 3'b000 && c5[17:15] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd70) begin
				if (c3[14:12] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c5[14:12] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c3[14:12] == 3'b000 && c5[14:12] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd80) begin
				if(c3[11:9] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c5[11:9] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c3[11:9] == 3'b000 && c5[11:9] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd90) begin
				if(c3[8:6] != 3'b000)  begin
					can_move_l <= 1'b0;
				end
				if(c5[8:6] != 3'b000)  begin
					can_move_r <= 1'b0;
				end
				else if (c3[8:6] == 3'b000 && c5[8:6] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd100) begin
				if (c3[5:3] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c5[5:3] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c3[5:3] == 3'b000 && c5[5:3] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end				
			end
			else if (y == 7'd110) begin
				if (c3[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c5[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else if (c3[2:0] == 3'b000 && c5[2:0] == 3'b000  ) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
		end

		else if (x == 7'd40) begin
			if (y == 7'd0) begin
				if (c4[35:33] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c6[35:33] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c4[35:33] == 3'b000 && c6[35:33] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd10) begin
				if (c4[32:30] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c6[32:30] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c4[32:30] == 3'b000 && c6[32:30] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd20) begin
			    if (c4[29:27] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if(c6[29:27] != 3'b000) begin	
						can_move_r <= 1'b0;
				 end
				 else if (c4[29:27] == 3'b000 && c6[29:27] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end				 
			end 
			else if (y == 7'd30) begin
			    if (c4[26:24] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if (c6[26:24] != 3'b000) begin
						can_move_r <= 1'b0;
				 end
			else if(c4[26:24] == 3'b000 && c6[26:24] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end	
				 
			end
			else if (y == 7'd40) begin
				if (c4[23:21] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c6[23:21] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c4[23:21] == 3'b000 && c6[23:21] != 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end	
							
			end
			else if (y == 7'd50)  begin
				if(c4[20:18] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c6[20:18] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c4[20:18] == 3'b000 && c6[20:18] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd60) begin
				if (c4[17:15] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c6[17:15] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c4[17:15] == 3'b000 && c6[17:15] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd70) begin
				if (c4[14:12] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c6[14:12] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c4[14:12] == 3'b000 && c6[14:12] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd80) begin
				if(c4[11:9] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c6[11:9] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c4[11:9] == 3'b000 && c6[11:9] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd90) begin
				if(c4[8:6] != 3'b000)  begin
					can_move_l <= 1'b0;
				end
				if(c6[8:6] != 3'b000)  begin
					can_move_r <= 1'b0;
				end
				else if (c4[8:6] == 3'b000 && c6[8:6] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd100) begin
				if (c4[5:3] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c6[5:3] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c4[5:3] == 3'b000 && c6[5:3] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end				
			end
			else if (y == 7'd110) begin
				if (c4[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c6[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else if (c4[2:0] == 3'b000 && c6[2:0] == 3'b000  ) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
		end
		
		else if (x == 7'd50) begin
			if (y == 7'd0) begin
				if (c5[35:33] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c7[35:33] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c5[35:33] == 3'b000 && c7[35:33] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd10) begin
				if (c5[32:30] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c7[32:30] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c5[32:30] == 3'b000 && c7[32:30] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end
			end
			else if (y == 7'd20) begin
			    if (c5[29:27] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if(c7[29:27] != 3'b000) begin	
						can_move_r <= 1'b0;
				 end
				 else if (c5[29:27] == 3'b000 && c7[29:27] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end				 
			end 
			else if (y == 7'd30) begin
			    if (c5[26:24] != 3'b000) begin
						can_move_l <= 1'b0;
				 end
				 if (c7[26:24] != 3'b000) begin
						can_move_r <= 1'b0;
				 end
			else if(c5[26:24] == 3'b000 && c7[26:24] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				 end	
				 
			end
			else if (y == 7'd40) begin
				if (c5[23:21] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c7[23:21] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c5[23:21] == 3'b000 && c7[23:21] != 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end	
							
			end
			else if (y == 7'd50)  begin
				if(c5[20:18] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c7[20:18] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c5[20:18] == 3'b000 && c7[20:18] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd60) begin
				if (c5[17:15] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c7[17:15] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c5[17:15] == 3'b000 && c7[17:15] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd70) begin
				if (c5[14:12] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c7[14:12] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c5[14:12] == 3'b000 && c7[14:12] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd80) begin
				if(c5[11:9] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if(c7[11:9] != 3'b000) begin
					can_move_r <= 1'b0;
				end	
				else if (c5[11:9] == 3'b000 && c7[11:9] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end			
			end
			else if (y == 7'd90) begin
				if(c5[8:6] != 3'b000)  begin
					can_move_l <= 1'b0;
				end
				if(c7[8:6] != 3'b000)  begin
					can_move_r <= 1'b0;
				end
				else if (c5[8:6] == 3'b000 && c7[8:6] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
			else if (y == 7'd100) begin
				if (c5[5:3] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c7[5:3] != 3'b000) begin
					can_move_r <= 1'b0;
				end
				else if (c5[5:3] == 3'b000 && c7[5:3] == 3'b000) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end				
			end
			else if (y == 7'd110) begin
				if (c5[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				if (c7[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else if (c5[2:0] == 3'b000 && c7[2:0] == 3'b000  ) begin
					can_move_l <= 1'b1;
					can_move_r <= 1'b1;					
				end
			end
		end


else if (x == 7'd60) begin
		can_move_r <= 1'b0;
			if (y == 7'd0) begin
				if (c6[35:33] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd10) begin
				if (c6[32:30] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd20) begin
				if (c6[29:27] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd30) begin
				if (c6[26:24] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd40) begin
				if (c6[23:21] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd50) begin
				if (c6[20:18] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd60) begin
				if (c6[17:15] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd70) begin
				if (c6[14:12] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd80) begin
				if (c6[11:9] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end	
		else if (y == 7'd90) begin
				if (c6[8:6] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd100) begin
				if (c6[5:2] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
		end
		else if (y == 7'd110) begin
				if (c6[2:0] != 3'b000) begin
					can_move_l <= 1'b0;
				end
				else begin
					can_move_l <= 1'b1;
				end
			end	
		end	
		
		
	end
endmodule
