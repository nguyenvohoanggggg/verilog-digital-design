// -----------------------------------------------------------------------------
// File    : dec_2to4.v
// Module  : dec_2to4
// Brief   : 2-to-4 one-hot decoder. Drives exactly one of four output lines
//           high based on the 2-bit binary input. No enable pin.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module dec_2to4 (
    input  wire [1:0] in,
    output reg  [3:0] out
);

always @(*) begin
    out = 4'b0000;  // default
    out[in] = 1'b1;  // one-hot
end

endmodule