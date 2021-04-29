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

timer_ten seconds(data, loadn, clock, clrn, en, sec_ones, sec_to_tens, zero1);
timer_six ten_secs(sec_ones, loadn, clock, clrn, sec_to_tens, sec_tens, tens_to_min, zero2);
timer_ten minutes(sec_tens, loadn, clock, clrn, tens_to_min, mins, useless, zero3);



always@(zero1,zero2,zero3)
    begin
        zero = zero1 & zero2 & zero3;
    end



endmodule

