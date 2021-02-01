module ALU (
	input [3:0] INPUT,
	input [3:0] IM,
	output [3:0] OUTPUT,
	output CFLAG
);

reg [4:0] RESULT;

assign OUTPUT = RESULT[3:0];
assign CFLAG = RESULT[4];

always @* begin
	RESULT <= INPUT+ IM;
end

endmodule