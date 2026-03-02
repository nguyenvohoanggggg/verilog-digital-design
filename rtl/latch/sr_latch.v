// -----------------------------------------------------------------------------
// File    : sr_latch.v
// Module  : sr_latch
// Brief   : SR latch (combinational, no clock). S=1,R=0 sets Q=1;
//           S=0,R=1 clears Q=0; S=R=0 holds; S=R=1 produces 'x'.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module sr_latch (
  input  wire S,
  input  wire R,
  output reg  Q,
  output wire Q_bar
);

assign Q_bar = ~Q;

always @(*) begin
  if (S && ~R)
    Q = 1;
  else if (~S && R)
    Q = 0;
  else if (~S && ~R)
    Q = Q;     // hold
  else
    Q = 1'bx;  // invalid
end

endmodule
