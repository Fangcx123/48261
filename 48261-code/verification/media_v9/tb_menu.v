`timescale 1ns/1ps
module tb_menu;
reg clk=0,rst=1,vs=1,de=0;always #20 clk=~clk;
wire vo,do_;wire [23:0] rgb;reg [1:0] mode=2,field=1;
media_menu_overlay dut(clk,rst,vs,de,24'h123456,mode,field,8'hff,8'h80,8'h60,6'd30,vo,do_,rgb);
reg [34:0] glyphs[0:15];reg [34:0] labels[0:3];reg [7:0] values[0:3];
integer x,y,n=0,ox,oy,row,gx,gy,nib,fd,f;reg ink;reg [23:0] expected;
always @(negedge clk)if(do_)begin
 ox=n%640;oy=n/640;expected=24'h123456;
 if(mode==2 && ox>=16 && ox<80 && oy>=272 && oy<336)begin
  row=(oy-272)/16;gy=((oy-272)%16)/2;ink=0;
  if(gy<7)begin
   if(ox<26)begin gx=(ox-16)/2;ink=labels[row][34-gy*5-gx];end
   if(ox>=40&&ox<50)begin gx=(ox-40)/2;nib=values[row]/16;ink=glyphs[nib][34-gy*5-gx];end
   if(ox>=52&&ox<62)begin gx=(ox-52)/2;nib=values[row]%16;ink=glyphs[nib][34-gy*5-gx];end
  end
  expected=ink?(row==field?24'hffff00:24'hffffff):24'h101018;
 end
 if(rgb!==expected)$fatal(1,"menu glyph %d,%d got=%h want=%h",ox,oy,rgb,expected);
 if(f==0)$fwrite(fd,"%c%c%c",rgb[23:16],rgb[15:8],rgb[7:0]);
 n=n+1;
end
initial begin
 // Independent font rows used in this menu: F,F / 8,0 / 6,0 / 1,E.
 glyphs[0]=35'b01110_10001_10011_10101_11001_10001_01110;
 glyphs[1]=35'b00100_01100_00100_00100_00100_00100_01110;
 glyphs[6]=35'b01110_10000_10000_11110_10001_10001_01110;
 glyphs[8]=35'b01110_10001_10001_01110_10001_10001_01110;
 glyphs[14]=35'b11111_10000_10000_11110_10000_10000_11111;
 glyphs[15]=35'b11111_10000_10000_11110_10000_10000_10000;
 labels[0]=35'b11110_10001_10001_11110_10001_10001_11110;
 labels[1]=35'b01111_10000_10000_10000_10000_10000_01111;
 labels[2]=35'b10001_10001_10001_10001_10001_01010_00100;
 labels[3]=35'b11110_10001_10001_11110_10000_10000_10000;
 values[0]=255;values[1]=128;values[2]=96;values[3]=30;
 fd=$fopen("verification/media_v9/menu.ppm","wb");$fwrite(fd,"P6\n640 480\n255\n");
 repeat(3)@(negedge clk);rst=0;
 for(f=0;f<2;f=f+1)begin
  n=0;mode=f==0?2:0;vs=0;repeat(4)@(negedge clk);vs=1;repeat(4)@(negedge clk);
  for(y=0;y<480;y=y+1)begin
   for(x=0;x<640;x=x+1)begin de=1;@(negedge clk);end
   de=0;repeat(10)@(negedge clk);
  end
  if(n!=307200)$fatal(1,"menu count");
 end
 $fclose(fd);$display("PASS menu: full-frame glyph/hex/highlight/RGB/DE alignment and exact bypass");$finish;
end
endmodule
