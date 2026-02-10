module half_adder(
    input wire A, B,
    output wire Sum, Carry
    );
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
