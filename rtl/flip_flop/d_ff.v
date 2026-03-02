// -----------------------------------------------------------------------------
// File    : d_ff.v
// Module  : d_ff
// Brief   : D flip-flop with asynchronous active-low reset. Captures d on
//           the rising clock edge; provides complementary output qbar.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module d_ff (
    input wire clk,
    input wire rst,
    input wire d,
    output reg q,
    output wire qbar
);

    always @(posedge clk or negedge rst) begin
        if (!rst)
            q <= 1'b0;
        else
            q <= d;
    end

    assign qbar = ~q;

endmodule