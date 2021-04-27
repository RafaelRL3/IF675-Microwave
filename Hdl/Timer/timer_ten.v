module timer_ten(input wire [3:0] data, input wire loadn,input wire clk,input wire clrn, input wire en,
               output reg [3:0]  out, output reg tc, output reg zero );

always @(negedge clrn)
begin
    if(~clrn)
    begin
        out = 0;
        tc = 0; 
        zero = 1;
    end
end

always @(posedge clk)
    begin
        
        if(en)
        begin
            if(~loadn)
            begin
                out <= data;
                tc<= (data==0)? 1 : 0;
                zero <= (data==0)? 1 : 0;
            end
            else 
            begin
                if(out==0)
                begin
                    out <= 9;
                    tc <= 0;
                    zero <= 0;
                end
                else if(out==1)
                begin
                    out <= out-1;
                    tc <= 1;
                    zero <= 1;
                end
                else
                begin
                    out <= out-1;
                    tc <= 0;
                    zero <= 0;
                end
            end
        end
    end

endmodule