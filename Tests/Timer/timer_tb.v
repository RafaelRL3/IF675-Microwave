`timescale 1ms/1ps

module timer_tb();

reg [3:0] in = 4'b0111;
wire [3:0] out;
reg loadn;
reg clrn=1'b1; 
reg clock=1'b0;
reg en = 1'b1;
wire [3:0] sec_ones;
wire [3:0] sec_tens;
wire [3:0] mins;
wire zero;

timer DUT(in,loadn,clrn,clock, en,sec_ones,sec_tens,mins, zero);

always #5 clock = ~clock;


initial begin
    $dumpfile("timer.vcd");
    $dumpvars;
    //Carregar 1:99 no contador zera a contagem quando chega em 50 segundos (usando o clear) e encerra o processo
    //Testa a funcionalidade do do contador, do load, do clear e de carregar um número entre 60-99
    loadn = 0;
    in = 1;
    #10 in = 9;
    #10 in = 9;
    #10 loadn=1;
    

end

always @ (zero,sec_ones,sec_tens,mins) begin
    if(sec_ones==0 && sec_tens ==5 && mins == 0) clrn <= 0;
    if(loadn ==1 && zero==1) $finish;
end

   


endmodule