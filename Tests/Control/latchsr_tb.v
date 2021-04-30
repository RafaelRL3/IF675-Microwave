`timescale 1ns/1ps
module latchsr_tb();
    integer i;
	reg R, S;
	wire magon;

	latchsr DUT(.R(R), .S(S), .mag_on(magon));
	
    initial
		begin
		
			$dumpfile("latchsr_tb.vcd");
			$dumpvars();
            for(i = 0; i<30000; i++)begin
               #10 S = i%2;
                R = 1-S; 
            end
		end

endmodule