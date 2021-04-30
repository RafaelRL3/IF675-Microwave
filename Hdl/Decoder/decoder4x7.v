module decoder4x7(
  input wire [3:0] sec_ones, sec_tens, min,
  output wire [6:0] sec_ones_segs, sec_tens_segs, min_segs);
  
  wire en_secs_ones;
  wire en_secs_tens;
  wire ground;
  
  
  decoderUnit Dec1(.binary_in(sec_ones), .decoder_out(sec_ones_segs), .en_in(en_secs_ones) , .en_out(ground));
  decoderUnit Dec2(.binary_in(sec_tens), .decoder_out(sec_tens_segs), .en_in(en_secs_tens) , .en_out(en_secs_ones));
  decoderUnit Dec3(.binary_in(min), .decoder_out(min_segs), .en_in(1'b0), .en_out(en_secs_tens));
  
endmodule


module decoderUnit(
  input wire [3:0] binary_in   , //  4 bit binary input
  output wire [6:0] decoder_out , //  7-bit out 
  input wire en_in,
  output wire en_out
); 
 
 //Decoder que mapeia para um binário para um bus de bits do display de 7 segmentos na forma abcdefg
 //onde ALTO(1) é o sinal de led ligado e o BAIXO(0), desligado.
  
  assign decoder_out = (binary_in==0 && en_in) ? 10'b1111110:
                       (binary_in==0 && ~(en_in)) ? 10'b0000000:
                       (binary_in==1) ? 10'b0110000:
                       (binary_in==2) ? 10'b1101101:
                       (binary_in==3) ? 10'b1111001:
                       (binary_in==4) ? 10'b0110011:
                       (binary_in==5) ? 10'b1011011:
                       (binary_in==6) ? 10'b1011111:
                       (binary_in==7) ? 10'b1110000:
                       (binary_in==8) ? 10'b1111111:10'b1111011;

  assign en_out = (binary_in[0] | binary_in[1] | binary_in[2] | binary_in[3] | en_in);  

  
endmodule