module counter(select, enable, clock, resetn, en);
	input[2:0] select;
	input enable,resetn;
	input clock;
	output en;
	
	wire [27:0] load;
	wire [3:0] qout;
	
	speedDetermine s0 (
		.select(select),
		.out(load));
	
	RateDivider r0 (
		.enable(enable),
		.load(load),
		.clock(clock),
		.reset_n(resetn),
		.q(en));
		
endmodule

module speedDetermine(select,out);
	input [2:0] select;
	output reg [27:0] out;
	
	always @(*)
	begin
		case (select[2:0])
			3'b000: out = 28'd4;
			
			3'b001: out = 28'd29_999_998;
			3'b010: out = 28'd19_999_999;
			3'b011: out = 28'd9_999_990;
			
			3'b100: out = 28'd833_3334;
			3'b101: out = 28'd400_0000;
			default: out = 28'd0;
		endcase
	end

endmodule

module RateDivider(enable, load, clock, reset_n,q);
	input enable,clock,reset_n;
	input [27:0] load;
	output q;
	
	reg [27:0] out;
	
	always@(posedge clock)
	begin
		if (reset_n == 1'b0)
			out <= load;
		else if (enable == 1'b1)
			begin
				if (out == 28'd0)
					out <= load;
				else
					out <= out - 1'b1;
			end
		else if (enable == 1'b0)
			out <= load;
	end
	
	assign q = (out == 28'd0) ? 1 : 0;
	
endmodule

