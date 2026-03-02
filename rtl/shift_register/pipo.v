// -----------------------------------------------------------------------------
// File    : pipo.v
// Module  : pipo
// Brief   : Parameterized N-bit Parallel-In Parallel-Out (PIPO) register.
//           Loads parallel_in into parallel_out on the rising edge when
//           load=1; holds otherwise. Resets asynchronously active-low.
// Params  : N – register width (default 8)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module pipo #(
    parameter N = 8
)(
    input  wire clk,
    input  wire rst,
    input  wire load,
    input  wire [N-1:0] parallel_in,
    output reg  [N-1:0] parallel_out
);

always @(posedge clk or negedge rst) begin
    if (!rst)
        parallel_out <= 0;
    else if (load)
        parallel_out <= parallel_in;
end

endmodule