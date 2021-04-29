
module encoder(
  output [3:0] d_out,
  input [9:0] d_in,
  output wire loadn,
  input enable
);
  prio_enco_9x4 U(.d_out(d_out),.d_in(d_in),.enable(enable),.loadn(loadn));

endmodule