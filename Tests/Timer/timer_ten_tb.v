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

timer_ten DUT(in,loadn,clk,clrn,en,out,tc,zero);


always
begin
    #10 clk = ~clk;    
end

always @(posedge clk && loadn==1)
begin
    $display("out = %d || tc = %d || zero = %d", out,tc,zero);    
end    

initial 
    begin
        in = 9;
        while(in>=0)
        begin
        if(in==0) $finish;
        $display("TESTE IN = %d", in);
        loadn = 0;
        en = 1;
        in <= in - 1;
        #20 loadn = 1;
        #(10*10*2);
        end

    end
endmodule