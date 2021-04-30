`timescale 1ms/1ps
module controller_tb();

reg [9:0] keypad;
    reg enablen;
    reg clk=1;
    wire [3:0] out;
    wire loadn;
    wire pgt;

controller DUT(keypad,enablen,clk,out,loadn,pgt);


    //clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("controller.vcd");
        $dumpvars;
        //Adicionar clicar em 9
        keypad = 10'b1000000000;
        enablen = 1;
        #10 enablen=0;
        #100 keypad = 10'b0000000000;
        #100;
        //Adiciona 8
        keypad = 10'b0100000000;
        #100 keypad = 10'b0000000000;
        #100;
        //Adiciona 7
        keypad = 10'b0010000000;
        #100 keypad = 10'b0000000000;
        #100;
        //Adiciona 6
        keypad = 10'b0001000000;
        #100 keypad = 10'b0000000000;
        #100;
        //Adiciona 5
        keypad = 10'b0000100000;
        #100 keypad = 10'b0000000000;
        #100;
        //Adiciona 4
        keypad = 10'b0000010000;
        #100 keypad = 10'b0000000000;
        #100;
        //Adiciona 3
        keypad = 10'b0000001000;
        #100 keypad = 10'b0000000000;
        #100;
        //Adiciona 2
        keypad = 10'b0000000100;
        #100 keypad = 10'b0000000000;
        #100;
        //Adiciona 1
        keypad = 10'b0000000010;
        #100 keypad = 10'b0000000000;
        #100;
        //Adiciona 0
        keypad = 10'b0000000001;
        #100 keypad = 10'b0000000000;
        #100;
        $finish;


    end


endmodule