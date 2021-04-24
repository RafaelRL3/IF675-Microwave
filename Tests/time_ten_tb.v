`timescale 1ms/1ps

module timer_ten_tb();

reg clk=1;
reg loadn=1;
reg clrn=1;
reg en=0;
reg [3:0] in;
wire [3:0] out;
wire tc;
wire zero;
integer i;

timer_ten DUT(in,loadn,clk,clrn,en,out,tc,zero);

//Clock
    always
    begin:clock_loop
        #10 clk = ~clk;
    end

    

initial 
    begin
    //Carregando 7 no contador
    in = 7;
    loadn = 0;
    en=1;
    #30 loadn = 1;
    #1000 disable clock_loop;
    end



always @(clk)
begin
    $display("Saidas:\noutput = %d | tc = %d | zero = %d",out, tc,zero);
end

endmodule