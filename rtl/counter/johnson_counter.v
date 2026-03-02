// -----------------------------------------------------------------------------
// File    : johnson_counter.v
// Module  : johnson_counter
// Brief   : Parameterized N-bit Johnson (twisted-ring) counter.
//           On each clock, shifts left and feeds the inverted MSB into LSB.
//           Produces 2N unique states; resets asynchronously active-low.
// Params  : N – register width (default 16)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module johnson_counter #(
    parameter integer N     = 16
)(
    input  wire             clk,
    input  wire             rst,
    output reg  [N-1:0] out
);
always @(posedge clk or negedge rst) begin
    if (!rst)
        out <= '0;
    else
        out <= {out[N-2:0], ~out[N-1]};
end
endmodule