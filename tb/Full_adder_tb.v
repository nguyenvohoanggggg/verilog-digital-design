`timescale 1ns/1ps

module full_adder_tb;

  reg  A_tb, B_tb, Cin_tb;
  wire Sum_tb, Carry_tb;

  Full_adder dut (
    .A(A_tb),
    .B(B_tb),
    .Cin(Cin_tb),
    .Sum(Sum_tb),
    .Carry(Carry_tb)
  );

  initial begin
    A_tb = 0; B_tb = 0; Cin_tb = 0; #10;
    A_tb = 0; B_tb = 0; Cin_tb = 1; #10;
    A_tb = 0; B_tb = 1; Cin_tb = 0; #10;
    A_tb = 0; B_tb = 1; Cin_tb = 1; #10;
    A_tb = 1; B_tb = 0; Cin_tb = 0; #10;
    A_tb = 1; B_tb = 0; Cin_tb = 1; #10;
    A_tb = 1; B_tb = 1; Cin_tb = 0; #10;
    A_tb = 1; B_tb = 1; Cin_tb = 1; #10;

    $stop;
  end

endmodule

