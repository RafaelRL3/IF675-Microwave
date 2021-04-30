module counter_delay ( input wire clk, input wire clr, output reg out);

reg [2:0] counter=0;



always @(posedge clk) begin
    if(clr) begin
        out <= 0;
        counter<=0;
    end
    else
    begin
        if(counter<7) counter <= counter+1;
        out <= (counter==4) ? 1:0;
    end
    
end

    
endmodule