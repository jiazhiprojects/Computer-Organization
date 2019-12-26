module disappear (clock, resetn, in_x, in_y, go, out_x, out_y, out_colour, plot);
	input clock, resetn, go;
	input [6:0] in_x;
	input [6:0] in_y;
//	input [2:0] colour;
	output [6:0] out_x;
	output [6:0] out_y;
	output [2:0] out_colour;
	output plot;
	
	wire ld_x_y, finish, draw;
	
	// Instansiate datapath
	datapath_d d1(
		.resetn(resetn),
		.clock(clock),
		.in_x(in_x),
		.in_y(in_y),
		.colour(colour),
		
		.ld_x_y(ld_x_y),
		.draw(draw),
		
		.out_x(out_x),
		.out_y(out_y),
		.finish(finish),
		.out_colour(out_colour)
	);

    // Instansiate FSM control
   control_d c1(
		.clock(clock),
		.resetn(resetn),
		.go(go),
		.finish(finish),
		
		.ld_x_y(ld_x_y),
		.draw(draw),
		.plot(plot)
		);
	
endmodule

module datapath_d(in_x, in_y, colour, resetn, clock, ld_x_y, draw, out_x, out_y, out_colour, finish);
	input [6:0] in_x;
	input [6:0] in_y;
	input [2:0] colour;
	input resetn, clock;
	input ld_x_y, draw;
	
	output  [6:0] out_x;
	output  [6:0] out_y;
	output reg [2:0] out_colour;
	output finish;
	
	reg [6:0] x;
	reg [6:0] y;
	reg [3:0] q_x;
	reg [4:0] q_y;
	reg [1:0] times;
	wire signal_y;
	
	always @(posedge clock)
	begin: load
		if (!resetn) begin
			x <= 0;
			y <= 0;
			out_colour = 3'b000;
			end
		else 
			begin
				if (ld_x_y) begin
					x <= in_x;
					y <= in_y;
					out_colour = 3'b000;
					end
			end
	end

	always @(posedge clock)
	begin: x_counter
		if (! resetn) begin
			q_x <= 4'b0000;
			end
		else if (draw)
			begin
				if (q_x == 4'b1001) begin
					q_x <= 0;
					end
				else
					q_x <= q_x + 1'b1;
			end
	end
	
	assign signal_y = (q_x == 4'b1001) ? 1: 0;

	always @(posedge clock)
	begin: y_counter
		if (! resetn) begin
			q_y <= 5'b00000;
			times <= 2'b00;
			end
		else if (signal_y)
			begin
				if (q_y == 5'd29) begin
					q_y <= 0;
					times <= times + 1'b1;
					end
				else
					q_y <= q_y + 1'b1;
			end
	end
	
	assign finish = (q_y == 5'd29 & times == 2'b10) ? 1 : 0;
	
	assign out_x = x + q_x;
	assign out_y = y + q_y;
	
endmodule

module control_d(clock, resetn, go, finish, ld_x_y, draw, plot);
	input resetn, clock, go, finish;
	output reg ld_x_y, draw, plot;

	reg [1:0] current_state, next_state;
	
	localparam Start = 2'd0,
					Load_x_y = 2'd1,
					Draw = 2'd2;

	always @(*)
	begin: state_table
		case (current_state)
			Start: next_state = go ? Load_x_y : Start;
			Load_x_y: next_state = Draw;
			Draw: next_state = finish ? Start : Draw;
			default: next_state = Start;
		endcase
	end
	
	always @(*)
	begin: signals
		ld_x_y = 1'b0;
		draw = 1'b0;
		plot = 1'b0;
		
		case (current_state)
		Load_x_y: begin 
			ld_x_y = 1'b1;
			end
		Draw: begin
			draw = 1'b1;
			plot = 1'b1;
			end
		endcase
	end
	
always@(posedge clock)
    begin: state_FFs
        if(!resetn)
            current_state <= Start;
        else
            current_state <= next_state;
    end // state_FFS
endmodule