module check_three_in_a_row(clock, resetn, draw, check, x, y, c1, c2, c3, c4, c5, c6, c7, c8, c1_3, c2_3, c3_3, c4_3, c5_3, c6_3, c7_3, c8_3, three_in_a_row);
input clock, resetn, check, draw;
input [6:0] x, y;
input [35:0] c1, c2, c3, c4, c5, c6, c7, c8;
output reg [35:0] c1_3, c2_3, c3_3, c4_3, c5_3, c6_3, c7_3, c8_3;
output reg three_in_a_row;
	always @(posedge clock)
	begin
		if (!resetn) begin
			three_in_a_row <= 0;
			end
		else if (draw) 
			three_in_a_row <=0;
		else if(check) begin
//		three_in_a_row <= 1'b0;
			if (x == 7'd30) begin
				c2_3 <= c2;
				c3_3 <= c3;
				c1_3 <= c1;
				c5_3 <= c5;
				c6_3 <= c6;
				c7_3 <= c7;
				c8_3 <= c8;
					if(y == 7'd0) begin
						if(c4[35:33] == c4[32:30] && c4[32:30] == c4[29:27] && c4[35:33] != 3'b000) begin
							c4_3 <= {9'd0, c4[26:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd10) begin
						if(c4[32:30] == c4[29:27] && c4[29:27] == c4[26:24]&& c4[32:30] != 3'b000) begin
							c4_3 <= {12'd0, c4[23:0]};
							three_in_a_row <= 1;						
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd20) begin
						if(c4[29:27] == c4[26:24] && c4[26:24] == c4[23:21]&& c4[29:27] != 3'b000) begin
							c4_3 <= {15'd0, c4[20:0]};
							three_in_a_row <= 1;							
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd30) begin
						if(c4[26:24] == c4[23:21] && c4[23:21] == c4[20:18]&& c4[26:24] != 3'b000) begin
							c4_3 <= {18'd0, c4[17:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd40) begin
						if(c4[23:21] == c4[20:18] && c4[20:18] == c4[17:15]&& c4[23:21] != 3'b000) begin
							c4_3 <= {21'd0, c4[14:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd50) begin
						if(c4[20:18] == c4[17:15] && c4[17:15] == c4[14:12]&& c4[20:18] != 3'b000) begin
							c4_3 <= {24'd0, c4[11:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd60) begin
						if(c4[17:15] == c4[14:12] && c4[14:12] == c4[11:9]&& c4[17:15] != 3'b000) begin
						   c4_3 <= {27'd0, c4[8:0]};
							three_in_a_row <= 1;	
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd70) begin
						if(c4[14:12] == c4[11:9] && c4[11:9] == c4[8:6]&& c4[11:9] != 3'b000) begin
							c4_3 <= {30'd0, c4[5:0]};
							three_in_a_row <= 1;					
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd80) begin
						if(c4[11:9] == c4[8:6] && c4[8:6] == c4[5:3]&& c4[11:9] != 3'b000) begin
							c4_3 <= {33'd0, c4[2:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd90) begin
						if(c4[8:6] == c4[5:3] && c4[5:3] == c4[2:0]&& c4[8:6] != 3'b000) begin
							c4_3 <= 36'd0;
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
			end
			
			
			else if (x == 7'd0) begin
				c2_3 <= c2;
				c3_3 <= c3;
				c4_3 <= c4;
				c5_3 <= c5;
				c6_3 <= c6;
				c7_3 <= c7;
				c8_3 <= c8;
					if(y == 7'd0) begin
						if(c1[35:33] == c1[32:30] && c1[32:30] == c1[29:27] && c1[35:33] != 3'b000) begin
							c1_3 <= {9'd0, c1[26:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd10) begin
						if(c1[32:30] == c1[29:27] && c1[29:27] == c1[26:24]&& c1[32:30] != 3'b000) begin
							c1_3 <= {12'd0, c1[23:0]};
							three_in_a_row <= 1;						
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd20) begin
						if(c1[29:27] == c1[26:24] && c1[26:24] == c1[23:21]&& c1[29:27] != 3'b000) begin
							c1_3 <= {15'd0, c1[20:0]};
							three_in_a_row <= 1;							
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd30) begin
						if(c1[26:24] == c1[23:21] && c1[23:21] == c1[20:18]&& c1[26:24] != 3'b000) begin
							c1_3 <= {18'd0, c1[17:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd40) begin
						if(c1[23:21] == c1[20:18] && c1[20:18] == c1[17:15]&& c1[23:21] != 3'b000) begin
							c1_3 <= {21'd0, c1[14:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd50) begin
						if(c1[20:18] == c1[17:15] && c1[17:15] == c1[14:12]&& c1[20:18] != 3'b000) begin
							c1_3 <= {24'd0, c1[11:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd60) begin
						if(c1[17:15] == c1[14:12] && c1[14:12] == c1[11:9]&& c1[17:15] != 3'b000) begin
						   c1_3 <= {27'd0, c1[8:0]};
							three_in_a_row <= 1;	
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd70) begin
						if(c1[14:12] == c1[11:9] && c1[11:9] == c1[8:6]&& c1[14:12] != 3'b000) begin
							c1_3 <= {30'd0, c1[5:0]};
							three_in_a_row <= 1;					
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd80) begin
						if(c1[11:9] == c1[8:6] && c1[8:6] == c1[5:3]&& c1[11:9] != 3'b000) begin
							c1_3 <= {33'd0, c1[2:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd90) begin
						if(c1[8:6] == c1[5:3] && c1[5:3] == c1[2:0]&& c1[8:6] != 3'b000) begin
							c1_3 <= 36'd0;
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
			end
			
			
			else if (x == 7'd10) begin
				c1_3 <= c1;
				c3_3 <= c3;
				c4_3 <= c4;
				c5_3 <= c5;
				c6_3 <= c6;
				c7_3 <= c7;
				c8_3 <= c8;
					if(y == 7'd0) begin
						if(c2[35:33] == c2[32:30] && c2[32:30] == c2[29:27] && c2[35:33] != 3'b000) begin
							c2_3 <= {9'd0, c2[26:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd10) begin
						if(c2[32:30] == c2[29:27] && c2[29:27] == c2[26:24]&& c2[32:30] != 3'b000) begin
							c2_3 <= {12'd0, c2[23:0]};
							three_in_a_row <= 1;						
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd20) begin
						if(c2[29:27] == c2[26:24] && c2[26:24] == c2[23:21]&& c2[29:27] != 3'b000) begin
							c2_3 <= {15'd0, c2[20:0]};
							three_in_a_row <= 1;							
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd30) begin
						if(c2[26:24] == c2[23:21] && c2[23:21] == c2[20:18]&& c2[26:24] != 3'b000) begin
							c2_3 <= {18'd0, c2[17:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd40) begin
						if(c2[23:21] == c2[20:18] && c2[20:18] == c2[17:15]&& c2[23:21] != 3'b000) begin
							c2_3 <= {21'd0, c2[14:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd50) begin
						if(c2[20:18] == c2[17:15] && c2[17:15] == c2[14:12]&& c2[20:18] != 3'b000) begin
							c2_3 <= {24'd0, c2[11:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd60) begin
						if(c2[17:15] == c2[14:12] && c2[14:12] == c2[11:9]&& c2[17:15] != 3'b000) begin
						   c2_3 <= {27'd0, c2[8:0]};
							three_in_a_row <= 1;	
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd70) begin
						if(c2[14:12] == c2[11:9] && c2[11:9] == c2[8:6]&& c2[14:12] != 3'b000) begin
							c2_3 <= {30'd0, c2[5:0]};
							three_in_a_row <= 1;					
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd80) begin
						if(c2[11:9] == c2[8:6] && c2[8:6] == c2[5:3]&& c2[11:9] != 3'b000) begin
							c2_3 <= {33'd0, c2[2:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd90) begin
						if(c2[8:6] == c2[5:3] && c2[5:3] == c2[2:0]&& c2[8:6] != 3'b000) begin
							c2_3 <= 36'd0;
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
			end	
	
			else if (x == 7'd20) begin
				c1_3 <= c1;
				c2_3 <= c2;
				c4_3 <= c4;
				c5_3 <= c5;
				c6_3 <= c6;
				c7_3 <= c7;
				c8_3 <= c8;
					if(y == 7'd0) begin
						if(c3[35:33] == c3[32:30] && c3[32:30] == c3[29:27] && c3[35:33] != 3'b000) begin
							c3_3 <= {9'd0, c3[26:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd10) begin
						if(c3[32:30] == c3[29:27] && c3[29:27] == c3[26:24]&& c3[32:30] != 3'b000) begin
							c3_3 <= {12'd0, c3[23:0]};
							three_in_a_row <= 1;						
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd20) begin
						if(c3[29:27] == c3[26:24] && c3[26:24] == c3[23:21]&& c3[29:27] != 3'b000) begin
							c3_3 <= {15'd0, c3[20:0]};
							three_in_a_row <= 1;							
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd30) begin
						if(c3[26:24] == c3[23:21] && c3[23:21] == c3[20:18]&& c3[26:24] != 3'b000) begin
							c3_3 <= {18'd0, c3[17:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd40) begin
						if(c3[23:21] == c3[20:18] && c3[20:18] == c3[17:15]&& c3[23:21] != 3'b000) begin
							c3_3 <= {21'd0, c3[14:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd50) begin
						if(c3[20:18] == c3[17:15] && c3[17:15] == c3[14:12]&& c3[20:18] != 3'b000) begin
							c3_3 <= {24'd0, c3[11:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd60) begin
						if(c3[17:15] == c3[14:12] && c3[14:12] == c3[11:9]&& c3[17:15] != 3'b000) begin
						   c3_3 <= {27'd0, c3[8:0]};
							three_in_a_row <= 1;	
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd70) begin
						if(c3[14:12] == c3[11:9] && c3[11:9] == c3[8:6] && c3[14:12] != 3'b000) begin
							c3_3 <= {30'd0, c3[5:0]};
							three_in_a_row <= 1;					
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd80) begin
						if(c3[11:9] == c3[8:6] && c3[8:6] == c3[5:3]&& c3[11:9] != 3'b000) begin
							c3_3 <= {33'd0, c3[2:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd90) begin
						if(c3[8:6] == c3[5:3] && c3[5:3] == c3[2:0]&& c3[8:6] != 3'b000) begin
							c3_3 <= 36'd0;
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
			end	
			
			else if (x == 7'd40) begin
				c1_3 <= c1;
				c2_3 <= c2;
				c4_3 <= c4;
				c3_3 <= c3;
				c6_3 <= c6;
				c7_3 <= c7;
				c8_3 <= c8;
					if(y == 7'd0) begin
						if(c5[35:33] == c5[32:30] && c5[32:30] == c5[29:27] && c5[35:33] != 3'b000) begin
							c5_3 <= {9'd0, c5[26:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd10) begin
						if(c5[32:30] == c5[29:27] && c5[29:27] == c5[26:24]&& c5[32:30] != 3'b000) begin
							c5_3 <= {12'd0, c5[23:0]};
							three_in_a_row <= 1;						
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd20) begin
						if(c5[29:27] == c5[26:24] && c5[26:24] == c5[23:21]&& c5[29:27] != 3'b000) begin
							c5_3 <= {15'd0, c5[20:0]};
							three_in_a_row <= 1;							
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd30) begin
						if(c5[26:24] == c5[23:21] && c5[23:21] == c5[20:18]&& c5[26:24] != 3'b000) begin
							c5_3 <= {18'd0, c5[17:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd40) begin
						if(c5[23:21] == c5[20:18] && c5[20:18] == c5[17:15]&& c5[23:21] != 3'b000) begin
							c5_3 <= {21'd0, c5[14:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd50) begin
						if(c5[20:18] == c5[17:15] && c5[17:15] == c5[14:12]&& c5[20:18] != 3'b000) begin
							c5_3 <= {24'd0, c5[11:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd60) begin
						if(c5[17:15] == c5[14:12] && c5[14:12] == c5[11:9]&& c5[17:15] != 3'b000) begin
						   c5_3 <= {27'd0, c5[8:0]};
							three_in_a_row <= 1;	
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd70) begin
						if(c5[14:12] == c5[11:9] && c5[11:9] == c5[8:6]&& c5[14:12] != 3'b000) begin
							c5_3 <= {30'd0, c5[5:0]};
							three_in_a_row <= 1;					
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd80) begin
						if(c5[11:9] == c5[8:6] && c5[8:6] == c5[5:3]&& c5[11:9] != 3'b000) begin
							c5_3 <= {33'd0, c5[2:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd90) begin
						if(c5[8:6] == c5[5:3] && c5[5:3] == c5[2:0]&& c5[8:6] != 3'b000) begin
							c5_3 <= 36'd0;
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
			end			
			
			else if (x == 7'd50) begin
				c1_3 <= c1;
				c2_3 <= c2;
				c4_3 <= c4;
				c3_3 <= c3;
				c5_3 <= c5;
				c7_3 <= c7;
				c8_3 <= c8;
					if(y == 7'd0) begin
						if(c6[35:33] == c6[32:30] && c6[32:30] == c6[29:27] && c6[35:33] != 3'b000) begin
							c6_3 <= {9'd0, c6[26:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd10) begin
						if(c6[32:30] == c6[29:27] && c6[29:27] == c6[26:24]&& c6[32:30] != 3'b000) begin
							c6_3 <= {12'd0, c6[23:0]};
							three_in_a_row <= 1;						
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd20) begin
						if(c6[29:27] == c6[26:24] && c6[26:24] == c6[23:21]&& c6[29:27] != 3'b000) begin
							c6_3 <= {15'd0, c6[20:0]};
							three_in_a_row <= 1;							
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd30) begin
						if(c6[26:24] == c6[23:21] && c6[23:21] == c6[20:18]&& c6[26:24] != 3'b000) begin
							c6_3 <= {18'd0, c6[17:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd40) begin
						if(c6[23:21] == c6[20:18] && c6[20:18] == c6[17:15]&& c6[23:21] != 3'b000) begin
							c6_3 <= {21'd0, c6[14:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd50) begin
						if(c6[20:18] == c6[17:15] && c6[17:15] == c6[14:12]&& c6[20:18] != 3'b000) begin
							c6_3 <= {24'd0, c6[11:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd60) begin
						if(c6[17:15] == c6[14:12] && c6[14:12] == c6[11:9]&& c6[17:15] != 3'b000) begin
						   c6_3 <= {27'd0, c6[8:0]};
							three_in_a_row <= 1;	
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd70) begin
						if(c6[14:12] == c6[11:9] && c6[11:9] == c6[8:6]&& c6[14:12] != 3'b000) begin
							c6_3 <= {30'd0, c6[5:0]};
							three_in_a_row <= 1;					
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd80) begin
						if(c6[11:9] == c6[8:6] && c6[8:6] == c6[5:3]&& c6[11:9] != 3'b000) begin
							c6_3 <= {33'd0, c6[2:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd90) begin
						if(c6[8:6] == c6[5:3] && c6[5:3] == c6[2:0]&& c6[8:6] != 3'b000) begin
							c6_3 <= 36'd0;
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
			end			
			

			else if (x == 7'd60) begin
				c1_3 <= c1;
				c2_3 <= c2;
				c4_3 <= c4;
				c3_3 <= c3;
				c5_3 <= c5;
				c6_3 <= c6;
				c8_3 <= c8;
					if(y == 7'd0) begin
						if(c7[35:33] == c7[32:30] && c7[32:30] == c7[29:27] && c7[35:33] != 3'b000) begin
							c7_3 <= {9'd0, c7[26:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd10) begin
						if(c7[32:30] == c7[29:27] && c7[29:27] == c7[26:24]&& c7[32:30] != 3'b000) begin
							c7_3 <= {12'd0, c7[23:0]};
							three_in_a_row <= 1;						
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd20) begin
						if(c7[29:27] == c7[26:24] && c7[26:24] == c7[23:21]&& c7[29:27] != 3'b000) begin
							c7_3 <= {15'd0, c7[20:0]};
							three_in_a_row <= 1;							
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd30) begin
						if(c7[26:24] == c7[23:21] && c7[23:21] == c7[20:18]&& c7[26:24] != 3'b000) begin
							c7_3 <= {18'd0, c7[17:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd40) begin
						if(c7[23:21] == c7[20:18] && c7[20:18] == c7[17:15]&& c7[23:21] != 3'b000) begin
							c7_3 <= {21'd0, c7[14:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd50) begin
						if(c7[20:18] == c7[17:15] && c7[17:15] == c7[14:12]&& c7[20:18] != 3'b000) begin
							c7_3 <= {24'd0, c7[11:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd60) begin
						if(c7[17:15] == c7[14:12] && c7[14:12] == c7[11:9]&& c7[17:15] != 3'b000) begin
						   c7_3 <= {27'd0, c7[8:0]};
							three_in_a_row <= 1;	
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd70) begin
						if(c7[14:12] == c7[11:9] && c7[11:9] == c7[8:6]&& c7[14:12] != 3'b000) begin
							c7_3 <= {30'd0, c7[5:0]};
							three_in_a_row <= 1;					
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd80) begin
						if(c7[11:9] == c7[8:6] && c7[8:6] == c7[5:3]&& c7[11:9] != 3'b000) begin
							c7_3 <= {33'd0, c7[2:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd90) begin
						if(c7[8:6] == c7[5:3] && c7[5:3] == c7[2:0]&& c7[8:6] != 3'b000) begin
							c7_3 <= 36'd0;
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
			end
			
			else if (x == 7'd70) begin
				c1_3 <= c1;
				c2_3 <= c2;
				c4_3 <= c4;
				c3_3 <= c3;
				c5_3 <= c5;
				c6_3 <= c6;
				c7_3 <= c7;
					if(y == 7'd0) begin
						if(c8[35:33] == c8[32:30] && c8[32:30] == c8[29:27] && c8[35:33] != 3'b000) begin
							c8_3 <= {9'd0, c8[26:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd10) begin
						if(c8[32:30] == c8[29:27] && c8[29:27] == c8[26:24]&& c8[32:30] != 3'b000) begin
							c8_3 <= {12'd0, c8[23:0]};
							three_in_a_row <= 1;						
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd20) begin
						if(c8[29:27] == c8[26:24] && c8[26:24] == c8[23:21]&& c8[29:27] != 3'b000) begin
							c8_3 <= {15'd0, c8[20:0]};
							three_in_a_row <= 1;							
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd30) begin
						if(c8[26:24] == c8[23:21] && c8[23:21] == c8[20:18]&& c8[26:24] != 3'b000) begin
							c8_3 <= {18'd0, c8[17:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd40) begin
						if(c8[23:21] == c8[20:18] && c8[20:18] == c8[17:15]&& c8[23:21] != 3'b000) begin
							c8_3 <= {21'd0, c8[14:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd50) begin
						if(c8[20:18] == c8[17:15] && c8[17:15] == c8[14:12]&& c8[20:18] != 3'b000) begin
							c8_3 <= {24'd0, c8[11:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd60) begin
						if(c8[17:15] == c8[14:12] && c8[14:12] == c8[11:9]&& c8[17:15] != 3'b000) begin
						   c8_3 <= {27'd0, c8[8:0]};
							three_in_a_row <= 1;	
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd70) begin
						if(c8[14:12] == c8[11:9] && c8[11:9] == c8[8:6]&& c8[14:12] != 3'b000) begin
							c8_3 <= {30'd0, c8[5:0]};
							three_in_a_row <= 1;					
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd80) begin
						if(c8[11:9] == c8[8:6] && c8[8:6] == c8[5:3]&& c8[11:9] != 3'b000) begin
							c8_3 <= {33'd0, c8[2:0]};
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
					else if (y == 7'd90) begin
						if(c8[8:6] == c8[5:3] && c8[5:3] == c8[2:0]&& c8[8:6] != 3'b000) begin
							c8_3 <= 36'd0;
							three_in_a_row <= 1;
						end
					else begin
						three_in_a_row <= 0;
					end
					end
			end		
		end
	else if (! check) begin
		three_in_a_row <= three_in_a_row;
		end
	end

endmodule
	