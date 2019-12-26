module get_x_y_color(clock, resetn, in_x, in_y, in_colour, x, y, colour, plot,heap,draw, erase, erase_complete, draw_all_black);
	input clock, resetn;
	input [6:0] in_x, in_y;
	input [2:0] in_colour;
	input draw, heap, erase, erase_complete, draw_all_black;
	output reg [6:0] x, y;
	output reg [2:0] colour;
	output reg	plot;
	
	wire [6:0] draw_x, erase_x, complete_x, black_x, heap_x;
	wire [6:0] draw_y, erase_y, complete_y, black_y, heap_y;
	wire [2:0] draw_colour, erase_colour, complete_colour, black_colour, heap_colour;
	wire draw_plot, erase_plot, complete_plot, black_plot, heap_plot;
	always @(posedge clock)
	begin
		if (draw) begin
			x <= draw_x;
			y <= draw_y;
			colour <= draw_colour;
			plot <= draw_plot;
		end
		else if (heap) begin
			x <= heap_x;
			y <= heap_y;
			colour <= heap_colour;
			plot <= heap_plot;
		end
		else if (erase) begin
			x <= erase_x;
			y <= erase_y;
			colour <= erase_colour;
			plot <= erase_plot;
		end
		else if (erase_complete) begin
			x <= complete_x;
			y <= complete_y;
			colour <= complete_colour;
			plot <= complete_plot;
		end
		else if (draw_all_black) begin
			x <= black_x;
			y <= black_y;
			colour <= black_colour;
			plot <= black_plot;
		end
		else begin
			plot <= 1'b0;
		end
	end
	
	draw_cube draw_cube (
		.clock(clock),
		.resetn(resetn),
		
		.in_x(in_x),
		.in_y(in_y),
		.colour(in_colour), // the colour should be random
		
		.go(draw), // whenever the previous cube is stay at the place
		
		.out_x(draw_x),
		.out_y(draw_y),
		.out_colour(draw_colour),
		.plot(draw_plot));
		
	draw_cube erase_cube (
		.clock(clock),
		.resetn(resetn),
		
		.in_x(in_x),
		.in_y(in_y),
		.colour(in_colour), 
		
		.go(erase), // whenever the previous cube is stay at the place
		
		.out_x(erase_x),
		.out_y(erase_y),
		.out_colour(erase_colour),
		.plot(erase_plot));

	draw_cube heap_cube (
		.clock(clock),
		.resetn(resetn),
		
		.in_x(in_x),
		.in_y(in_y),
		.colour(in_colour), 
		
		.go(heap), // whenever the previous cube is stay at the place
		
		.out_x(heap_x),
		.out_y(heap_y),
		.out_colour(heap_colour),
		.plot(heap_plot));
		
	disappear disappear (
		.clock(clock),
		.resetn(resetn),
		
		.in_x(in_x),
		.in_y(in_y),
//		.colour(in_colour),
		
		.go(erase_complete), // whenever the previous cube is stay at the place
		
		.out_x(complete_x),
		.out_y(complete_y),
		.out_colour(complete_colour),
		.plot(complete_plot));
		
	draw_black draw_black (
		.clock(clock),
		.resetn(resetn),	
		.go(draw_all_black), // whenever the previous cube is stay at the place
		
		.out_x(black_x),
		.out_y(black_y),
		.out_colour(black_colour),
		.plot(black_plot));
endmodule
