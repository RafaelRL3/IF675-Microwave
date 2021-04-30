module prio_enco_9x4 (
  output wire [3:0] d_out,
  input wire[9:0] d_in,
  input wire enable,
  output wire loadn
);
// Usamos do seguinte mapeamento:
/*
IDLE -> 0000000000 (SEM ENTRADAS NO TECLADO) 
0    -> 0000000001
1    -> 0000000010
2    -> 0000000100
3    -> 0000001000
4    -> 0000010000
5    -> 0000100000
6    -> 0001000000
7    -> 0010000000
8    -> 0100000000
9    -> 1000000000
*/

      assign loadn = (enable | ~(d_in[0] | d_in[1] | d_in[2] | d_in[3] | d_in[4] | d_in[5] | d_in[6] | d_in[7] | d_in[8] | d_in[9]));
      assign d_out = (d_in[9] ==1'b1) ? 4'b1001:
                      (d_in[8] ==1'b1) ? 4'b1000:
                      (d_in[7] ==1'b1) ? 4'b0111:
                      (d_in[6] ==1'b1) ? 4'b0110:
                      (d_in[5] ==1'b1) ? 4'b0101:
                      (d_in[4] ==1'b1) ? 4'b0100:
                      (d_in[3] ==1'b1) ? 4'b0011:
                      (d_in[2] ==1'b1) ? 4'b0010:
                      (d_in[1] ==1'b1) ? 4'b0001:
                      (d_in[0] ==1'b1) ? 4'b0000: 4'b0000;
endmodule
