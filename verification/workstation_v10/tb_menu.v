`timescale 1ns/1ps
module tb_menu;
reg clk=0,rst=1,vs=1,de=0;always #5 clk=~clk;
wire vo,do_;wire [23:0] rgb;reg [1:0] mode=2;reg [2:0] field=2;
media_menu_overlay dut(clk,rst,vs,de,24'h123456,mode,field,1'b0,1'b1,8'hff,8'h80,8'h60,6'd3,vo,do_,rgb);
integer x,y,n=0,ox,oy,fd,f,ink=0;reg checking=0;
always @(negedge clk)if(checking && do_)begin
 ox=n%640;oy=n/640;
 if(mode==2 && ox>=64 && ox<576 && oy>=40 && oy<440)begin
  if(rgb===24'h123456 || (^rgb)===1'bx)$fatal(1,"menu hole/unknown %d %d",ox,oy);
  if(ox==64 || ox==575 || oy==40 || oy==439)if(rgb!=24'h408eaa)$fatal(1,"panel bounds");
  if(rgb==24'he8f1fa)ink=ink+1;
  if(ox==100 && oy==220 && rgb!=24'h205d80)$fatal(1,"selected row missing");
 end else if(rgb!==24'h123456)$fatal(1,"outside centered panel changed %d %d",ox,oy);
 if(f==0)$fwrite(fd,"%c%c%c",rgb[23:16],rgb[15:8],rgb[7:0]);n=n+1;
end
initial begin
 fd=$fopen("verification/workstation_v10/menu.ppm","wb");$fwrite(fd,"P6\n640 480\n255\n");
 repeat(5)@(negedge clk);rst=0;
 for(f=0;f<2;f=f+1)begin
 mode=f==0 ? 2:0;vs=0;repeat(8)@(negedge clk);vs=1;repeat(8)@(negedge clk);n=0;checking=1;
 for(y=0;y<480;y=y+1)begin
 for(x=0;x<640;x=x+1)begin de=1;@(negedge clk);end
 de=0;repeat(10)@(negedge clk);end
 repeat(8)@(negedge clk);checking=0;if(n!=307200)$fatal(1,"DE count");end
 if(ink<500)$fatal(1,"missing labels");$fclose(fd);
 $display("PASS centered Chinese menu, bounds, highlight, glyphs, exact bypass and DE alignment");$finish;
end
endmodule
