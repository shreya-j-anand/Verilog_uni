module Mux_2x1(o,i0,i1,s);
input i0,i1,s;
output o;
assign o=(~s&i0)|(s&i1);
endmodule

module Mux_4x1(o,i0,i1,i2,i3,s1,s0);
input i0,i1,i2,i3,s1,s0;
output o;
wire w1,w2;
Mux_2x1 n0(w1,i0,i1,s0);
Mux_2x1 n1(w2,i2,i3,s0);
Mux_2x1 n2(o,w1,w2,s1);
endmodule

module Mux_16x1(y,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,s0,s1,s2,s3);
input i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,s0,s1,s2,s3;
output y;
wire o0,o1,o2,o3;
Mux_4x1 n0(o0,i0,i1,i2,i3,s1,s0);
Mux_4x1 n1(o1,i4,i5,i6,i7,s1,s0);
Mux_4x1 n2(o2,i8,i9,i10,i11,s1,s0);
Mux_4x1 n3(o3,i12,i13,i14,i15,s1,s0);
Mux_4x1 n4(y,o0,o1,o2,o3,s3,s2);
endmodule

module tb_Mux_16x1();
reg i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,s0,s1,s2,s3;
wire y;
Mux_16x1 n1(y,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,s0,s1,s2,s3);
initial
begin
#100 i0=1'b1; i1=1'b0; i2=1'b0; i3=1'b1; i4=1'b1; i5=1'b0; i6=1'b0; i7=1'b0; i8=1'b0; i9=1'b1; i10=1'b0; i11=1'b1; i12=1'b0; i13=1'b0; i14=1'b1; i15=1'b1; s0=1'b0; s1=1'b0; s2=1'b0; s3=1'b0;
#100 s0=1'b0; s1=1'b1; s2=1'b0; s3=1'b1;
#100 s0=1'b1; s1=1'b0; s2=1'b1; s3=1'b0;
#100 s0=1'b1; s1=1'b1; s2=1'b1; s3=1'b1;
$stop;
end
endmodule


