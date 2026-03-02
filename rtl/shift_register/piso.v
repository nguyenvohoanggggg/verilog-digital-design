// -----------------------------------------------------------------------------
// File    : piso.v
// Module  : piso
// Brief   : Parameterized N-bit Parallel-In Serial-Out (PISO) shift register.
//           load=1 latches parallel_in; shift_en=1 shifts out MSB first on
//           serial_out. Resets asynchronously active-low.
// Params  : N – register width (default 8)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module piso #(
    parameter N = 8
)(
    input  wire clk,
    input  wire rst,
    input  wire load,
    input  wire shift_en,
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
        shreg <= {shreg[N-2:0], 1'b0};
end

assign serial_out = shreg[N-1];

endmodule