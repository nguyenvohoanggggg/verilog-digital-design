module dec_3to8 (
    input  wire [2:0] in,
    output reg  [7:0] out
);

always @(*) begin
    out = 8'b00000000;   // default 
    out[in] = 1'b1;      // one-hot
end

endmodule