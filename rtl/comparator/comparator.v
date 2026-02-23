module comparator (
    input wire [3:0] a,
    input wire [3:0] b,
    output reg gt, // a > b
    output reg eq, // a == b
    output reg lt  // a < b
    );
        always @(*) begin
            if (a > b) begin
                gt = 1'b1;
                eq = 1'b0;
                lt = 1'b0;
            end else if (a == b) begin
                gt = 1'b0;
                eq = 1'b1;
                lt = 1'b0;
            end else begin
                gt = 1'b0;
                eq = 1'b0;
                lt = 1'b1;
            end
        end
endmodule

