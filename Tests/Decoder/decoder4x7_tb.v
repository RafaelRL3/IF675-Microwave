`timescale 1ms/1ps
module decoder4x7_tb();

reg [3:0] seg, tens, mins;
wire [6:0] seg_segs, tens_segs, min_segs;

decoder4x7 DUT(seg, tens,mins, seg_segs, tens_segs, min_segs);

initial begin
    $dumpfile("decoder4x7.vcd");
    $dumpvars;
    seg = 5;
    tens = 4;
    mins = 1;
    #10;
    seg = 0;
    tens = 4;
    mins = 1;
    #10;
    seg = 0;
    tens = 4;
    mins = 0;
    #10;
    seg = 5;
    tens = 0;
    mins = 0;
    #100 $finish;

end

endmodule

