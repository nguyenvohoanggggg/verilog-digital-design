// -----------------------------------------------------------------------------
// File    : ring_counter.v
// Module  : ring_counter
// Brief   : Parameterized N-bit ring counter. On reset, loads a single '1'
//           in bit 0; on each clock the hot bit rotates left circularly.
//           Resets asynchronously active-low.
// Params  : N – register width (default 16)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
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