module  Magnetron(
    input wire startn, stopn, clearn, doorclosed, timerdone,
    output wire mag_on
);
    wire R, S;
    logicC DUT1(.startN(startn), .stopN(stopn), .clearN(clearn), .door_closed(doorclosed), .timer_done(timerdone), .S(S), .R(R));
    latchsr DUT2(S, R, mag_on);  
endmodule