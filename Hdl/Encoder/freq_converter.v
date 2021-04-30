module freq_converter(input wire clk, output reg new_clk);

reg [7:0] cont;

initial begin
    cont = 0;
    new_clk = 0; 
end

always @(posedge clk)
begin
    if(cont==49)
    begin
        cont <= 0;
        new_clk <= ~new_clk;
    end
    else
    begin
        cont <= cont+1;
    end

end

endmodule