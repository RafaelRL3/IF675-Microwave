module decoder4x7(
  binary_in   , //  4 bit binary input
  decoder_out , //  7-bit out 
  enable        //  Enable for the decoder
);
  input [3:0] binary_in  ;
  input  enable ; 
  output [6:0] decoder_out ; 
          
  wire [6:0] decoder_out ; 
  
  assign decoder_out = (enable) ? (1 << binary_in) : 6'b0 ;
  
 endmodule

module decoder_timer(
  input [3:0] sec_ones, sec_tens, min,
  input  wire enable,
  output [6:0] sec_ones_segs, sec_tens_segs, min_segs);
  
  decoder4x7 Dec1(.binary_in(sec_ones), .decoder_out(sec_ones_segs), .enable(enable));
  decoder4x7 Dec2(.binary_in(sec_tens), .decoder_out(sec_tens_segs), .enable(enable));
  decoder4x7 Dec3(.binary_in(min), .decoder_out(min_segs), .enable(enable));
  
endmodule
 