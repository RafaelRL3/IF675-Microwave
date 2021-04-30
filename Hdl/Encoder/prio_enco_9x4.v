module prio_enco_9x4 (
  output wire [3:0] d_out,
  input [9:0] d_in,
  input enable,
  output wire loadn
);

    assign loadn = enable;
  
  	assign d_out = (d_in[9] ==1'b1) ? 4'b1001:
                      (d_in[8] ==1'b1) ? 4'b1000:
                      (d_in[7] ==1'b1) ? 4'b0111:
                      (d_in[6] ==1'b1) ? 4'b0110:
                      (d_in[5] ==1'b1) ? 4'b0101:
                      (d_in[4] ==1'b1) ? 4'b0100:
                      (d_in[3] ==1'b1) ? 4'b0011:
                      (d_in[2] ==1'b1) ? 4'b0010:
                      (d_in[1] ==1'b1) ? 4'b0001:
                      (d_in[0] ==1'b1) ? 4'b0000: 4'bxxxx;
endmodule