module sonic # (parameter WIDTH = 30)
(
	input clk, // 5MHz
	input echo, // Arduino D2
	input [WIDTH-1:0] counter,
	output reg trig, // Arduino D3
	output reg [WIDTH-1:0] data
);
// set measure interval by parameter WIDTH
//	reg echowrite;
	reg [WIDTH-1:0] pulse_start;
	reg echohigh;
	always @(posedge clk) begin
		if (counter == 1) begin
			trig <= 1;
		end else if (counter == 50) begin
//			echowrite <= 1;
			trig <= 0;
		end 
		if (echohigh == 0 && echo == 1) begin
			pulse_start <= counter;
			echohigh <= 1;
		end else if (echohigh == 1 && echo == 0) begin
//			echowrite <= 0;
			echohigh <= 0;
			data <= (counter-pulse_start);
		end
	end
endmodule
