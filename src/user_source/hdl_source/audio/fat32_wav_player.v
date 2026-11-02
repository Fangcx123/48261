// Read-only one-shot AUDIO.WAV. Replay uses a session token/empty ACK;
// FIFO pointers are never reset on only one side between sessions.
module fat32_wav_player #(parameter CLOCK_HZ=100000000,parameter FIFO_AW=12)(
 input wr_clk,wr_rst_n,sd_grant,
 output sd_read,output [31:0] sd_addr,input [7:0] sd_data,input sd_valid,sd_end,
 input rd_clk,rd_rst_n,sample_tick,input [15:0] tone_left,tone_right,
 output reg sample_valid,output reg [15:0] sample_left,sample_right,
 output reg sample_is_wav,
 output wav_active,output reg underflow,output [7:0] audio_error,
 input play_enable,input replay_toggle,
 output audio_busy,output reg audio_available,
 output speech_busy,output reg [31:0] played_samples,output reg play_done_toggle,output preparing
);
 localparam IDLE=0,SCAN=1,PLAY=2,STOP=3,PREP=4,DRAIN=5;
 reg [2:0] state;
 reg scan_start,file_start,good,completed;
 reg session_token,session_ack,writer_busy,replay_seen;
 reg [4:0] settle;
 (* async_reg="true" *) reg [2:0] ack_sync;
 reg [7:0] error;
 wire sc_done,sc_req,fl_req,fl_done,fl_valid,fl_busy,fmt_ok,pcm_valid,data_done;
 wire [7:0] sc_error,fl_error,pcm_error,fl_byte,spc;
 wire [3:0] found;
 wire [31:0] cluster,size,fat_lba,data_lba,max_cluster,sc_lba,fl_lba,pcm_data;
 wire sec_busy,sec_valid,sec_done;wire [7:0] sec_byte,sec_error;wire [8:0] sec_index;
 wire [FIFO_AW:0] wr_level,rd_level;
 wire full,empty;wire [31:0] queued;
 wire scanning=(state==SCAN),playing=(state==PLAY);
 assign audio_error=error;
 sd_sector_adapter #(.TIMEOUT_CYCLES(CLOCK_HZ)) u_sector(
  .clk(wr_clk),.rst(!wr_rst_n),.sector_req(sd_grant && (scanning ? sc_req : playing && fl_req)),
  .sector_lba(scanning ? sc_lba : fl_lba),.sector_busy(sec_busy),.sector_valid(sec_valid),
  .sector_byte(sec_byte),.sector_byte_index(sec_index),.sector_done(sec_done),.sector_error(sec_error),
  .sd_sec_read(sd_read),.sd_sec_read_addr(sd_addr),.sd_sec_read_data(sd_data),
  .sd_sec_read_data_valid(sd_valid),.sd_sec_read_end(sd_end));
 fat32_volume_scanner #(.AUDIO_FILE(1)) u_volume(
  .clk(wr_clk),.rst_n(wr_rst_n),.scan_start(scan_start),.scan_busy(),.scan_done(sc_done),.fs_error(sc_error),
  .partition_lba(),.sectors_per_cluster(spc),.fat_start_lba(fat_lba),.data_start_lba(data_lba),.max_cluster(max_cluster),
  .resource_valid(found),.resource0_cluster(cluster),.resource0_size(size),
  .resource1_cluster(),.resource2_cluster(),.resource3_cluster(),.resource1_size(),.resource2_size(),.resource3_size(),
  .sector_req(sc_req),.sector_lba(sc_lba),.sector_busy(sec_busy),.sector_valid(sec_valid && scanning),
  .sector_byte(sec_byte),.sector_byte_index(sec_index),.sector_done(sec_done && scanning),.sector_error(sec_error));
 fat32_file_streamer #(.THROTTLE(1)) u_file(
  .clk(wr_clk),.rst_n(wr_rst_n),.file_start(file_start),.first_cluster(cluster),.file_size(size),
  .sectors_per_cluster(spc),.fat_start_lba(fat_lba),.data_start_lba(data_lba),.max_cluster(max_cluster),
  .file_busy(fl_busy),.file_done(fl_done),.file_valid(fl_valid),.file_byte(fl_byte),.file_byte_offset(),.fs_error(fl_error),
  .sector_req(fl_req),.sector_lba(fl_lba),.sector_busy(sec_busy || !playing),
  .sector_valid(sec_valid && playing),.sector_byte(sec_byte),.sector_byte_index(sec_index),
  .sector_done(sec_done && playing),.sector_error(sec_error),
  // At most 256 mono frames per sector, plus registered byte/PCM pipeline.
  .sector_allow(wr_level < (1<<FIFO_AW)-260));
 wav_pcm_decoder u_decode(.clk(wr_clk),.rst_n(wr_rst_n),.start(file_start),.file_size(size),
  .byte_valid(fl_valid && playing),.byte_data(fl_byte),.file_done(fl_done),
  .pcm_valid(pcm_valid),.pcm_data(pcm_data),.format_valid(fmt_ok),.data_done(data_done),.error(pcm_error));
 always @(posedge wr_clk or negedge wr_rst_n) begin
  if(!wr_rst_n) begin
   state<=IDLE;scan_start<=0;file_start<=0;good<=0;completed<=0;error<=0;
   session_token<=0;writer_busy<=1;audio_available<=0;replay_seen<=0;settle<=0;ack_sync<=0;
  end
  else begin
   scan_start<=0;file_start<=0;
   ack_sync<={ack_sync[1:0],session_ack};
   // Always consume requests, including busy requests: there is no queue.
   replay_seen<=replay_toggle;
   case(state)
    IDLE:if(sd_grant) begin scan_start<=1;state<=SCAN;end
    SCAN:if(sc_done) begin
     if(sc_error==8'h22 || (sc_error==0 && !found[0])) begin state<=STOP;writer_busy<=0;end
     else if(sc_error!=0) begin state<=STOP;error<=sc_error;writer_busy<=0;end
     else begin state<=PREP;settle<=0;audio_available<=1;end
    end
    PREP:begin
     if(settle==15) begin state<=PLAY;session_token<=~session_token;file_start<=1;end
     else settle<=settle+1'b1;
    end
    PLAY:begin
     if(fmt_ok) good<=1;
     if(pcm_error!=0 || (pcm_valid && full)) begin
      state<=DRAIN;good<=0;audio_available<=0;error<=pcm_error!=0 ? pcm_error : 8'h36;
     end else if(fl_done) begin
      state<=DRAIN;
      if(fl_error!=0 || !data_done) begin good<=0;audio_available<=0;error<=fl_error!=0 ? fl_error : 8'h35;end
      else completed<=1;
     end
    end
    DRAIN:if(ack_sync[2]==session_token && !sec_busy) begin writer_busy<=0;state<=STOP;end
    STOP:if(replay_seen!=replay_toggle && audio_available && !writer_busy && !fl_busy && !sec_busy) begin
     writer_busy<=1;good<=0;completed<=0;settle<=0;state<=PREP;
    end
    default:;
   endcase
  end
 end
 (* async_reg="true" *) reg [1:0] good_sync,complete_sync,failed_sync,data_sync,busy_sync;
 (* async_reg="true" *) reg [2:0] token_sync;
 reg started,begun,session_active,token_seen;
 reg [3:0] empty_guard;
 wire can_start=(rd_level>=256) || (complete_sync[1] && !empty);
 wire consume=sample_tick && play_enable && session_active && good_sync[1] && !failed_sync[1] && !empty && (started || can_start);
 wire discard=session_active && failed_sync[1] && !empty;
 assign audio_busy=writer_busy;
 assign speech_busy=busy_sync[1] || session_active;
 assign preparing=session_active && good_sync[1] && !failed_sync[1] && !begun;
 assign wav_active=session_active && begun && good_sync[1] && !failed_sync[1];
 pcm_async_fifo #(.AW(FIFO_AW)) u_fifo(
  .wr_clk(wr_clk),.wr_rst_n(wr_rst_n),.wr_en(pcm_valid && playing && error==0),.wr_data(pcm_data),
  .full(full),.wr_level(wr_level),.rd_clk(rd_clk),.rd_rst_n(rd_rst_n),.rd_en(consume || discard),
  .rd_data(queued),.empty(empty),.rd_level(rd_level));
 always @(posedge rd_clk or negedge rd_rst_n) begin
  if(!rd_rst_n) begin
   good_sync<=0;complete_sync<=0;failed_sync<=0;data_sync<=0;busy_sync<=3;
   token_sync<=0;token_seen<=0;session_active<=0;session_ack<=0;empty_guard<=0;
   started<=0;begun<=0;underflow<=0;played_samples<=0;play_done_toggle<=0;
   sample_valid<=0;sample_left<=0;sample_right<=0;sample_is_wav<=0;
  end else begin
   good_sync<={good_sync[0],good};complete_sync<={complete_sync[0],completed};failed_sync<={failed_sync[0],error!=0};
   data_sync<={data_sync[0],data_done};busy_sync<={busy_sync[0],writer_busy};
   token_sync<={token_sync[1:0],session_token};
   if(token_seen!=token_sync[2]) begin
    token_seen<=token_sync[2];session_active<=1;started<=0;begun<=0;underflow<=0;played_samples<=0;empty_guard<=0;
   end else if(session_active) begin
    // Wait beyond the last FIFO word and downstream two-stage PCM output.
    if(empty && (complete_sync[1] || failed_sync[1])) begin
     if(empty_guard==8) begin
      if(begun && complete_sync[1] && !failed_sync[1]) play_done_toggle<=~play_done_toggle;
      session_active<=0;session_ack<=token_seen;begun<=0;end
     else empty_guard<=empty_guard+1'b1;
    end else empty_guard<=0;
   end
   sample_valid<=sample_tick;
   if(sample_tick) begin
    // Carry source identity with the sample. A synchronized fault can switch
    // live wav_active before the downstream volume stage accepts this word.
    sample_is_wav<=consume || wav_active;
    if(consume) begin sample_left<=queued[15:0];sample_right<=queued[31:16];started<=1;begun<=1;played_samples<=played_samples+1'b1;end
    else if(speech_busy) begin
     sample_left<=0;sample_right<=0;
     if(wav_active && !data_sync[1] && !complete_sync[1]) begin started<=0;underflow<=1;end
    end else begin sample_left<=tone_left;sample_right<=tone_right;end
   end
  end
 end
endmodule
