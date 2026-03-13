// -----------------------------------------------------------------------------
// File    : mod_n_counter.v
// Module  : mod_n_counter
// Brief   : Parameterized modulo-N up counter with active-low asynchronous
//           reset and enable. Counts 0 -> N-1 then wraps back to 0. Counter
//           width is derived internally from N.
// Params  : N - modulus (default 16)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module mod_n_counter #(
    parameter integer N = 16
)(
    input  wire                                clk,
    input  wire                                rst,
    input  wire                                en,
    output reg  [((N <= 1) ? 1 : $clog2(N))-1:0] count
);

localparam integer WIDTH = (N <= 1) ? 1 : $clog2(N);
localparam integer MAX_COUNT = N - 1;

`ifndef SYNTHESIS
initial begin
    if (N < 1) begin
        $error("mod_n_counter requires N >= 1");
        $finish;
    end
end
`endif

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        count <= {WIDTH{1'b0}};
    end else if (en) begin
        if (count == MAX_COUNT[WIDTH-1:0]) begin
            count <= {WIDTH{1'b0}};
        end else begin
            count <= count + 1'b1;
        end
    end
end

endmodule
