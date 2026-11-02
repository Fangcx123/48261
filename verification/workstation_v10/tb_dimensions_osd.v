`timescale 1ns/1ps
module tb_dimensions_osd;
reg clk=0,rst_n=0,vs=1,de=0;reg [11:0] w=0,h=0;
always #5 clk=~clk;
wire [23:0] rgb;wire active;
promax_text_overlay dut(.clk(clk),.rst_n(rst_n),.vsync(vs),.de(de),.rgb_in(24'h123456),
 .pixel_x(10'd8),.enable(1'b1),.subtitle_enable(1'b0),.subtitle_text(96'd0),.subtitle_length(6'd0),
 .brightness(8'd255),.volume(8'd96),.period_ms(32'd3000),.auto_enabled(1'b0),.source_scale_2x(1'b0),
 .source_width(w),.source_height(h),.rgb_out(rgb),.overlay_active(active));
reg [191:0] expected,actual;integer n,j;
task tick;begin @(negedge clk);end endtask
initial begin
 repeat(3)tick;rst_n=1;
 for(n=0;n<4;n=n+1)begin
 case(n)
 0:begin w=320;h=240;expected="IN:0320X0240 OUT:640X480";end
 1:begin w=640;h=480;expected="IN:0640X0480 OUT:640X480";end
 2:begin w=1024;h=768;expected="IN:1024X0768 OUT:640X480";end
 3:begin w=1920;h=1080;expected="IN:1920X1080 OUT:640X480";end
 endcase
 de=0;vs=0;repeat(3)tick;vs=1;tick;de=1;tick;
 actual=0;for(j=23;j<=46;j=j+1)actual={actual[183:0],dut.param_char(j)};
 if(actual!=expected)$fatal(1,"OSD dimensions got %s expected %s",actual,expected);
 if(dut.param_char(19)!="M" || dut.param_char(21)!="M")$fatal(1,"manual mode label");
 w=7;h=9;repeat(5)tick;
 actual=0;for(j=23;j<=46;j=j+1)actual={actual[183:0],dut.param_char(j)};
 if(actual!=expected)$fatal(1,"OSD dimensions tore inside a frame");
 end
 $display("PASS OSD actual source dimensions for four BMP sizes, fixed HDMI output, frame-held labels");$finish;
end
endmodule
