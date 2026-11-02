`timescale 1ns/1ps
module tb_wave_gain;
reg clk=0,rst=1,vs=1,de=0,pv=0;reg signed [15:0] pcm=0;reg [9:0] x=64;
wire [23:0] rgb;wire active;always #5 clk=~clk;
promax_audio_waveform dut(.clk(clk),.rst_n(!rst),.vsync(vs),.de(de),.rgb_in(24'h123456),.pixel_x(x),.enable(1'b1),.pcm_tap_valid(pv),.pcm_tap_left(pcm),.rgb_out(rgb),.waveform_active(active));
task tick(input integer n);repeat(n)@(negedge clk);endtask
task capture(input integer sample);
begin vs=1;pcm=sample;pv=1;tick(400);pv=0;vs=0;tick(3);vs=1;tick(2);end endtask
initial begin
 tick(4);rst=0;capture(4096);de=1;force dut.line_y=384;#1;
 if(rgb!=24'h20ff90)$fatal(1,"4x gain must give 16px displacement");
 de=0;release dut.line_y;capture(1024);if(dut.display_peak!=4096)$fatal(1,"peak hold missing");
 capture(32767);de=1;force dut.line_y=370;#1;if(rgb!=24'h20ff90)$fatal(1,"positive clip");de=0;release dut.line_y;
 capture(-32768);de=1;force dut.line_y=430;#1;if(rgb!=24'h20ff90)$fatal(1,"negative clip");de=0;release dut.line_y;
 capture(0);de=1;force dut.line_y=400;#1;if(rgb!=24'h20ff90 || dut.display_peak!=0)$fatal(1,"silence must return to center");
 $display("PASS 4x waveform gain, full signed range clamp, peak hold and silent center");$finish;
end
endmodule
