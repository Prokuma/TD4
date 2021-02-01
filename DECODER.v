module DECODER(
	input [7:0] COMMAND,
	input CFLAG,
	output [3:0] IM,
	output reg [3:0] LOAD,
	output reg [1:0] SEL
);

assign IM = COMMAND[3:0];

always @* begin
	case (COMMAND[7:4])
		4'b0011: begin SEL <= 2'b11; LOAD <= 4'b0001; end
		4'b0111: begin SEL <= 2'b11; LOAD <= 4'b0010; end
		4'b0001: begin SEL <= 2'b01; LOAD <= 4'b0001; end
		4'b0100: begin SEL <= 2'b00; LOAD <= 4'b0010; end
		4'b0000: begin SEL <= 2'b00; LOAD <= 4'b0001; end
		4'b0101: begin SEL <= 2'b01; LOAD <= 4'b0010; end
		4'b0010: begin SEL <= 2'b10; LOAD <= 4'b0001; end
		4'b0110: begin SEL <= 2'b10; LOAD <= 4'b0010; end
		4'b1011: begin SEL <= 2'b11; LOAD <= 4'b0100; end
		4'b1001: begin SEL <= 2'b01; LOAD <= 4'b0100; end
		4'b1111: begin SEL <= 2'b11; LOAD <= 4'b1000; end
		4'b1110: if (!CFLAG) begin SEL <=2'b11; LOAD <= 4'b1000; end else begin SEL <= 2'bxx; LOAD <= 4'b0000; end
	endcase
end
endmodule