module timer_six(input wire [3:0] data, input wire loadn,input wire clk,input wire clrn, input wire en,
               output reg [3:0]  out, output reg tc, output reg zero );

always @(posedge clk, posedge clrn)
    begin
        if(~en);
        else if(clrn)
        begin
            out <= 4'b0000;
            tc <= 1'b0; 
            zero <= 1'b1;
        end
        else
        begin
            if(data==4'b0000)
            begin
                out <= 4'b0101;
                tc <= 1'b1;
                zero <= 1'b0;
            end
            else if(data==4'b0001)
            begin
                out <= 4'b0000;
                tc <= 1'b0;
                zero <= 1'b1;
            end
            else
                begin
                    out <=  (data==4'b0101)? 4'b0100:
                            (data==4'b0100)? 4'b0011:
                            (data==4'b0011)? 4'b0010:4'b0001;
                    tc <= 1'b0;
                    zero <= 1'b0;
                     
                end
        end
    end

endmodule