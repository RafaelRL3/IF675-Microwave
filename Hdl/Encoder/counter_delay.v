module counter_delay ( input wire clk, input wire clr, output reg out);

reg [3:0] counter=0;
reg pushed;


initial begin
    $dumpfile("counter_delay.vcd");
    $dumpvars;
    pushed = 0;
end

always @(posedge clr) begin

    counter = 0;
    pushed <= 1;
end

always@(clk)
begin
    if(pushed)
    begin
    if(counter<14) counter = counter+1;
    else pushed = 0;
    out = ((counter==8 |counter==9) & pushed) ? 1:0;
    end
end
    
endmodule