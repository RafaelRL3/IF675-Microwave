`timescale 1ps/1ps

module tb_encoder(); 

reg  [9:0] y; 
wire [3:0] a;
reg enable;
wire loadn;
 
prio_enco_9x4 U(.d_out(a), .d_in(y),.loadn(loadn), .enable(enable));

integer i;

initial
    begin 
    $dumpfile("encoderWave.vcd");
	$dumpvars(0,tb_encoder);

    enable = 0;
    y = 0;

    #10 enable = ~enable;
     for(i = 0; i <= 9; i++) begin
            #10 y = i;
     end
    
    $finish;
    end 
    

  initial 
    begin
    #1 $monitor("Y=%d | A=%d | Enable=%b | loadn=%b", y, a, enable, loadn);
  end
endmodule