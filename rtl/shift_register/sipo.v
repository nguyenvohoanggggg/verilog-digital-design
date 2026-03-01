module sipo #(
    parameter N = 8
)(
    input  wire clk,
    input  wire rst,
    input  wire load,
    input  wire shift_en,
    input  wire serial_in,
    input  wire [N-1:0] parallel_in,
    output reg  [N-1:0] parallel_out
);

always @(posedge clk or negedge rst) begin
    if (!rst)
        parallel_out <= 0;
    else if (load)
        parallel_out <= parallel_in;
    else if (shift_en)
        parallel_out <= {parallel_out[N-2:0], serial_in};
end

endmodule