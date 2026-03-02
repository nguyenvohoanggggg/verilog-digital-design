// -----------------------------------------------------------------------------
// File    : mod_n_counter.v
// Module  : mod_n_counter
// Brief   : Parameterized modulo-N up counter with synchronous reset and
//           enable. Counts 0 → N-1 then wraps back to 0. Counter width is
//           derived automatically via $clog2(N).
// Params  : N     – modulus (default 16)
//           WIDTH – bit-width, auto-computed as $clog2(N)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module mod_n_counter #(
    parameter integer N = 16,
    parameter integer WIDTH = $clog2(N)
)(
    input  wire clk,
    input  wire rst,
    input  wire en,
    output reg  [WIDTH-1:0] count
);

always @(posedge clk or negedge rst) begin
    if (!rst)
        count <= 0;
    else if (en) begin
        if (count == N-1)
            count <= 0;
        else
            count <= count + 1'b1;
    end
end

endmodule