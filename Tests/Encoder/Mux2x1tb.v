`timescale 1us/1ps
module  Mux2x1tb ();
    reg muxa, muxb;
    reg clk;
    integer i;
    Mux2x1 DUT(.a(muxa), .b(muxb), .Sel(clk));

    initial begin
        $dumpfile("Tests/Encoder/Mux2x1_Tb.vcd");
        $dumpvars;

        clk = 1;
        for(i = 0; i < 3005; i++) begin
            #5000 clk <= ~clk;
        end

        #10;
    end


    always @(muxa or muxb) 
        begin
            $display("a = %d || b = %d || Sel = %d ", muxa, muxb,clk);
        
    end


    initial begin
        muxa = 0;
        muxb = 0;

        #1000 muxa = 0;
        #1000 muxb = 0;

        #1000 muxa = 0;
        #1000 muxb = 1;

        #1000 muxa = 1;
        #1000 muxb = 0;

        #1000 muxa = 1;
        #1000 muxb = 1;

        #100;
        
    end

endmodule