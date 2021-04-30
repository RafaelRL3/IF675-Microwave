module micro(
    input wire [9:0] keypad,
    input wire clock,
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    output wire mag_on,
    output wire [6:0] sec_ones_segs,
    output wire [6:0] sec_tens_segs,
    output wire [6:0] min_segs
);

wire magnetron;
wire [3:0]d_to_data;
wire loadn;
wire pgt_to_timer_clock;
wire [3:0] sec_ones;
wire [3:0] sec_tens;
wire [3:0] mins;
wire timer_done;

controller controlador(keypad,magnetron, clock,d_to_data,loadn,pgt_to_timer_clock);
timer time_device(d_to_data,loadn,clearn,pgt_to_timer_clock,magnetron,sec_ones,sec_tens,mins,timer_done);
decoder4x7 decoder_device(sec_ones,sec_tens,mins,sec_ones_segs,sec_tens_segs,min_segs);
Magnetron magnetron_device(startn,stopn,clearn,door_closed, timer_done,magnetron);

assign mag_on = magnetron;    


endmodule