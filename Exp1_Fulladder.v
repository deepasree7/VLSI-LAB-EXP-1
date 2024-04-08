module fa_ha(a,b,c,sum,cout);
input a,b,c;
output sum,cout;
wire wl, w2, w3, w4, w5;
xor x1(w1,a,b);
xor x2 (sum,w1,c) ;
and al(w2,a,b) ;
and a2(w3,b,c);
and a3(w4,a,c) ;
or o1(w5,w2,w3) ;
or o2(cout,w5,w4) ;
endmodule
