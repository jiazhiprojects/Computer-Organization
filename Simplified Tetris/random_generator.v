module random_generator(clock,q); //counter driven by clock, 
											  //effectively random.
	input clock;
	output reg [2:0] q;
	
	initial begin
        q = 3'b001;
    end
	
	always @(posedge clock) 
	begin
		if (q == 3'b111)
		                //possible color input range from 001 to 111, excluding black.
			q <= 3'b001;
		else
			q <= q + 1'b1;
	end
	
endmodule