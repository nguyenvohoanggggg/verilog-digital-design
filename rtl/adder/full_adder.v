module full_adder(
    input  wire A,
    input  wire B,
    input  wire Cin,
    output wire Sum,
    output wire Carry
    );
    assign Sum = A ^ B ^ Cin;
    assign Carry = (A & B) | (Cin & (A ^ B));
endmodule
