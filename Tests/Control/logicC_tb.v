`timescale 1ns/1ps
module  logicC_tb();
    reg startn, stopn, clearn, doorclosed, timerdone;
    wire S, R;
    integer i;
    logicC DUT(.start(startn),.stop(stopn),.clear(clearn),.door_closed(doorclosed),.timer_done(timerdone),.S(S),.R(R));

    initial begin
    
        $dumpfile("logicC_tb.vcd");
        $dumpvars();
        for(i=0 ; i<3000; i++)begin
            #10startn = (i%2);
            stopn = $urandom%2;
            clearn = $urandom%2;
            doorclosed =$urandom%2;
            timerdone = $urandom%2;
        end    
    end
endmodule