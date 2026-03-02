// -----------------------------------------------------------------------------
// File    : full_adder_4bit.v
// Module  : full_adder_4bit
// Brief   : 4-bit ripple-carry adder built from four full_adder instances.
//           Adds operands a[3:0] and b[3:0] with carry_in; produces sum[3:0]
//           and carry_out.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module full_adder_4bit (
  input wire [3:0] a,
  input wire [3:0] b,
  input wire carry_in,
  output wire [3:0] sum,
  output wire carry_out
);

  wire c1, c2, c3;

  full_adder fa0 (
    .A(a[0]),
    .B(b[0]),
    .Cin(carry_in),
    .Sum(sum[0]),
    .Carry(c1)
  );

  full_adder fa1 (
    .A(a[1]),
    .B(b[1]),
    .Cin(c1),
    .Sum(sum[1]),
    .Carry(c2)
  );

  full_adder fa2 (
    .A(a[2]),
    .B(b[2]),
    .Cin(c2),
    .Sum(sum[2]),
    .Carry(c3)
  );

  full_adder fa3 (
    .A(a[3]),
    .B(b[3]),
    .Cin(c3),
    .Sum(sum[3]),
    .Carry(carry_out)
  );

endmodule
