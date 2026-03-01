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