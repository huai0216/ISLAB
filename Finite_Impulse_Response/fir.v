
//It is synchronous reset architecture when reset is 1,
//when "reset" signal is 1, the reset function is triggered, 
//at this moment, all shift register is 0, and output value result will be Din[7:0] times 7.
//According to the symbol view, it can know that this is a shift register, each stage parameter, 
//and input signal multiply and accumulate separately of the result, so “Dout” signal no need to synchronous with clock signal

module FIR(Dout, Din, clk, reset);

parameter b0=7;
parameter b1=17;
parameter b2=32;
parameter b3=46;
parameter b4=52;
parameter b5=46;
parameter b6=32;
parameter b7=17;
parameter b8=7;

output reg	[17:0]	Dout;
input 	[7:0] 	Din;
input 	clk, reset;
reg [7:0] register [0:7];
integer i;

always@(posedge clk)
	if(reset == 1'b1)begin
	Dout = Din * 8'b0000_0111;
		for(i = 0; i <8 ; i = i+1)begin
		register [i] <= 8'b0;
		end
	end
	else begin
		register[0] <= Din;
		for(i=1; i<=7; i=i+1)begin
		register[i] <= register[i-1]; 
		end
		assign Dout = b0*register[0] + b1*register[0] + b2*register[1]+b3*register[2]+b4*register[3]+b5*register[4]+b6*register[5]+b7*register[6]+b8*register[7];
	end


endmodule
