// -----------------------------------------------------------------------------
// File    : siso.v
// Module  : siso
// Brief   : Parameterized N-bit Serial-In Serial-Out (SISO) shift register.
//           shift_en=1 shifts serial_in through the register each clock;
//           serial_out reflects the MSB. load=1 preloads parallel_in.
// Params  : N – register width (default 8)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module siso #(
    parameter N = 8
)(
    input  wire clk,
    input  wire rst,
    input  wire load,
    input  wire shift_en,
    input  wire serial_in,
    input  wire [N-1:0] parallel_in,
    output wire serial_out
);

reg [N-1:0] shreg;

always @(posedge clk or negedge rst) begin
    if (!rst)
        shreg <= 0;
    else if (load)
        shreg <= parallel_in;
    else if (shift_en)
        shreg <= {shreg[N-2:0], serial_in};
end

assign serial_out = shreg[N-1];

endmodule