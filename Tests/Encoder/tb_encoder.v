`timescale 1ps/1ps

module tb_encoder(); 

reg  [9:0] y; 
wire [3:0] a;
reg enable;
wire loadn;
integer i;
 
prio_enco_9x4 U(.d_out(a), .d_in(y),.loadn(loadn), .enable(enable));

initial
    begin 
    $dumpfile("encoderWave.vcd");
	  $dumpvars(0,tb_encoder);
    //Carregando 3 no codificador
    enable = 1;
    i = 0;
    for(i=0;i<10;i = i+1)
    begin
      y = (1<<i);
      #10 enable = 0;
      #10 enable = 1;
    end
    end

    
    
endmodule