`timescale 1ps/1ps

module bench_Decoder(); 
input reg [3:0] in;
input wire [6:0] out;


decoderUnit dec(.binary_in(in), .decoder_out(out));
wire [10:0] aux;

assign aux [0] = 126; // = 0
assign aux [1] = 48;  // = 1
assign aux [2] = 109; // = 2
assign aux [3] = 121; // = 3
assign aux [4] = 51;  // = 4
assign aux [5] = 91;  // = 5
assign aux [6] = 95;  // = 6
assign aux [7] = 112; // = 7
assign aux [8] = 127; // = 8
assign aux [9] = 123; // = 9

integer i;

for (i = 0; i < 9; i++)begin
    
end


    begin 
    $dumpfile("decoderWave.vcd");
	$dumpvars(0,bench_Decoder);
    
    assign decoder_out = (binary_in==10'b1111110) ? 0:
                       (binary_in==10'b0110000) ? 1:
                       (binary_in==10'b1101101) ? 2:
                       (binary_in==10'b1111001) ? 3:
                       (binary_in==10'b0110011) ? 4:
                       (binary_in=10'b10110111) ? 5:
                       (binary_in==10'b1011111) ? 6:
                       (binary_in==10'b1110000) ? 7:
                       (binary_in==10'b1111111) ? 8:
                       (binary_in==10'b1111011) ? 9: 0;

    $finish;
end

initial 
    begin
    #1 $monitor("IN=%d | OUT=%d | Enable=%b ", in, out);
  end
  
endmodule




endmodule