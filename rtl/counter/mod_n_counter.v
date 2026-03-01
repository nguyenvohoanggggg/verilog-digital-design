module modn_counter #(
    parameter integer N     = 16,
    parameter integer WIDTH = $clog2(N)
)(
    input  wire             clk,
    input  wire             rst,
    output reg  [WIDTH-1:0] out
);

always @(posedge clk or negedge rst) begin
    if (!rst)
        out <= '0;
    else if (out == N-1)
        out <= '0;
    else
        out <= out + 1'b1;
end

endmodule