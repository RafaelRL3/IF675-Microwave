module timer_ten(input wire [3:0] data, input wire loadn,input wire clk,input wire clrn, input wire en,
               output reg [3:0]  out, output wire tc, output reg zero );


assign tc = (en & ~out[0] & ~out[1] & ~out[2] & ~out[3]);

initial begin
    out = 0;
end

always @(posedge clk,negedge clrn)
    begin
        if(~clrn)
        begin
            out <= 0;
            zero <= 1;
        end
        else if(~loadn)
            begin
                out <= data;
                zero <= (data==0)? 1 : 0;
            end
        else if(en)
        begin
            if(out==0)
            begin
                out <= 9;
                zero <= 0;
            end
            else if(out==1)
            begin
                out <= out-1;
                zero <= 1;
            end
            else
            begin
                out <= out-1;
                zero <= 0;
            end
        end
    end

endmodule