module rca16(sum, c_out, a, b, c_in);
input [15:0]a, b;
input c_in;
wire c_in4, c_in8, c_in12;
output [15:0]sum;
output c_out;

rca4 rca1(.sum(sum[3:0]), .c_out(c_in4), .a(a[3:0]), .b(b[3:0]), .c_in(c_in));
rca4 rca2(.sum(sum[7:4]), .c_out(c_in8), .a(a[7:4]), .b(b[7:4]), .c_in(c_in4));
rca4 rca3(.sum(sum[11:8]), .c_out(c_in12), .a(a[11:8]), .b(b[11:8]), .c_in(c_in8));
rca4 rca4(.sum(sum[15:12]), .c_out(c_out), .a(a[15:12]), .b(b[15:12]), .c_in(c_in12));


endmodule



