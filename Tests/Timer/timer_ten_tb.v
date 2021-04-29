`timescale 1ms/1ps

module timer_ten_tb();

reg clk=1;
reg loadn=1;
reg clrn=1;
reg en=1;
reg [3:0] in;
wire [3:0] out;
wire tc;
wire zero;

timer_ten DUT(in,loadn,clk,clrn,en,out,tc,zero);
parameter NUM = 8;

//CLOCK
always #5 clk = ~clk;    


always @(posedge clk && loadn==1)
begin
    //$display("out = %d || tc = %d || zero = %d", out,tc,zero); 
    if(out == NUM+1 && loadn == 1) $finish; 

end    

initial 
    begin
        $dumpfile("timer_ten.vcd");
        $dumpvars;
        //Carregar 8 no contador e rodar até o 9. 
        loadn = 0;
        in = NUM;
        #10 loadn = 1;


    end

endmodule