module check_end_game(clock, resetn, touch_top, c1, c2, c3, c4, c5, c6, c7, c8, end_game, checked_game);
	input clock, resetn, touch_top;
	input [35:0] c1, c2, c3, c4, c5, c6, c7, c8;
	output reg end_game, checked_game;
	always @(posedge clock)
		begin
			if(resetn == 1'b0) begin
				end_game <= 1'b0;
				checked_game <= 1'b0;
			end
			else if (touch_top) begin
				checked_game <= 1'b0;
				if(c1[35:33] != 000 || c2[35:33] != 000 || c3[35:33] != 000 || c4[35:33] != 000 || c5[35:33] != 000 || c6[35:33] != 000 || c7[35:33] != 000 || c8[35:33] != 000)
				begin
					end_game <= 1'b1;
				end
				else begin
					end_game <= 1'b0;
					checked_game <= 1'b1;
				end
		end
	end
endmodule