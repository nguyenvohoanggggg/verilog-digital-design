// -----------------------------------------------------------------------------
// File    : jk_ff.v
// Module  : jk_ff
// Brief   : JK flip-flop with asynchronous active-low reset. Implements the
//           four standard JK modes: hold (00), reset (01), set (10),
//           toggle (11); clocked on the rising edge.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module jk_ff (
    input  wire clk,
    input  wire rst,
    input  wire j,
    input  wire k,
    output reg  q
);
    always @(posedge clk or negedge rst) begin
        if (!rst)
            q <= 1'b0;
        else begin
            case ({j,k})
            2'b01: q <= 1'b0;
            2'b10: q <= 1'b1;
            2'b11: q <= ~q;
            default: q <= q;
            endcase
        end
    end
endmodule