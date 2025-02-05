module cube_tetris
	(
		CLOCK_50,						//	On Board 50 MHz
		// Your inputs and outputs here
        SW,
		  KEY,
		  
//		  PS2_CLK,
//		  PS2_DAT,
		// The ports below are for the VGA output.  Do not change.
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,   						//	VGA Blue[9:0]
		LEDR,
		HEX0,
		HEX1
		
	);

	input			CLOCK_50;				//	50 MHz
	input   [3:0]   KEY;
	input [3:0] SW;
	
//	inout PS2_CLK;
//	inout PS2_DAT;

	// Declare your inputs and outputs here
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	output [7:0] LEDR;
	output [6:0] HEX0, HEX1;
	
	wire resetn;
	assign resetn = KEY[0];
	
	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] colour, random_colour;
//	wire [2:0] cube_colour, disappear_colour, black_colour;
	wire [6:0] x;
//	wire [6:0] cube_x, disappear_x, black_x;
	wire [6:0] y;
//	wire [6:0] cube_y, disappear_y, black_y;
	wire writeEn;
//	wire cube_writeEn, disappear_writeEn, black_writeEn;
	
	wire [6:0] in_x, in_y;
	wire [2:0] in_colour, colour_draw;
	wire erase, first, heap, draw, change, pre, three_in_a_row, heap_finished, end_game, en_erase, touch_top, check, erase_complete, draw_all_black,checked_colour, checked_game;
	wire [35:0] c1, c2, c3, c4, c5, c6, c7, c8;
	//wire [2:0] colour_draw;
	wire [7:0] score;
	wire [3:0] move_l, move_r;
	wire already_moved;
	
//	wire left, right, start;
//	wire [2:0] select;
	
	assign LEDR [7:0] = score;
	

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(writeEn),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "black.mif";
			
	// Put your code here. Your code should produce signals x,y,colour and writeEn/plot
	// for the VGA controller, in addition to any other functionality your design may require.
    
//	 keyboard_inout keyboard (
//	 .clock(CLOCK_50),
//	 .resetn(resetn),
//	 
//	 .PS2_CLK(PS2_CLK),
//	 .PS2_DAT(PS2_DAT),
//	 
//	 .start(start),
//	 .left(left),
//	 .right(right)
//	 );
	 
	
	get_x_y_color get(
		.clock(CLOCK_50), 
		.resetn(resetn), 
		.in_x(in_x), 
		.in_y(in_y), 
		.in_colour(in_colour),
		.x(x),
		.y(y),
		.colour(colour), 
		.plot(writeEn),
		.draw(draw),
		.heap(heap),
		.erase(erase),
		.erase_complete(erase_complete), 
		.draw_all_black(draw_all_black));
		
	move_x move_x (
		.left(~KEY[3]), 
		.right(~KEY[2]), 
		.move_l(move_l),
		.move_r(move_r),
		.already_moved(already_moved)
		);
	
	random_generator r0(
		.clock(CLOCK_50),
		.q(random_colour)
		);
		
	
	over_datapath d0 (
		.clock(CLOCK_50),
		.resetn(resetn),
		.move_l(move_l),
		.move_r(move_r),
		.q(random_colour),
		.already_moved(already_moved),
		.erase(erase),
		.check(check),
		.first(first),
		.heap(heap),
		.erase_complete(erase_complete),
		.draw(draw),
		.change(change),
		.touch_top(touch_top),
		.pre(pre),
		.heap_finished(heap_finished),
		.checked_colour(checked_colour),
		.checked_game(checked_game),
		.en_erase(en_erase),
		.x(in_x),
		.y(in_y),
		.end_game(end_game),
		.three_in_a_row(three_in_a_row),
		.colour(in_colour),
		.score(score),
		.draw_all_black(draw_all_black),
		.colour_draw(colour_draw),
							 .c1(c1), 
							  .c2(c2), 
							  .c3(c3), 
							  .c4(c4), 
							  .c5(c5), 
							  .c6(c6), 
							  .c7(c7), 
							  .c8(c8)
		);

	over_control c0 (
		.clock(CLOCK_50),
		.resetn(resetn),
		.go(KEY[1]),
		.heap_finished(heap_finished),
		.change(change),
		.pre(pre),
		.checked_game(checked_game),
		.checked_colour(checked_colour),
		.three_in_a_row(three_in_a_row),
		.touch_top(touch_top), 
		.end_game(end_game),
		.heap(heap),
		.erase(erase),
		.first(first), 
		.draw(draw),
		.en_erase(en_erase),
		.check(check),
		.erase_complete(erase_complete),
		.draw_all_black(draw_all_black)
		);				

		hex_decoder h0(.hex_digit(score[3:0]), 
						.segments(HEX0)
						);
						
		hex_decoder h1(.hex_digit(score[7:4]), 
						.segments(HEX1)
						);
		
endmodule

module over_datapath(clock, resetn, move_l, q, move_r, already_moved,en_erase, erase_complete, draw_all_black,check, erase, first, heap, draw, change, x, y, colour, colour_draw, heap_finished, pre, three_in_a_row, touch_top, checked_colour, c1, c2, c3, c4, c5, c6, c7, c8, end_game, checked_game, score);
	input clock, resetn;
	input [3:0] move_l, move_r;
	input [2:0] q;
	input erase, first, heap, draw, pre, en_erase, check, erase_complete,draw_all_black;
	output reg [6:0] x, y;
	output reg [2:0] colour, colour_draw;
	output reg already_moved;
	output heap_finished, change, touch_top, end_game, three_in_a_row, checked_colour, checked_game;

	output reg [7:0] score;
	
	reg [27:0] delay;
	output reg [35:0] c1, c2, c3, c4, c5, c6, c7, c8;
	
	wire [35:0] c1_t, c2_t, c3_t, c4_t, c5_t, c6_t, c7_t, c8_t;
	wire [35:0] c1_3, c2_3, c3_3, c4_3, c5_3, c6_3, c7_3, c8_3;
	
	wire [6:0] heap_x, heap_y;
	wire [2:0] heap_colour;
	wire delay_out;
	reg [2:0] select;

	draw_heap h0 (
		.clock(clock), 
		.resetn(resetn), 
		.heap(heap), 
		.x(heap_x), 
		.y(heap_y), 
		.colour(heap_colour),
		.heap_finished(heap_finished)
		);
				
	always @(*)
	begin
		if (score == 8'd0) begin
			select = 3'b001;
		end
		else if (score > 8'd5) begin
			select = 3'b010;
		end
		else if (score > 8'd10) begin
			select = 3'b011;
		end
		else begin
			select = 3'b001;
		end
	end
	
	counter c0 (
		.clock(clock),
		.resetn(resetn),
		.enable(en_erase),
		.en(delay_out),
		.select(select)); // TODO: CHANGE the speed!					
	
	assign change = (delay_out == 1) ? 1: 0;
	
	always @(posedge clock) //negedge heap_finished
	begin
		if (!resetn) begin
			c1 <= 36'd0;
			c2 <= 36'd0;
			c3 <= 36'd0;
			c4 <= 36'd0;
			c5 <= 36'd0;
			c6 <= 36'd0;
			c7 <= 36'd0;
			c8 <= 36'd0;
		end
		else if (heap_finished) begin
			c1 <= 36'b000000000000000000000000000000000111;
			c2 <= 36'b000000000000000000000000000000010001;
			c3 <= 36'b000000000000000000000000000110101100;
			c4 <= 36'b000000000000000000000000101001011111;
			c5 <= 36'b000000000000000000000000000011010101;
			c6 <= 36'b000000000000000000000000000000000110;
			c7 <= 36'b000000000000000000000000000000000111;
			c8 <= 36'b000000000000000000000000000000000000;
		end
		else if (touch_top) begin //output of check_touch_top
			c1 <= c1_t;
			c2 <= c2_t;
			c3 <= c3_t;
			c4 <= c4_t;
			c5 <= c5_t;
			c6 <= c6_t;
			c7 <= c7_t;
			c8 <= c8_t;
		end
		else if (three_in_a_row) begin //output of check_three_in_a_row
			c1 <= c1_3;
			c2 <= c2_3;
			c3 <= c3_3;
			c4 <= c4_3;
			c5 <= c5_3;
			c6 <= c6_3;
			c7 <= c7_3;
			c8 <= c8_3;
		end			
	end
	

	
	always @(posedge clock)
	begin: colour_assign
		if (!resetn) begin
			colour <= 3'b000;
			colour_draw <= 3'b000;
			end
		else if (first) begin
			colour <= q; //TODO: change to q
			colour_draw <= q; //TODO: change to q
			end
		else if (erase) begin
			colour <= 3'b000;
			end
//		else if (erase_complete)
//			begin
//				colour <= 3'b001; //TODO: CHANGED HERE!!
//			end
		else if (pre) begin
			colour <= colour_draw;
			end
		else if (heap)
			begin
				colour <= heap_colour;
			end
		if (end_game) begin
			colour <= colour_draw;
			end // TODO : DO not know waht this is doing 
		
	end
	
	always @(posedge clock)
	begin: x_counter
		if (! resetn) begin
			x <= 7'd30;
			already_moved <= 1'b1;
			end
		else if (first) begin
			x <= 7'd30;
			already_moved <= 1'b0;
			end
		else if (heap)
			begin
				x <= heap_x;
				already_moved <= 1'b0;
			end
		else if (pre) begin
				if (move_r == 0 & x > 0) begin
					x <= x - move_l;
				end
				else if (move_l == 0 & x < 7'd60) begin
					x <= x + move_r;
				end
				already_moved <= 1'b1;
			end
		else if (draw) begin
			x <= x;
			already_moved <= 1'b0;
		end
		else
			x <= x;
	end
	
	always @(posedge clock)
	begin: y_counter
		if (! resetn) begin
			y <= 7'd0;
			end
		else if (first) begin
				y <= 7'd0;
			end
		else if (heap) begin
				y <= heap_y;
			end
		else if ((pre) && (!touch_top)) begin
				if (move_l == 0 & move_r == 0) begin
					y <= y + 7'd10;
					end
				else
					y <= y;
			end
		else
			y<=y;

	end
	
	
	
	always @(posedge three_in_a_row) 
		begin : score_counter
			if(!resetn) 
				score <= 0;
			else if (three_in_a_row) 
				score <= score + 1'd1;
			else
				score <= score;
		end

	
	check_touch_top ctt0(.clock(clock), 
							  .resetn(resetn), 
							  .heap(heap), 
							  .x(x), 
							  .y(y), 
							  .colour_draw(colour_draw),
							  .c1(c1), 
							  .c2(c2), 
							  .c3(c3), 
							  .c4(c4), 
							  .c5(c5), 
						     .c6(c6), 
							  .c7(c7), 
							  .c8(c8), 
							  .c1_t(c1_t), 
							  .c2_t(c2_t), 
							  .c3_t(c3_t), 
							  .c4_t(c4_t), 
							  .c5_t(c5_t), 
						     .c6_t(c6_t), 
							  .c7_t(c7_t), 
							  .c8_t(c8_t), 
							  .touch_top(touch_top)
							  );						

	
		
	check_end_game ceg0(.clock(clock), 
							  .resetn(resetn), 
							  .touch_top(touch_top),
							  .c1(c1), 
							   .c2(c2), 
								.c3(c3), 
								.c4(c4), 
								.c5(c5), 
								.c6(c6), 
								.c7(c7), 
								.c8(c8), 
								.end_game(end_game),
								.checked_game(checked_game)
								);
								
	check_move cm0 (.clock(clock), 
						 .resetn(resetn), .x(x), 
						 .y(y), 
						 .c1(c1), 
						 .c2(c2), 
						 .c3(c3),
						 .c4(c4), 
						 .c5(c5), 
						 .c6(c6), 
						 .c7(c7), 
						 .can_move_l(can_move_l), 
						 .can_move_r(can_move_r)
						 );
								
	check_three_in_a_row ctiar0(.clock(clock), 
									    .check(check), 
										 .resetn(resetn),
										 .draw(draw),
										 .x(x), 
										 .y(y), 
										  .c1(c1), 
										  .c2(c2), 
										  .c3(c3), 
										  .c4(c4), 
										  .c5(c5), 
										  .c6(c6), 
										  .c7(c7), 
										  .c8(c8), 
										  .c1_3(c1_3), 
										  .c2_3(c2_3), 
										  .c3_3(c3_3), 
										  .c4_3(c4_3), 
										  .c5_3(c5_3), 
										  .c6_3(c6_3), 
										  .c7_3(c7_3), 
										  .c8_3(c8_3), 										 
										 .three_in_a_row(three_in_a_row)
										 );
		
endmodule



module over_control(draw_all_black, clock, resetn, go, change, heap_finished, check_finished, touch_top, three_in_a_row, checked_colour, checked_game,heap, erase,first, draw,en_erase, pre, start, check, erase_complete, end_game);
	input resetn, clock, go, change, heap_finished, touch_top, three_in_a_row, check_finished,end_game, checked_colour,checked_game;
	output reg erase, start, first, heap, draw, en_erase, pre, check, erase_complete, draw_all_black;

	reg [3:0] current_state, next_state;
	reg en_VGA, en_erase_three;
	wire draw_en, erase_three_en;
					
	localparam Start = 4'd0,
					Draw_heap = 4'd1,
					Draw_black = 4'd12,
					Pre_first = 4'd7,
					Erase= 4'd3,
					Pre_draw = 4'd4,
					Draw = 4'd5,
					End = 4'd6,
					Erase_complete = 4'd9,
					Check_colour = 4'd8,
					After_check_colour = 4'd13,
					Check_game = 4'd10,
					
					Draw_last = 4'd14,
					Draw_first = 4'd15,
					
					GAMEOVER = 4'd11;
					
	always @(*)
	begin: state_table
		case (current_state)
			Start: next_state = go ? Start: Draw_black;
			Draw_black: next_state = draw_en ? Draw_heap : Draw_black;
			
			Draw_heap: next_state = heap_finished ? Pre_first : Draw_heap;		
			
			Pre_first: next_state = erase_three_en? Draw_first : Pre_first;
			
			Draw_first: next_state = Draw;
			
			Erase: next_state = draw_en? Pre_draw : Erase; 
			Pre_draw: next_state = Draw;
			Draw: next_state = touch_top ? Draw_last: change ? Erase: Draw;
			
			Draw_last: next_state = draw_en? Check_colour: Draw_last;
			
			Check_colour: next_state = After_check_colour;
			After_check_colour : next_state = three_in_a_row ? Erase_complete: Check_game;
			Check_game: next_state = end_game ? GAMEOVER: checked_game ? End : Check_game;
			
			Erase_complete: next_state = draw_en ? End : Erase_complete;
			
			End: next_state =  change ? Pre_first: End;
			
			GAMEOVER: next_state = Start;
			
			default: next_state = Start;
		endcase
	end
	
	always @(*)
	begin: signals
		heap = 1'b0;
		first = 1'b0;
		erase = 1'b0;
		draw = 1'b0;
		en_erase = 1'b0;
		pre = 1'b0;
		check = 1'b0;
		en_VGA = 1'b0;
		erase_complete = 1'b0;
		draw_all_black = 1'b0;
		start = 1'b0;
		en_erase_three = 1'b0; 
		case (current_state)
		Draw_black: begin
			en_VGA = 1'b1;
			draw_all_black = 1'b1;
			end
		Draw_heap: begin
			heap = 1'b1;
			end
		Pre_first: begin 
			first = 1'b1;
			en_erase = 1'b1;
			en_erase_three = 1'b1;
			end
		Draw_first: begin
			en_erase = 1'b1;
		end
		Erase: begin 
			erase = 1'b1;
			en_erase = 1'b1;
			en_VGA = 1'b1;
			end
		Pre_draw: begin
			pre = 1'b1;
			en_erase = 1'b1;
			end
		Draw : begin
			draw = 1'b1;
			en_erase = 1'b1;	
			end
		End : begin
			en_erase = 1'b1;	
			end
		Draw_last: begin
			en_erase = 1'b1;
			en_VGA = 1'b1;
			draw = 1'b1;
			end
		Check_colour : begin
			check = 1'b1;
			en_erase = 1'b1;
			
			end
		Erase_complete: begin
			erase_complete = 1'b1;
			en_erase = 1'b1;
			en_VGA = 1'b1;
			end
		Check_game: begin
			en_erase = 1'b1;
			end
		After_check_colour:begin
			en_erase = 1'b1;
			end
		endcase
	end
	
always@(posedge clock)
    begin: state_FFs
        if(!resetn || start)
            current_state <= Start;
        else
            current_state <= next_state;
    end // state_FFS
	 
	 
	 counter c1 (
		.clock(clock),
		.resetn(resetn),
		.enable(en_VGA),
		.en(draw_en),
		.select(3'b100));
		
	counter c2 (
		.clock(clock),
		.resetn(resetn),
		.enable(en_erase_three),
		.en(erase_three_en),
		.select(3'b000));
endmodule


module hex_decoder(hex_digit, segments);
    input [3:0] hex_digit;
    output reg [6:0] segments;
   
    always @(*)
        case (hex_digit)
            4'h0: segments = 7'b100_0000;
            4'h1: segments = 7'b111_1001;
            4'h2: segments = 7'b010_0100;
            4'h3: segments = 7'b011_0000;
            4'h4: segments = 7'b001_1001;
            4'h5: segments = 7'b001_0010;
            4'h6: segments = 7'b000_0010;
            4'h7: segments = 7'b111_1000;
            4'h8: segments = 7'b000_0000;
            4'h9: segments = 7'b001_1000;
            4'hA: segments = 7'b000_1000;
            4'hB: segments = 7'b000_0011;
            4'hC: segments = 7'b100_0110;
            4'hD: segments = 7'b010_0001;
            4'hE: segments = 7'b000_0110;
            4'hF: segments = 7'b000_1110;   
            default: segments = 7'h7f;
        endcase
endmodule
