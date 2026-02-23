module sr_ff (
  input wire s,
  input wire r,
  input wire clk,
  input wire rst,
  output reg q
);
    always @(posedge clk or negedge rst) begin
    if (!rst)
        q <= 1'b0;
    else begin // case (flip-flop SR)
        case ({s, r})
            2'b00: q <= q; // No change
            2'b01: q <= 1'b0; // Reset
            2'b10: q <= 1'b1; // Set
            2'b11: q <= 1'bx; // Invalid state
            default: q <= q; // Default case 
        endcase
    end
    end
endmodule
