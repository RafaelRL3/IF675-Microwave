module Mux2x1 (
    input wire Sel, 
    input wire  a,
    input wire  b,
    output wire out
);
    assign out = (Sel ==0 ?a:b);
endmodule