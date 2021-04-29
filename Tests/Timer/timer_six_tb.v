`timescale 1ms/1ps

module timer_six_tb();

reg clk=1;
reg loadn=1;
reg clrn=1;
reg en=1;
reg [3:0] in;
wire [3:0] out;
wire tc;
wire zero;

timer_six DUT(in,loadn,clk,clrn,en,out,tc,zero);
parameter NUM = 3;

always
begin
    #5 clk = ~clk;    
end

always @(posedge clk)
begin
    if(out==NUM+1 && loadn==1) $finish; 
end    

initial 
    begin
        $dumpfile("timer_six.vcd");
        $dumpvars;
        in = NUM;
        loadn= 0;
        #10 loadn = 1;

    end
endmodule