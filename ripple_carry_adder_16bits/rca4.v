module rca4(sum, c_out, a, b, c_in);
input [3:0]a, b;
input c_in;
wire c1, c2, c3;
output [3:0]sum;
output c_out;

fa fa1(.a(a[0]), .b(b[0]), .ci(c_in), .sum(sum[0]), .cout(c1));
fa fa2(.a(a[1]), .b(b[1]), .ci(c1), .sum(sum[1]), .cout(c2));
fa fa3(.a(a[2]), .b(b[2]), .ci(c2), .sum(sum[2]), .cout(c3));
fa fa4(.a(a[3]), .b(b[3]), .ci(c3), .sum(sum[3]), .cout(c_out));

endmodule
