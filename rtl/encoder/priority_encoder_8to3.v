// -----------------------------------------------------------------------------
// File    : priority_encoder_8to3.v
// Module  : priority_encoder_8to3
// Brief   : 8-to-3 priority encoder. Encodes the position of the highest-
//           priority (MSB) active input into a 3-bit binary code.
//           valid=1 when at least one input is asserted; valid=0 otherwise.
// Rev     : 1.0  2026-03-03  Initial release
// -----------------------------------------------------------------------------
module priority_encoder_8to3 (
    input  wire [7:0] in,     // 8-bit input, in[7] = highest priority
    output reg  [2:0] out,    // 3-bit encoded output
    output reg        valid   // 1 = at least one input active
);

    always @(*) begin
        casez (in)
            8'b1???????: begin out = 3'd7; valid = 1'b1; end
            8'b01??????: begin out = 3'd6; valid = 1'b1; end
            8'b001?????: begin out = 3'd5; valid = 1'b1; end
            8'b0001????: begin out = 3'd4; valid = 1'b1; end
            8'b00001???: begin out = 3'd3; valid = 1'b1; end
            8'b000001??: begin out = 3'd2; valid = 1'b1; end
            8'b0000001?: begin out = 3'd1; valid = 1'b1; end
            8'b00000001: begin out = 3'd0; valid = 1'b1; end
            default:     begin out = 3'd0; valid = 1'b0; end
        endcase
    end

endmodule
