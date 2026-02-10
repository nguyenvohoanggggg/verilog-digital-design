module ripple_carry_adder(
    input[3:0] a,
    input[3:0] b,
    input cin,
    output[3:0] sum,
    output cout
    );
    wire[2:0] w;
    
    full_adder a1(.A(a[0]), .B(b[0]), .Cin(cin), .Carry(w[0]), .Sum(sum[0]));
    full_adder a2(.A(a[1]), .B(b[1]), .Cin(w[0]), .Carry(w[1]), .Sum(sum[1]));
    full_adder a3(.A(a[2]), .B(b[2]), .Cin(w[1]), .Carry(w[2]), .Sum(sum[2]));
    full_adder a4(.A(a[3]), .B(b[3]), .Cin(w[2]), .Carry(cout), .Sum(sum[3]));
   
endmodule
