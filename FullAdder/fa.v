module fa(a, b, ci, sum, cout);
input a, b, ci;
output  sum, cout;
wire ha1_sum, ha2_sum, ha1_carry, ha2_carry, fsum, fcout;

ha ha1(.a(a), .b(b), .sum(ha1_sum), .cout(ha1_carry));
ha ha2(.a(ha1_sum), .b(ci), .sum(ha2_sum), .cout(ha2_carry));

assign sum = ha2_sum;
assign cout = ha1_carry | ha2_carry;


endmodule
