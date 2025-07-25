`timescale 1ns / 1ps

module _4x4appmul(input [3:0] a, input [3:0] b, output [7:0] out);
   wire x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,p30,g30,p21,g21,G;
   wire [5:1] c;
 
   assign out[0] = a[0] & b[0];
   assign x1 = a[1] & b[0];
   assign x2 = a[0] & b[1];
   assign x3 = a[2] & b[0];
   assign x4 = a[1] & b[1];
   assign x5 = a[0] & b[2];
   assign x6 = a[3] & b[0];
   assign x7 = a[2] & b[1];
   assign x8 = a[1] & b[2];
   assign x9 = a[0] & b[3];
   assign x10 = a[3] & b[1];
   assign x11 = a[2] & b[2];
   assign x12 = a[1] & b[3];
   assign x13 = a[3] & b[2];
   assign x14 = a[2] & b[3];
   assign x15 = a[3] & b[3];
 
   assign p30 = x6 | x9;
   assign g30 = x6 & x9;
   assign p21 = x7 | x8;
   assign g21 = x7 & x8;
   assign G = g30 | g21;

   
  approx_ha     mod1(x1,x2,out[1],c[1]);
  approx_comp   mod2(x3,x4,x5,c[1],out[2],c[2]);
  approx_comp   mod3(p30,p21,G,c[2],out[3],c[3]);
  approx_comp   mod4(x10,x11,x12,c[3],out[4],c[4]);
  approx_fa     mod5(x13,x14,c[4],out[5],c[5]);
  approx_ha     mod6(x15,c[5],out[6],out[7]);
   
endmodule


module approx_ha( input a,input b, output sum, output carry);
    or(sum,a,b);
    and(carry,a,b);
endmodule

module approx_fa( input a, input b, input c, output sum, output carry);
       assign sum = (a + b)^c;
       assign carry = (a & b)+(b & c)  ;
endmodule 

module approx_comp( input a, input b, input c, input d, output sum, output carry);
       assign sum = (a^b)+(c^d);
       assign carry = (a & b)+(c & d);
endmodule
