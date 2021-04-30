`timescale 1ms/1ps

module micro_tb();

reg [9:0] keypad;
reg clock;
reg startn;
reg stopn;
reg clearn;
reg door_closed;
wire mag_on;
wire [6:0] sec_ones_segs;
wire [6:0] sec_tens_segs;
wire [6:0] min_segs;

micro DUT(keypad,clock,startn,stopn,clearn,door_closed,mag_on,sec_ones_segs,sec_tens_segs,min_segs);

always #5 clock = ~clock;

initial begin
    $dumpfile("wave/micro.vcd");
    $dumpvars;
    //Adicionando 0:99 no microondas com a porta aberta
    keypad=10'b0000000001; // 0
    clock = 0;
    startn = 1;
    stopn = 1;
    clearn = 1;
    door_closed=0;
    #40;
    #10keypad=10'b0000000000; // soltando o botão
    #80 keypad=10'b1000000000; // 9
    #40;
    #10 keypad=10'b0000000000;
    #80 keypad=10'b1000000000; // 9
    #40;
    #10 keypad=10'b0000000000;
    #200 startn = 0; // inicia com a porta aberta(nada acontece)
    #100 door_closed = 1; //fecha a porta(Começa a contagem)
    #10000;
    #10 stopn = 0; // Para a contagem(mantém os valores)
    #10000 stopn = 1; // Retoma a contagem
    #40000 clearn = 0; // Limpa a contagem vigente



    
end

always @(min_segs, sec_ones_segs, sec_tens_segs)
begin
    if(startn==0 && door_closed && min_segs==0 && sec_ones_segs==0 && sec_tens_segs==0) $finish;
end

endmodule