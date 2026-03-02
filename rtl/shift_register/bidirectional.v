// -----------------------------------------------------------------------------
// File    : bidirectional.v
// Module  : bidirectional_shift
// Brief   : Parameterized N-bit bidirectional shift register with parallel
//           load. dir=0 shifts left (serial_in_left → LSB); dir=1 shifts
//           right (serial_in_right → MSB). Resets asynchronously active-low.
// Params  : N – register width (default 8)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module bidirectional_shift #(
    parameter N = 8
)(
    input  wire clk,
    input  wire rst,
    input  wire load,
    input  wire shift_en,
    input  wire dir,               // 0: left, 1: right
    input  wire serial_in_left,
    input  wire serial_in_right,
    input  wire [N-1:0] parallel_in,
    output reg  [N-1:0] data_out
);

always @(posedge clk or negedge rst) begin
    if (!rst)
        data_out <= 0;
    else if (load)
        data_out <= parallel_in;
    else if (shift_en) begin
        if (dir == 1'b0)
            data_out <= {data_out[N-2:0], serial_in_left};   // shift left
        else
            data_out <= {serial_in_right, data_out[N-1:1]};  // shift right
    end
end

endmodule