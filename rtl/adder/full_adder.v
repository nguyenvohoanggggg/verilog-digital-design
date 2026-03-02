// -----------------------------------------------------------------------------
// File    : full_adder.v
// Module  : full_adder
// Brief   : 1-bit full adder. Computes Sum = A ^ B ^ Cin and
//           Carry = (A & B) | (Cin & (A ^ B)).
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
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
