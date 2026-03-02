// -----------------------------------------------------------------------------
// File    : d_latch.v
// Module  : d_latch
// Brief   : Level-sensitive D latch. Output Q tracks input d while en=1;
//           holds last value when en=0. Provides complementary output Qbar.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module d_latch (
    input  wire d,
    input  wire en,
    output reg  Q,
    output wire Qbar
);

assign Qbar = ~Q;

always @(*) begin
    if (en)
        Q = d;
end

endmodule
