module sonic_test(
	input CLOCK_50,
	input [1:0] KEY,
	input echo,
	output trig,
	output [3:0] LED,
	output [15:0] LED2);
	
	parameter cycle = 20; // measure interval
	
	wire clock;
	wire [31:0] counter_out;
	wire [31:0] sonic_out;
	wire [7:0] debug;
	
	pll pll(CLOCK_50, ~KEY[1], clock);
	simple_counter counter(clock, counter_out);
	sonic #(cycle) sc (clock, echo, counter_out[cycle-1:0], trig, sonic_out[cycle-1:0]);
//	assign LED = KEY[0] ? counter_out[26:23] : counter_out[24:21];
//	assign LED = debug;
	assign LED2 = KEY[0] ? sonic_out[15:0] : sonic_out[31:16];
endmodule

module simple_counter(
	input CLOCK_50,
	output reg [31:0] counter_out);
	
	always @ (posedge CLOCK_50)
	begin
		counter_out <= #1 counter_out+1;
	end
endmodule
