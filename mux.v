//2to1multiplexer

`define dly_and 1
`define dly_or 2
module mux (out,a,b,sel);

input a, b, sel;
output out;
wire w1, w2;

and g1(w1, a, ~sel);
and g2(w2, b, sel);
or g3(out, w1, w2);



endmodule
