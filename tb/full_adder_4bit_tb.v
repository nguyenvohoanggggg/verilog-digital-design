`timescale 1ns/1ps

module full_adder_4bit_tb;

reg  [3:0] a_tb, b_tb;
reg        cin_tb;
wire [3:0] sum_tb;
wire       carry_tb;

integer i,j,k;
integer errors = 0;
reg [4:0] expected;

full_adder_4bit dut (
  .a(a_tb),
  .b(b_tb),
  .carry_in(cin_tb),
  .sum(sum_tb),
  .carry_out(carry_tb)
);

initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, full_adder_4bit_tb);

  for (i=0;i<16;i=i+1)
    for (j=0;j<16;j=j+1)
      for (k=0;k<2;k=k+1) begin
        a_tb = i;
        b_tb = j;
        cin_tb = k;
        #1;
        expected = i + j + k;

        if ({carry_tb,sum_tb} !== expected) begin
          errors = errors + 1;
          $display("ERROR: %d + %d + %d", i,j,k);
        end

        #9;
      end

  $display("Simulation done. Errors = %0d", errors);
  $finish;
end

endmodule
