module logicC (
    input wire startN , stopN , clearN, door_closed, timer_done, 
    output reg  S, R
);

    always @(startN, stopN, clearN, door_closed, timer_done) begin
        if(!clearN || !stopN || timer_done || !door_closed)
            begin
                S = 0;
                R = 1;
                //mag_on = 0
            end
        else if(!startN && door_closed)
            begin
                S = 1;
                R = 0;
                //mag_on = 1 
            end
        else 
            begin
                S = 0;
                R = 1;
            end
    end
endmodule