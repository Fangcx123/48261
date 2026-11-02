// One source scanline, a sector elastic FIFO and integer DDA. Output is
// bottom-up RGB888 at <=25 Mpixel/s for the existing vertically-flipped writer.
// Top-left output(x,y) = source(floor(x*W/640),floor(y*H/480)).
module bmp_nearest_scaler #(parameter ENABLE_BACKPRESSURE=0)(
 input clk,rst,start,input [11:0] width,height,input [1:0] padding,
 input byte_valid,input [7:0] byte_data,output sector_allow,
 input pixel_ready,output reg pixel_valid,output reg [23:0] pixel,output reg done,overflow
);
 reg [7:0] fifo[0:1023]; /* fehdl force_ram=1, ram_style="bram" */
 reg [7:0] fifo_q;reg [9:0] wp,rp;reg [10:0] used;
 reg [23:0] line[0:2047]; /* fehdl force_ram=1, ram_style="bram" */
 reg [2:0] state;localparam IDLE=0,INIT=1,LOAD=2,READ=3,EMIT=4,FIN=5,BYTE=6;
 reg [11:0] w,h,wrem,hrem,wq,hq;
 reg [11:0] source_row,target_source,col,sx;
 reg [9:0] dx,dy,xphase,yphase;
 reg [1:0] phase,padleft,pace;
 reg [23:0] bgr;
 reg [23:0] line_q;
 wire pop=(state==BYTE && used!=0);
 assign sector_allow=(used<=11'd480); // reserve an entire unpausable sector
 wire [10:0] xsum={1'b0,xphase}+wrem;
 wire [10:0] ysum={1'b0,yphase}+hrem;
 always @(posedge clk) begin
  line_q<=line[sx[10:0]];fifo_q<=fifo[rp];
  if(byte_valid) fifo[wp]<=byte_data;
 end
 always @(posedge clk) if(pop && phase==2 && padleft==0) line[col[10:0]]<={fifo_q,bgr[15:0]};
 always @(posedge clk or posedge rst) begin
  if(rst) begin
   state<=IDLE;wp<=0;rp<=0;used<=0;done<=0;overflow<=0;pixel_valid<=0;pixel<=0;
   w<=0;h<=0;wrem<=0;hrem<=0;wq<=0;hq<=0;source_row<=0;target_source<=0;
   col<=0;sx<=0;dx<=0;dy<=0;xphase<=0;yphase<=0;phase<=0;padleft<=0;pace<=0;bgr<=0;
  end else begin
   pixel_valid<=0;
   if(start) begin
    state<=INIT;w<=width;h<=height;wrem<=width;hrem<=height;wq<=0;hq<=0;
    wp<=0;rp<=0;used<=0;done<=0;overflow<=0;source_row<=0;col<=0;phase<=0;padleft<=0;
    sx<=0;dx<=0;dy<=0;xphase<=0;pace<=0;
   end else begin
    if(byte_valid) begin wp<=wp+1'b1;if(used==1024) overflow<=1;end
    if(pop) rp<=rp+1'b1;
    case({byte_valid,pop}) 2'b10:used<=used+1'b1;2'b01:used<=used-1'b1;default:;endcase
    case(state)
     INIT:begin
      if(wrem>=640) begin wrem<=wrem-640;wq<=wq+1'b1;end
      if(hrem>=480) begin hrem<=hrem-480;hq<=hq+1'b1;end
      if(wrem<640 && hrem<480) begin
       target_source<=hrem==0 ? hq-1'b1 : hq;
       yphase<=hrem==0 ? 10'd479 : hrem-1'b1;state<=LOAD;
      end
     end
     LOAD:if(used!=0) state<=BYTE;
     BYTE:if(pop) begin
      state<=LOAD;
      if(padleft!=0) begin
       padleft<=padleft-1'b1;
       if(padleft==1) begin
        if(source_row==target_source) state<=READ;
        else source_row<=source_row+1'b1;
       end
      end else case(phase)
       0:begin bgr[7:0]<=fifo_q;phase<=1;end
       1:begin bgr[15:8]<=fifo_q;phase<=2;end
       2:begin
        phase<=0;
        if(col==w-1'b1) begin
         col<=0;padleft<=padding;
         if(padding==0) begin
          if(source_row==target_source) state<=READ;
          else source_row<=source_row+1'b1;
         end
        end else col<=col+1'b1;
       end
      endcase
     end
     READ:begin state<=EMIT;pace<=0;end
     EMIT:begin
      if(pace!=2) pace<=pace+1'b1;
      if(pace==2 && (!ENABLE_BACKPRESSURE || pixel_ready)) begin
       pixel<=line_q;pixel_valid<=1;
       if(dx==639) begin
        dx<=0;sx<=0;xphase<=0;
        if(dy==479) state<=FIN;
        else begin
         dy<=dy+1'b1;
         target_source<=target_source+hq+(ysum>=480);
         yphase<=ysum>=480 ? ysum-480 : ysum;
         if(hq==0 && ysum<480) state<=READ;
         else begin source_row<=source_row+1'b1;state<=LOAD;end
        end
       end else begin
        dx<=dx+1'b1;sx<=sx+wq+(xsum>=640);
        xphase<=xsum>=640 ? xsum-640 : xsum;state<=READ;
       end
      end
     end
     FIN:begin
      // Drain unselected source rows at the bottom-up stream's upper edge.
      // They do not contribute output but must not block the file streamer.
      if(used!=0) begin rp<=rp+1'b1;if(!byte_valid) used<=used-1'b1;else used<=used;end
      done<=1;
     end
     default:;
    endcase
   end
  end
 end
endmodule
