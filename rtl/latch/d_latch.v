module d_latch (
    input  wire d,
    input  wire en,
    output reg  Q,
    output wire Qbar
);

assign Qbar = ~Q;

always @(*) begin
    if (en)
        Q = d;   
end

endmodule
