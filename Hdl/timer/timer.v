module timer(input wire [3:0] data, input wire loadn, input wire clrn, 
             input wire clock, input wire en,
             output wire [3:0] sec_ones, output wire [3:0] sec_tens,
             output wire [3:0] mins, output reg zero);

wire sec_to_tens;
wire tens_to_min;
wire useless;
wire zero1;
wire zero2;
wire zero3;

timer_ten seconds(data, loadn,clock,clrn, en, sec_ones,sec_to_tens,zero1);
timer_six ten_secs(sec_ones, loadn, clock, clrn,sec_to_tens, sec_tens, tens_to_min, zero2 );
timer_ten minutes(sec_tens, loadn,clock, clrn, tens_to_min, mins, useless, zero3);

always@(posedge clock)
    begin
        zero = zero1 &zero2 & zero3;
    end



endmodule

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

module timer_ten(input wire [3:0] data, input wire loadn,input wire clk,input wire clrn, input wire en,
               output reg [3:0]  out, output reg tc, output reg zero );

always @(posedge clk, posedge clrn)
    begin
        if (~en);
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
                out <= 4'b1001;
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
                    out <=  (data==4'b1001)? 4'b1000:
                            (data==4'b1000)? 4'b0111:
                            (data==4'b0111)? 4'b0110:
                            (data==4'b0110)? 4'b0101:
                            (data==4'b0101)? 4'b0100:
                            (data==4'b0100)? 4'b0011:
                            (data==4'b0011)? 4'b0010:4'b0001;
                    tc <= 1'b0;
                    zero <= 1'b0;
                     
                end
        end
    end

endmodule