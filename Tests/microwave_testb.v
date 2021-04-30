`timescale 1ms/1ps

module microwave_testb();

  reg [9:0] teclado;
reg clk;
reg comecan;
reg paren;
reg limpan;
reg portafechada;
wire m_on;
  wire [6:0] sec_one_sec;
  wire [6:0] sec_ten_sec;
  wire [6:0] m_sec;

  micro DUT(teclado,clk,comecan,paren,limpan,portafechada,m_on,sec_one_sec,sec_ten_sec,m_sec);

always #5 clk = ~clk;

initial begin
    $dumpfile("wave/micro.vcd");
    $dumpvars;
    teclado=10'b0000000001;
    clk = 0;
    comecan = 1;
    paren = 1;
    limpan = 1;
    portafechada=0;
    #40;
    #10 teclado=10'b0000000000; 
    #80 teclado=10'b1000000000; 
    #40;
    #10 teclado=10'b0000000000;
    #80 teclado=10'b1000000000; 
    #40;
    #10 teclado=10'b0000000000;
    #200 comecan = 0; 
    #100 portafechada = 1;
    #10000;
    #10 paren = 0; 
    #10000 paren = 1; 
    #40000 limpan = 0; 



    
end

  always @(m_sec, sec_one_sec, sec_ten_sec)
begin
  if(comecan==0 && door_closed && m_sec==0 && sec_one_sec==0 && sec_ten_sec==0) $finish;
end

endmodule
