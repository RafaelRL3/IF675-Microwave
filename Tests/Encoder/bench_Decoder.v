`timescale 1ps/1ps

module bench_Decoder(); 
reg [3:0] in, in2, in3; 
reg enable;
wire [6:0] out, out2, out3;

decoder4x7 U1(.binary_in(in), .decoder_out(out),.enable(enable));
decoder4x7 U2(.binary_in(in2), .decoder_out(out2),.enable(enable));
decoder4x7 U3(.binary_in(in3), .decoder_out(out3),.enable(enable));


integer i;


initial
    begin 
    $dumpfile("decoderWave.vcd");
	$dumpvars(0,bench_Decoder);
    
    enable = 0;
    in = 0;
    
    #5 enable = ~enable;

    for (i = 0; i < 7; i++) begin
      #10 in = i;
    end
    #10
    for (i = 0; i < 7; i++) begin
      #5 in2 = i;
    end
    #10
    for (i = 0; i < 7; i++) begin
      #5 in3 = i;
    end

/*
    #10 in = 7'b000000;
    #10 in = 7'b000001;
    #10 in = 7'b000010;
    #10 in = 7'b000011;
    #10 in = 7'b000100;
    #10 in = 7'b000101;
    #10 in = 7'b000110;
*/
    $finish;
end

 initial 
    begin
    #1 $monitor("IN=%d | OUT=%d | Enable=%b ", in, out, enable);
  end
  
endmodule