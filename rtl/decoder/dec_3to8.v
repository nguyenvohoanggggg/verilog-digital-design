// -----------------------------------------------------------------------------
// File    : dec_3to8.v
// Module  : dec_3to8
// Brief   : 3-to-8 one-hot decoder. Drives exactly one of eight output lines
//           high based on the 3-bit binary input. No enable pin.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module dec_3to8 (
    input  wire [2:0] in,
    output reg  [7:0] out
);

always @(*) begin
    out = 8'b00000000;   // default
    out[in] = 1'b1;      // one-hot
end

endmodule