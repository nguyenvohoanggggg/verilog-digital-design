`timescale 1ns/1ps

module sr_latch_tb;

reg S, R;
wire Q, Q_bar;

sr_latch dut (
  .S(S),
  .R(R),
  .Q(Q),
  .Q_bar(Q_bar)
);

initial
  $monitor("t=%0t S=%b R=%b Q=%b Qbar=%b",
            $time, S, R, Q, Q_bar);

initial begin
  S=0; R=0; #10;

  S=1; R=0; #10;
  S=0; R=0; #10;

  S=0; R=1; #10;
  S=0; R=0; #10;

  S=1; R=1; #10;

  $finish;
end

endmodule
