// Code your design
module bit32(a,b,p);
  input [31:0] a,b;
  output [63:0] p;
  wire [31:0] p1,p2,p3,p4;
  wire [33:0] s1,s2;
  
  bit16 fisbiu(a[15:0],b[15:0],p1);
  bit16 dj(a[31:16],b[15:0],p2);
  bit16 fisnn(a[15:0],b[31:16],p3);
  bit16 fvs(a[31:16],b[31:16],p4);
  
  assign p[15:0]=p1[15:0];
  csa32bit aon(p2,p3,{16'b0,p1[31:16]},s1);
  assign p[31:16] = s1[15:0];
  csa32bit bdi(p4,32'b0,{14'b0,s1[33:16]},s2);
  assign p[63:32]=s2[31:0];
endmodule

module bit16(a,b,p);
  input [15:0] a,b;
  output [31:0] p;
  wire [15:0] p1,p2,p3,p4;
  wire [17:0] s1,s2;
  bit8 adabudi(a[7:0],b[7:0],p1);
  bit8 sjubh(a[15:8],b[7:0],p2);
  bit8 csfc(a[7:0],b[15:8],p3);
  bit8 cucbu(a[15:8],b[15:8],p4);
  
  assign p[7:0]=p1[7:0];
  csa16bit bubsuf(p2,p3,{8'b0,p1[15:8]},s1);
  assign p[15:8]=s1[7:0];
  csa16bit consn(p4,16'b0,{6'b0,s1[17:8]},s2);
  assign p[31:16]=s2[15:0];
  
endmodule
module bit8(a,b,p);
  input [7:0] a,b;
  output [15:0] p;
  wire [7:0] p1,p2,p3,p4;
  wire [9:0] s2,s1;
  
  bit4 sss(a[3:0],b[3:0],p1);
  bit4 adaad(a[7:4],b[3:0],p2);
  bit4 addcss(a[3:0],b[7:4],p3);
  bit4 pjnn(a[7:4],b[7:4],p4);
  
  assign p[3:0]=p1[3:0];
  csa8bit adbdv(p2,p3,{4'b0,p1[7:4]},s1);
  assign p[7:4]=s1[3:0];
  csa8bit djvdvd(p4,8'b0,{2'b0,s1[9:4]},s2);
  assign p[15:8]=s2[7:0];
endmodule

module bit4(a,b,p);
  input [3:0]a,b;
  output [7:0] p;
  wire [3:0]p1,p2,p3,p4;
  wire [5:0] s1,s2;
  bit2 ad(a[1:0],b[1:0],p1);
  bit2 sf(a[3:2],b[1:0],p2);
  bit2 aed(a[1:0],b[3:2],p3);
  bit2 sq(a[3:2],b[3:2],p4);
  
  assign p[1:0]=p1[1:0];
  csa4bit pa(p2,p3,{2'b0,p1[3:2]},s1);
  assign p[3:2]=s1[1:0];
  csa4bit adds(p4,s1[5:2],0,s2);
  assign p[7:4]=s2[3:0];
  
endmodule
module bit2(a,b,p);
  input [1:0] a,b;
  output [3:0] p;
  
  assign p[0]=a[0] & b[0];
  wire c1,c2,c;
  assign c1=a[1] & b[0];
  assign c2=a[0] & b[1];
  assign p[1]=c1 ^ c2;
  assign c=c1 & c2;
  assign p[3:2]=(a[1] & b[1]) + c;
endmodule

module fa(
  input a,b,cin,
  output sum,cout);
  assign cout=(a&b)|(b&cin)|(cin&a);
  assign sum=a^b^cin;
endmodule
  
module csa4bit(a,b,c,s);
  input [3:0] a,b,c;
  output [5:0] s;
  genvar i;
  wire [3:0]s1,s2,c1;
  
  generate
    for (i=0;i<4;i=i+1)
      begin:is
        fa as(a[i],b[i],c[i],s1[i],c1[i]);
      end
  endgenerate
  
  assign s[0]=s1[0];
  fa ada(s1[1],c1[0],1'b0,s[1],s2[0]);
  fa adsgsefe(s1[2],c1[1],s2[0],s[2],s2[1]);
  fa addw(s1[3],c1[2],s2[1],s[3],s2[2]);
  fa ssse(1'b0,c1[3],s2[2],s[4],s[5]);
endmodule

module csa8bit(a,b,c,s);
  input [7:0] a,b,c;
  output [9:0] s;
  genvar i;
  wire [7:0] s1,s2,c1;
  
  generate
    for (i=0;i<8;i=i+1)
      begin: inad
        fa odcn(a[i],b[i],c[i],s1[i],c1[i]);
      end
  endgenerate
  
  assign s[0]=s1[0];
  fa a1(s1[1],c1[0],0,s[1],s2[0]);
  fa a2(s1[2],c1[1],s2[0],s[2],s2[1]);
  fa a3(s1[3],c1[2],s2[1],s[3],s2[2]);
  fa a4(s1[4],c1[3],s2[2],s[4],s2[3]);
  fa a5(s1[5],c1[4],s2[3],s[5],s2[4]);
  fa a6(s1[6],c1[5],s2[4],s[6],s2[5]);
  fa a7(s1[7],c1[6],s2[5],s[7],s2[6]);
  fa a8(1'b0,c1[7],s2[6],s[8],s[9]);
  
endmodule

module csa16bit(a,b,c,s);
  input [15:0] a,b,c;
  output [17:0] s;
  genvar i;
  wire [15:0] s1,s2,c1;
  
  generate
    for (i=0;i<16;i=i+1)
      begin: insfas
        fa ni(a[i],b[i],c[i],s1[i],c1[i]);
      end
  endgenerate
  
  assign s[0]=s1[0];
  fa b1(s1[1],c1[0],0,s[1],s2[0]);
  
  generate
    for (i=1;i<15;i=i+1)
      begin: isfnusb
        fa vni(s1[i+1],c1[i],s2[i-1],s[i+1],s2[i]);
      end
  endgenerate
  
  fa vnr(1'b0,c1[15],s2[14],s[16],s[17]);
  
endmodule

module csa32bit(a,b,c,s);
  input [31:0] a,b,c;
  output [33:0] s;
  wire [31:0] s1,s2,c1;
  
  genvar i;
  generate 
    for (i=0;i<32;i=i+1)
      begin: sfibfs
        fa uvcss(a[i],b[i],c[i],s1[i],c1[i]);
      end
  endgenerate
  
  assign s[0]=s1[0];
  
  fa adcnan(s1[1],c1[0],0,s[1],s2[0]);
  
  generate 
    for (i=1;i<31;i=i+1)
      begin: sijfifn
        fa jnsn(s1[i+1],c1[i],s2[i-1],s[i+1],s2[i]);
      end
  endgenerate
  
  fa sninf(0,c1[31],s2[30],s[32],s[33]);
endmodule
