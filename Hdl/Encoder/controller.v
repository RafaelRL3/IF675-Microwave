module controller (
    input wire [9:0] keypad,
    input wire enablen,
    input wire clock,
    output wire [3:0] out,
    output wire loadn,
    output wire pgt
);

wire w1; //fio interno do delay para o mux
wire w2; //fio interno do conversor de frequência para o MUX

prio_enco_9x4 encoder(.d_out(out), .d_in(keypad), .enable(enablen), .loadn(loadn));
counter_delay delay(clock, loadn,w1);
freq_converter converter(clock,w2);
mux2x1 mux(enablen,w1,w2,pgt);

endmodule