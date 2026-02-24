`timescale 1ns/1ps

module full_adder_4bit_tb;

reg  [3:0] A_tb, B_tb;
reg        Cin_tb;
wire [3:0] Sum_tb;
wire       Carry_tb;

integer i,j,k;
integer errors = 0;
reg [4:0] expected;

full_adder_4bit dut (
  .A(A_tb),
  .B(B_tb),
  .Cin(Cin_tb),
  .Sum(Sum_tb),
  .Carry(Carry_tb)
);

initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, full_adder_4bit_tb);

  for (i=0;i<16;i=i+1)
    for (j=0;j<16;j=j+1)
      for (k=0;k<2;k=k+1) begin
        A_tb = i;
        B_tb = j;
        Cin_tb = k;
        #1;
        expected = i + j + k;

        if ({Carry_tb,Sum_tb} !== expected) begin
          errors = errors + 1;
          $display("ERROR: %d + %d + %d", i,j,k);
        end

        #9;
      end

  $display("Simulation done. Errors = %0d", errors);
  $finish;
end

endmodule
