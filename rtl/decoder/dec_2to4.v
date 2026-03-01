module dec_2to4 (
    input  wire [1:0] in,
    output reg  [3:0] out
);

always @(*) begin
    out = 4'b0000;  // default
    out[in] = 1'b1;  // one-hot
end

endmodule