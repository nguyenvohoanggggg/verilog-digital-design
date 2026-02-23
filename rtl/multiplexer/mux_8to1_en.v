module mux_8to1_en (
  input wire [7:0] data_in, 
  input wire [2:0] sel, 
  input wire en,
  output wire data_out 
);
    assign data_out = en ? data_in[sel] : 1'b0;

endmodule