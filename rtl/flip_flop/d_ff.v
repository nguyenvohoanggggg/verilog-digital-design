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