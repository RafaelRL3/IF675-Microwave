module latchsr(
    input wire S,R,
    output reg mag_on
);


    always @(S or R) begin
        if(R && !S)
            begin
                mag_on <= 0;
            end 
        else if(S && !R)
            begin
                mag_on<= 1;
            end
        else if(!S && !R)
            begin
                mag_on <= mag_on;
            end
    end
endmodule