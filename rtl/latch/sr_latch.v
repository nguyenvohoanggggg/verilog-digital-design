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
