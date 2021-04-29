`timescale 1us/1ps
module  Magnetron_tb();
    reg startn, stopn, clearn, doorclosed, timerdone;
    wire mag_on;
    integer i;
    Magnetron DUT(.startn(startn),.stopn(stopn),.clearn(clearn),.doorclosed(doorclosed),.timerdone(timerdone),.mag_on(mag_on));

    initial begin
    
        $dumpfile("magnetron.vcd");
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