`timescale 1ns / 1ps

module ripple_carry_adder_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    reg  [4:0] expected;

    // DUT
    ripple_carry_adder dut (
        .a    (a),
        .b    (b),
        .cin  (cin),
        .sum  (sum),
        .cout (cout)
    );

    initial begin
        // Test case 1 
        a = 4'b0001; b = 4'b0010; cin = 0;  // 1 + 2
        #20;

        // Test case 2 
        a = 4'b0011; b = 4'b0101; cin = 0;  // 3 + 5
        #20;

        // Test case 3 
        a = 4'b0111; b = 4'b0001; cin = 0;  // ripple carry
        #20;

        // Test case 4 
        a = 4'b1111; b = 4'b0001; cin = 0;  // overflow
        #20;

        // Test case 5
        a = 4'b1010; b = 4'b0101; cin = 1;  // with cin
        #20;

        $stop;
    end

    always @(*) begin
        expected = a + b + cin;
    end

endmodule
