module ring_counter #(
    parameter integer N     = 16
)(
    input  wire             clk,
    input  wire             rst,
    output reg  [N-1:0] out
);
always @(posedge clk or negedge rst) begin
    if (!rst)
        out <= {{(N-1){1'b0}}, 1'b1};
    else
        out <= {out[N-2:0], out[N-1]};
end
endmodule