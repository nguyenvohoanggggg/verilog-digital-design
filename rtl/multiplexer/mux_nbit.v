module mux_32to1 (
  input wire [31:0] data_in,
  input wire [4:0] sel,
  output wire data_out
);

  assign data_out = (sel == 5'b00000) ? data_in[0] :
                   (sel == 5'b00001) ? data_in[1] :
                   (sel == 5'b00010) ? data_in[2] :
                   (sel == 5'b00011) ? data_in[3] :
                   (sel == 5'b00100) ? data_in[4] :
                   (sel == 5'b00101) ? data_in[5] :
                   (sel == 5'b00110) ? data_in[6] :
                   (sel == 5'b00111) ? data_in[7] :
                   (sel == 5'b01000) ? data_in[8] :
                   (sel == 5'b01001) ? data_in[9] :
                   (sel == 5'b01010) ? data_in[10] :
                   (sel == 5'b01011) ? data_in[11] :
                   (sel == 5'b01100) ? data_in[12] :
                   (sel == 5'b01101) ? data_in[13] :
                   (sel == 5'b01110) ? data_in[14] :
                   (sel == 5'b01111) ? data_in[15] :
                   (sel == 5'b10000) ? data_in[16] :
                   (sel == 5'b10001) ? data_in[17] :
                   (sel == 5'b10010) ? data_in[18] :
                   (sel == 5'b10011) ? data_in[19] :
                   (sel == 5'b10100) ? data_in[20] :
                   (sel == 5'b10101) ? data_in[21] :
                   (sel == 5'b10110) ? data_in[22] :
                   (sel == 5'b10111) ? data_in[23] :
                   (sel == 5'b11000) ? data_in[24] :
                   (sel == 5'b11001) ? data_in[25] :
                   (sel == 5'b11010) ? data_in[26] :
                   (sel == 5'b11011) ? data_in[27] :
                   (sel == 5'b11100) ? data_in[28] :
                   (sel == 5'b11101) ? data_in[29] :
                   (sel == 5'b11110) ? data_in[30] :
                                     data_in[31];
endmodule
