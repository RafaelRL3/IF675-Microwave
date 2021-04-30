all: 
	iverilog Hdl/micro.v -o bin/micro Hdl/Encoder/controller.v  Hdl/Control/Magnetron.v  Hdl/Timer/timer.v  Hdl/Decoder/decoder4x7.v  Hdl/Timer/timer_six.v Hdl/Timer/timer_ten.v	Hdl/Control/latchsr.v Hdl/Control/logicC.v Hdl/Encoder/prio_enco_9x4.v Hdl/Encoder/counter_delay.v Hdl/Encoder/freq_converter.v Hdl/Encoder/mux2x1.v Tests/micro_tb.v
	vvp bin/micro