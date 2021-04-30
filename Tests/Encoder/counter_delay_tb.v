`timescale 1ms/1ps
module counter_delay_tb ();

reg clk;
reg clr=0;
wire out;

counter_delay DUT(clk,clr,out);

always #5 clk = ~clk;

always #200 clr = ~clr;

initial begin
    $dumpfile("counter_delay.vcd");
    $dumpvars;
    clk = 0;
    clr =0;
    #1000 $finish;
end

always @(posedge clk) begin
    $display("clk = %d | clr = %d | out = %d", clk, clr, out);
end

endmodule