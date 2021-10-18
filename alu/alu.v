module alu(alu_out, accum, data, opcode, zero, clk, reset);
input 		clk, reset;
input 	[7:0] 	accum, data;
input 	[2:0] 	opcode;
output  reg [7:0] alu_out;
output  reg	zero;

always@(posedge clk)
begin
	if(reset == 1'b1)
		alu_out = 8'b0000_0000;
	else
		case(opcode)
		default: alu_out <= 8'b0000_0000;
		3'b000 : alu_out <= accum;
		3'b001 : alu_out <= accum + data;
		3'b010 : alu_out <= accum - data;
		3'b011 : alu_out <= accum & data;
		3'b100 : alu_out <= accum ^ data;
		3'b101 : alu_out <= ~(accum) + 1;
		3'b110 : alu_out <= (accum) * 8'b0000_0101 + (accum)/ 8'b0000_1000;
		3'b111 :if(accum >= 8'b00100000)
				alu_out <= data;
			  else
				alu_out <= ~(data); 	
			
		endcase
end

always@(*)
begin
	if(accum == 8'b0000_0000)
		zero = 1'b1;
	else
		zero = 1'b0;
end
endmodule



//All input signal and output signal triggered by the rising edge of clock signal, except the zero signal.
//It is synchronous reset architecture when "reset" signal is 1, the reset function is triggered, at this moment, alu_out signal is 0.
//When “accum” signal is input 0, “zero” output 1, and is 0 otherwise. “zero” no need to reset with “reset” signal, and no need to synchronize with the clock signal.
//cases are as belows

