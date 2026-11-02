// Registered waveform + source/status marker; aligned RGB/VS/DE.
module audio_visualizer #(parameter ENABLE=1,RUNTIME_HIDE=0)(
 input clk,rst_n,vsync,de,input [23:0] rgb_in,input hide_overlay,
 input pcm_valid,input [15:0] pcm_left,input wav_active,underflow,audio_failed,
 output reg [23:0] rgb_out,output reg vs_out,de_out
);
 reg [9:0] x,y;reg de_q,vs_q;
 (* async_reg="true" *) reg [1:0] failed_sync;
 reg [2:0] frame_status;
 wire [23:0] waveform_rgb;
 promax_audio_waveform u_wave(.clk(clk),.rst_n(rst_n),.vsync(vsync),.de(de),
  .rgb_in(rgb_in),.pixel_x(x),.enable(ENABLE!=0 && !(RUNTIME_HIDE && hide_overlay)),.pcm_tap_valid(pcm_valid),
  .pcm_tap_left(pcm_left),.rgb_out(waveform_rgb),.waveform_active());
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin x<=0;y<=0;de_q<=0;vs_q<=1;failed_sync<=0;frame_status<=0;rgb_out<=0;vs_out<=1;de_out<=0;end
  else begin
   failed_sync<={failed_sync[0],audio_failed};
   de_q<=de;vs_q<=vsync;
   if(!de) x<=0;else x<=x+1'b1;
   if(!vsync) y<=0;else if(de_q && !de) y<=y+1'b1;
   if(vs_q && !vsync) frame_status<={failed_sync[1],underflow,wav_active};
   vs_out<=vsync;de_out<=de;
   if(!de) rgb_out<=0;
   else if(ENABLE && !(RUNTIME_HIDE && hide_overlay) && x>=48 && x<56 && y>=368 && y<376)
    rgb_out<=frame_status[2] ? 24'hff3030 : frame_status[1] ? 24'hff8020 :
             frame_status[0] ? 24'h20ff90 : 24'hffff40;
   else rgb_out<=waveform_rgb;
  end
 end
endmodule
