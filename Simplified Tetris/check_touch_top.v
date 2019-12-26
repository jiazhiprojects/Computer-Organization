module check_touch_top(clock, resetn, heap, x, y, colour_draw, c1, c2, c3, c4, c5, c6, c7, c8, c1_t, c2_t, c3_t, c4_t, c5_t, c6_t, c7_t, c8_t, touch_top);

input clock, resetn, heap;
input [6:0] x,y;
input[2:0] colour_draw;
input [35:0] c1, c2, c3, c4, c5, c6, c7, c8;
output reg [35:0] c1_t, c2_t, c3_t, c4_t, c5_t, c6_t, c7_t, c8_t;
output reg touch_top;
	always @(posedge clock)
	begin
		if (!resetn) begin
			touch_top <= 1'b0;
			end
		if(heap) begin
			touch_top <= 1'b0;
			end
		else if (x == 7'd0) begin
				c2_t <= c2;
				c3_t <= c3;
				c4_t <= c4;
				c5_t <= c5;
				c6_t <= c6;
				c7_t <= c7;
				c8_t <= c8;
			if ((y == 7'd0) && (c1[32:30] != 000)) begin
				touch_top <= 1'b1;
				c1_t <= {colour_draw, c1[32:0]};
			end
			else if ((y == 7'd10) && (c1[29:27] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:33], colour_draw, c1[29:0]};
			end
			else if ((y == 7'd20) && (c1[26:24] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:30], colour_draw, c1[26:0]};
			end
			else if ((y == 7'd30) && (c1[23:21] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:27], colour_draw, c1[23:0]};
			end
			else if ((y == 7'd40) && (c1[20:18] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:24], colour_draw, c1[20:0]};
			end
			else if ((y == 7'd50) && (c1[17:15] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:21], colour_draw, c1[17:0]};
			end
			else if ((y == 7'd60) && (c1[14:12] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:18], colour_draw, c1[14:0]};
			end
			else if ((y == 7'd70) && (c1[11:9] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:15], colour_draw, c1[11:0]};
			end
			else if ((y == 7'd80) && (c1[8:6] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:12], colour_draw, c1[8:0]};
			end
			else if ((y == 7'd90) && (c1[5:3] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:9], colour_draw, c1[5:0]};
			end
			else if ((y == 7'd100) && (c1[2:0] != 000)) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:6], colour_draw, c1[2:0]};
			end
			else if (y == 7'd110) begin
							touch_top <= 1'b1;
							c1_t <= {c1[35:3], colour_draw};
			end
			else begin
				touch_top <= 1'b0;
			end
		end		
		else if (x == 7'd10) begin
				c1_t <= c1;
				c3_t <= c3;
				c4_t <= c4;
				c5_t <= c5;
				c6_t <= c6;
				c7_t <= c7;
				c8_t <= c8;
			if ((y == 7'd0) && (c2[32:30] != 000)) begin
				touch_top <= 1'b1;
				c2_t <= {colour_draw, c2[32:0]};
			end
			else if ((y == 7'd10) && (c2[29:27] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:33], colour_draw, c2[29:0]};
			end
			else if ((y == 7'd20) && (c2[26:24] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:30], colour_draw, c2[26:0]};
			end
			else if ((y == 7'd30) && (c2[23:21] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:27], colour_draw, c2[23:0]};
			end
			else if ((y == 7'd40) && (c2[20:18] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:24], colour_draw, c2[20:0]};
			end
			else if ((y == 7'd50) && (c2[17:15] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:21], colour_draw, c2[17:0]};
			end
			else if ((y == 7'd60) && (c2[14:12] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:18], colour_draw, c2[14:0]};
			end
			else if ((y == 7'd70) && (c2[11:9] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:15], colour_draw, c2[11:0]};
			end
			else if ((y == 7'd80) && (c2[8:6] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:12], colour_draw, c2[8:0]};
			end
			else if ((y == 7'd90) && (c2[5:3] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:9], colour_draw, c2[5:0]};
			end
			else if ((y == 7'd100) && (c2[2:0] != 000)) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:6], colour_draw, c2[2:0]};
			end
			else if (y == 7'd110) begin
							touch_top <= 1'b1;
							c2_t <= {c2[35:3], colour_draw};
			end
			else begin
				touch_top <= 1'b0;
			end
		end
		else if (x == 7'd20) begin
				c2_t <= c2;
				c1_t <= c1;
				c4_t <= c4;
				c5_t <= c5;
				c6_t <= c6;
				c7_t <= c7;
				c8_t <= c8;
			if ((y == 7'd0) && (c3[32:30]) != 3'b000) begin
				touch_top <= 1'b1;
				c3_t <= {colour_draw, c3[32:0]};
			end
			else if ((y == 7'd10) && (c3[29:27] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:33], colour_draw, c3[29:0]};
			end
			else if ((y == 7'd20) && (c3[26:24] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:30], colour_draw, c3[26:0]};
			end
			else if ((y == 7'd30) && (c3[23:21] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:27], colour_draw, c3[23:0]};
			end
			else if ((y == 7'd40) && (c3[20:18] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:24], colour_draw, c3[20:0]};
			end
			else if ((y == 7'd50) && (c3[17:15] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:21], colour_draw, c3[17:0]};
			end
			else if ((y == 7'd60) && (c3[14:12] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:18], colour_draw, c3[14:0]};
			end
			else if ((y == 7'd70) && (c3[11:9] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:15], colour_draw, c3[11:0]};
			end
			else if ((y == 7'd80) && (c3[8:6] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:12], colour_draw, c3[8:0]};
			end
			else if ((y == 7'd90) && (c3[5:3] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:9], colour_draw, c3[5:0]};
			end
			else if ((y == 7'd100) && (c3[2:0] != 3'b000)) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:6], colour_draw, c3[2:0]};
			end
			else if (y == 7'd110) begin
							touch_top <= 1'b1;
							c3_t <= {c3[35:3], colour_draw};
			end
			else begin
				touch_top <= 1'b0;
			end
		end		
		else if (x == 7'd30) begin
				c2_t <= c2;
				c3_t <= c3;
				c1_t <= c1;
				c5_t <= c5;
				c6_t <= c6;
				c7_t <= c7;
				c8_t <= c8;
			if ((y == 7'd0) && (c4[32:30]) != 000) begin
				touch_top <= 1'b1;
				c4_t <= {colour_draw, c4[32:0]};
			end
			else if ((y == 7'd10) && (c4[29:27] != 000)) begin
							touch_top <= 1'b1;
							c4_t <= {c4[35:33], colour_draw, c4[29:0]};
			end
			else if ((y == 7'd20) && (c4[26:24] != 000)) begin
							touch_top <= 1'b1;
							c4_t <= {c4[35:30], colour_draw, c4[26:0]};
			end
			else if ((y == 7'd30) && (c4[23:21] != 000)) begin
							touch_top <= 1'b1;
							c4_t <= {c4[35:27], colour_draw, c4[23:0]};
			end
			else if ((y == 7'd40) && (c4[20:18] != 000)) begin 
							touch_top <= 1'b1;
							c4_t <= {c4[35:24], colour_draw, c4[20:0]};
			end
			else if ((y == 7'd50) && (c4[17:15] != 000)) begin 
							touch_top <= 1'b1;
							c4_t <= {c4[35:21], colour_draw, c4[17:0]};
			end
			else if ((y == 7'd60) && (c4[14:12] != 000)) begin 
							touch_top <= 1'b1;
							c4_t <= {c4[35:18], colour_draw, c4[14:0]};
			end
			else if ((y == 7'd70)&& (c4[11:9] != 000)) begin
							touch_top <= 1'b1;
							c4_t <= {c4[35:15], colour_draw, c4[11:0]};
			end
			else if ((y == 7'd80) && (c4[8:6] != 3'b000)) begin
							touch_top <= 1'b1;
							c4_t <= {c4[35:12], colour_draw, c4[8:0]};
			end
			else if ((y == 7'd90) && (c4[5:3] != 3'b000)) begin
							touch_top <= 1'b1;
							c4_t <= {c4[35:9], colour_draw, c4[5:0]};
			end
			else if ((y == 7'd100) && (c4[2:0] != 3'b000)) begin
							touch_top <= 1'b1;
							c4_t <= {c4[35:6], colour_draw, c4[2:0]};
			end
			else if (y == 7'd110) begin
							touch_top <= 1'b1;
							c4_t <= {c4[35:3], colour_draw};
			end
			else begin
				touch_top <= 1'b0;
			end
		end	
		else if (x == 7'd40) begin
				c2_t <= c2;
				c3_t <= c3;
				c4_t <= c4;
				c1_t <= c1;
				c6_t <= c6;
				c7_t <= c7;
				c8_t <= c8;
			if ((y == 7'd0) && (c5[32:30] != 000)) begin
				touch_top <= 1'b1;
				c5_t <= {colour_draw, c5[32:0]};
			end
			else if ((y == 7'd10) && (c5[29:27] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:33], colour_draw, c5[29:0]};
			end
			else if ((y == 7'd20) && (c5[26:24] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:30], colour_draw, c5[26:0]};
			end
			else if ((y == 7'd30) && (c5[23:21] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:27], colour_draw, c5[23:0]};
			end
			else if ((y == 7'd40) && (c5[20:18] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:24], colour_draw, c5[20:0]};
			end
			else if ((y == 7'd50) && (c5[17:15] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:21], colour_draw, c5[17:0]};
			end
			else if ((y == 7'd60) && (c5[14:12] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:18], colour_draw, c5[14:0]};
			end
			else if ((y == 7'd70) && (c5[11:9] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:15], colour_draw, c5[11:0]};
			end
			else if ((y == 7'd80) && (c5[8:6] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:12], colour_draw, c5[8:0]};
			end
			else if ((y == 7'd90) && (c5[5:3] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:9], colour_draw, c5[5:0]};
			end
			else if ((y == 7'd100) && (c5[2:0] != 000)) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:6], colour_draw, c5[2:0]};
			end
			else if (y == 7'd110) begin
							touch_top <= 1'b1;
							c5_t <= {c5[35:3], colour_draw};
			end
			else begin
				touch_top <= 1'b0;
			end
		end		
		else if (x == 7'd50) begin
				c2_t <= c2;
				c3_t <= c3;
				c4_t <= c4;
				c5_t <= c5;
				c1_t <= c1;
				c7_t <= c7;
				c8_t <= c8;
			if ((y == 7'd0) && (c6[32:30] != 000)) begin
				touch_top <= 1'b1;
				c6_t <= {colour_draw, c6[32:0]};
			end
			else if ((y == 7'd10) && (c6[29:27] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:33], colour_draw, c6[29:0]};
			end
			else if ((y == 7'd20) && (c6[26:24] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:30], colour_draw, c6[26:0]};
			end
			else if ((y == 7'd30) && (c6[23:21] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:27], colour_draw, c6[23:0]};
			end
			else if ((y == 7'd40) && (c6[20:18] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:24], colour_draw, c6[20:0]};
			end
			else if ((y == 7'd50) && (c6[17:15] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:21], colour_draw, c6[17:0]};
			end
			else if ((y == 7'd60) && (c6[14:12] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:18], colour_draw, c6[14:0]};
			end
			else if ((y == 7'd70) && (c6[11:9] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:15], colour_draw, c6[11:0]};
			end
			else if ((y == 7'd80) && (c6[8:6] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:12], colour_draw, c6[8:0]};
			end
			else if ((y == 7'd90) && (c6[5:3] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:9], colour_draw, c6[5:0]};
			end
			else if ((y == 7'd100) && (c6[2:0] != 000)) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:6], colour_draw, c6[2:0]};
			end
			else if (y == 7'd110) begin
							touch_top <= 1'b1;
							c6_t <= {c6[35:3], colour_draw};
			end
			else begin
				touch_top <= 1'b0;
			end
		end		
//		else if (x == 7'd70) begin
//				c2_t <= c2;
//				c3_t <= c3;
//				c4_t <= c4;
//				c5_t <= c5;
//				c6_t <= c6;
//				c7_t <= c7;
//				c1_t <= c1;
//			if ((y == 7'd0) && (c8[32:30] != 000)) begin
//				touch_top <= 1'b1;
//				c8_t <= {colour_draw, c8[32:0]};
//			end
//			else if ((y == 7'd10) && (c8[29:27] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:33], colour_draw, c8[29:0]};
//			end
//			else if ((y == 7'd20) && (c8[26:24] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:30], colour_draw, c8[26:0]};
//			end
//			else if ((y == 7'd30) && (c8[23:21] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:27], colour_draw, c8[23:0]};
//			end
//			else if ((y == 7'd40) && (c8[20:18] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:24], colour_draw, c8[20:0]};
//			end
//			else if ((y == 7'd50) && (c8[17:15] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:21], colour_draw, c8[17:0]};
//			end
//			else if ((y == 7'd60) && (c8[14:12] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:18], colour_draw, c8[14:0]};
//			end
//			else if ((y == 7'd70) && (c8[11:9] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:15], colour_draw, c8[11:0]};
//			end
//			else if ((y == 7'd80) && (c8[8:6] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:12], colour_draw, c8[8:0]};
//			end
//			else if ((y == 7'd90) && (c8[5:3] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:9], colour_draw, c8[5:0]};
//			end
//			else if ((y == 7'd100) && (c8[2:0] != 000)) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:6], colour_draw, c8[2:0]};
//			end
//			else if (y == 7'd110) begin
//							touch_top <= 1'b1;
//							c8_t <= {c8[35:3], colour_draw};
//			end
//			else begin
//				touch_top <= 1'b0;
//			end
//		end
		
	 else if (x == 7'd60) begin
			c2_t <= c2;
			c3_t <= c3;
			c4_t <= c4;
			c5_t <= c5;
			c1_t <= c1;
			c6_t <= c6;
			c8_t <= c8;
			if ((y == 7'd0) && (c7[32:30] != 000)) begin
				touch_top <= 1'b1;
				c7_t <= {colour_draw, c7[32:0]};
			end
			else if ((y == 7'd10) && (c7[29:27] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:33], colour_draw, c7[29:0]};
			end
			else if ((y == 7'd20) && (c7[26:24] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:30], colour_draw, c7[26:0]};
			end
			else if ((y == 7'd30) && (c7[23:21] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:27], colour_draw, c7[23:0]};
			end
			else if ((y == 7'd40) && (c7[20:18] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:24], colour_draw, c7[20:0]};
			end
			else if ((y == 7'd50) && (c7[17:15] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:21], colour_draw, c7[17:0]};
			end
			else if ((y == 7'd60) && (c7[14:12] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:18], colour_draw, c7[14:0]};
			end
			else if ((y == 7'd70) && (c7[11:9] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:15], colour_draw, c7[11:0]};
			end
			else if ((y == 7'd80) && (c7[8:6] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:12], colour_draw, c7[8:0]};
			end
			else if ((y == 7'd90) && (c7[5:3] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:9], colour_draw, c7[5:0]};
			end
			else if ((y == 7'd100) && (c7[2:0] != 000)) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:6], colour_draw, c7[2:0]};
			end 
			else if (y == 7'd110 && x == 7'd60) begin
							touch_top <= 1'b1;
							c7_t <= {c7[35:3], colour_draw};
			end
			else begin
				touch_top <= 1'b0;
			end
		end
	end	
endmodule