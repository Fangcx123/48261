`timescale 1ns/1ps
module tb_menu_digits;
reg [5:0] period=0;
media_menu_overlay dut(.clk(1'b0),.rst(1'b0),.vs(1'b1),.de(1'b0),.rgb(24'd0),
 .mode(2'd2),.field(3'd0),.audio_busy(1'b0),.audio_available(1'b1),
 .brightness(8'd255),.contrast(8'd128),.volume(8'd96),.period_s(period));
integer v,p,percent,want;
initial begin
 for(v=0;v<256;v=v+1)begin
  case(v)0:percent=0;64:percent=25;96:percent=38;128:percent=50;192:percent=75;default:percent=100;endcase
  for(p=0;p<3;p=p+1)begin
   want=640;
   case(p)
    0:if(percent>=100)want=641+percent/100;
    1:if(percent>=10)want=641+(percent/10)%10;
    2:want=641+percent%10;
   endcase
   if(dut.percent_char(v,p)!==want[9:0])$fatal(1,"percent decoder v=%d slot=%d",v,p);
  end
 end
 for(v=0;v<64;v=v+1)begin
  period=v;#1;
  if(dut.tens!==v/10 || dut.ones!==v%10)$fatal(1,"period decoder %d",v);
 end
 $display("PASS menu digits: all 256 percentage inputs and all 64 period values");$finish;
end
endmodule
