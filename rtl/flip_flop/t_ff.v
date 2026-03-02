// -----------------------------------------------------------------------------
// File    : t_ff.v
// Module  : t_ff
// Brief   : T flip-flop with asynchronous active-low reset. Toggles q on
//           each rising clock edge when t=1; holds q when t=0.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module t_ff (
  input  wire clk,
  input  wire rst,
  input  wire t,
  output reg  q
);

always @(posedge clk or negedge rst) begin
  if (!rst)
    q <= 1'b0;
  else if (t)
    q <= ~q;
end

endmodule
