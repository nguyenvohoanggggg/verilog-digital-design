`timescale 1ns/1ps

module half_adder_tb;

    // Signals
    reg  A_tb;
    reg  B_tb;
    wire Sum_tb;
    wire Carry_tb;

    // DUT 
    half_adder dut (
        .A(A_tb),
        .B(B_tb),
        .Sum(Sum_tb),
        .Carry(Carry_tb)
    );

    // Stimulus
    initial begin
        A_tb = 0; B_tb = 0; #10;
        A_tb = 0; B_tb = 1; #10;
        A_tb = 1; B_tb = 0; #10;
        A_tb = 1; B_tb = 1; #10;

        $display("HALF ADDER SIM DONE");
        $stop;   
    end

endmodule
