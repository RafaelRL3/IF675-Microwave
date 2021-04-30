`timescale 1ms/1ps
module freq_converter_tb ();

reg clk;
wire new_clk;

freq_converter DUT (clk,new_clk);

always #5 clk  = ~clk; // A cada 10ms o clock executa um período.

initial begin
    $dumpfile("freq_converter.vcd");
    $dumpvars;
    clk=0;
    #2000 $finish;
end

always @(clk) begin
    $display("time = %d || clk = %d, new_clk = %d", $time,clk ,new_clk);
end

    
endmodule