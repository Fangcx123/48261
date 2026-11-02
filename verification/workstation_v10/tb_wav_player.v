`timescale 1ns/1ps
module tb_wav_player;
 reg wc=0,rc=0,rst=1,grant=0,tick=0;
 always #5 wc=~wc;
 always #20 rc=~rc;
 reg enable=0,replay=0;wire busy,available,speech;wire [31:0] samples;wire req,active,uv,valid,source_wav;wire [31:0] lba;wire [7:0] err;wire [15:0] l,r;
 wire finished;integer finishes=0;reg finish_seen=0;
 always @(negedge rc) if(!rst && finished!=finish_seen) begin
 finish_seen=finished;finishes=finishes+1;
 if(err || samples!=meta[0])$fatal(1,"completion before final sample or on failure");end
 reg [7:0] data=0;reg dv=0,done=0;
 fat32_wav_player #(.CLOCK_HZ(900000)) dut(
 .play_done_toggle(finished),.play_enable(enable),.replay_toggle(replay),.audio_busy(busy),.audio_available(available),.speech_busy(speech),.played_samples(samples),.wr_clk(wc),.wr_rst_n(!rst),.sd_grant(grant),.sd_read(req),.sd_addr(lba),
 .sd_data(data),.sd_valid(dv),.sd_end(done),.rd_clk(rc),.rd_rst_n(!rst),
 .sample_tick(tick),.tone_left(16'd123),.tone_right(16'hfedc),
 .sample_valid(valid),.sample_left(l),.sample_right(r),.sample_is_wav(source_wav),.wav_active(active),.underflow(uv),.audio_error(err));
 reg [31:0] lbas[0:255],count[0:0],meta[0:1];reg [7:0] bytes[0:131071];
 string scenario,path,fixture_name;
 integer ms=0,idx=0,base=0,k,requests=0,delay_count=0,divider=0;
 integer received=0,silence=0,expected_l,expected_r,j,maxlevel=0;
 reg injected=0,consumed=0,seen_underflow=0;always @(posedge rc)if(uv)seen_underflow<=1;
 always @(negedge wc) begin
  dv=0;done=0;
  if(rst) begin ms=0;delay_count=0;end
  else begin
   if(dut.wr_level>maxlevel)maxlevel=dut.wr_level;
   if(dut.wr_level>4096 || dut.full)$fatal(1,"FIFO overflow level=%d",dut.wr_level);
   case(ms)
    0:if(req)begin
     if(!grant)$fatal(1,"request before grant");
     base=-1;for(k=0;k<count[0];k=k+1)if(lbas[k]==lba)base=k*512;
     if(base<0)$fatal(1,"unexpected LBA %d",lba);
     requests=requests+1;idx=0;ms=1;
     if(scenario=="tailfat" && dut.data_done && !injected)begin delay_count=800000;injected=1;end
     if(!injected && requests>35 && received>500 && (scenario=="underflow" || scenario=="timeout"))begin
      delay_count=(scenario=="timeout")?910000:500000;injected=1;
     end
    end
    1:if(delay_count!=0)delay_count=delay_count-1;else begin
     data=bytes[base+idx];dv=1;
     if(idx==511 || (scenario=="short_sector" && requests==4 && idx==510))begin done=1;ms=2;end
     idx=idx+1;
    end
    2:if(!req)ms=0;
   endcase
  end
 end
 always @(negedge rc) begin
  if(rst)begin divider=0;tick=0;end
  else begin divider=divider+1;tick=(divider==20);if(tick)divider=0;end
 end
 always @(posedge rc) consumed<=dut.consume;
 always @(negedge rc) if(!rst && valid)begin
  if(consumed) begin
   if(!source_wav)$fatal(1,"WAV source tag lost at downstream volume boundary");
   j=received%meta[0];expected_l=((j*173+1234)&65535)-32768;
   expected_r=meta[1]==1 ? expected_l : ((j*197+3456)&65535)-32768;
   if(l!==expected_l[15:0] || r!==expected_r[15:0])
    $fatal(1,"PCM order/endian/loop %s sample=%d got=%h,%h expected=%h,%h",scenario,received,l,r,expected_l[15:0],expected_r[15:0]);
   received=received+1;
  end else if(source_wav)begin
   if(l!=0 || r!=0)$fatal(1,"underflow not silent");silence=silence+1;
  end else if(speech)begin if(l!=0 || r!=0)$fatal(1,"prebuffer/settle not silent");end
  else if(l!=123 || r!=16'hfedc)$fatal(1,"idle cue input changed");
 end
 integer expected_error=0;
 initial begin
  if(!$value$plusargs("case=%s",scenario))scenario="mono";
  fixture_name=scenario;if(scenario=="tailfat")fixture_name="mono";
  path={"verification/wav_v8/fixtures/",fixture_name,"_count.hex"};$readmemh(path,count);
  path={"verification/wav_v8/fixtures/",fixture_name,"_lba.hex"};$readmemh(path,lbas,0,count[0]-1);
  path={"verification/wav_v8/fixtures/",fixture_name,"_data.hex"};$readmemh(path,bytes,0,count[0]*512-1);
  path={"verification/wav_v8/fixtures/",fixture_name,"_meta.hex"};$readmemh(path,meta);
  if(scenario=="bad_rate" || scenario=="bad_bits" || scenario=="bad_align")expected_error=8'h33;
  if(scenario=="bad_magic")expected_error=8'h31;
  if(scenario=="bad_riff" || scenario=="truncated")expected_error=8'h32;
  if(scenario=="no_data")expected_error=8'h35;
  if(scenario=="odd_data")expected_error=8'h34;
  if(scenario=="bad_fat")expected_error=8'h24;
  if(scenario=="loop_fat")expected_error=8'h23;
  if(scenario=="short_sector" || scenario=="timeout")expected_error=8'h10;
  repeat(4)@(negedge wc);rst=0;
  repeat(100)@(negedge wc);if(req || requests!=0)$fatal(1,"read before preload");grant=1;
  // No samples may leave the FIFO while the display/HDMI gate is closed.
  repeat(20000)@(negedge rc);
  if(received || samples)$fatal(1,"WAV prefix consumed before display ready");
  enable=1;
  if(scenario=="missing")begin
   wait(!busy);repeat(500)@(negedge rc);
   if(active || err || received)$fatal(1,"missing audio must retain tone");
  end else if(expected_error!=0)begin
   wait(err!=0);repeat(200)@(negedge rc);
   if(err!=expected_error || active)$fatal(1,"error %s got=%h expected=%h",scenario,err,expected_error);
  end else begin
   wait(received>=(meta[0]<1000 ? meta[0]/2:500) || !busy);
   // Busy replay request is discarded, never queued.
   @(negedge wc);replay=~replay;
   wait(!busy);repeat(500)@(negedge rc);
   if(received!=meta[0] || samples!=meta[0] || active || speech)$fatal(1,"one-shot tail count %d/%d samples=%d",received,meta[0],samples);
   if(!available)$fatal(1,"valid WAV not replayable");
   repeat(1000)@(negedge rc);
   if(received!=meta[0])$fatal(1,"unsolicited loop/queued replay");
   @(negedge wc);replay=~replay;
   wait(busy);wait(!busy);repeat(500)@(negedge rc);
   if(received!=meta[0]*2 || samples!=meta[0])$fatal(1,"replay not exact %d",received);
   if(err)$fatal(1,"unexpected audio error %h",err);
   if(scenario=="underflow")begin if(!seen_underflow || silence==0 || !injected)$fatal(1,"underflow not exercised");end
   else if(uv || seen_underflow)$fatal(1,"unexpected underflow");
   if(scenario=="tailfat" && !injected)$fatal(1,"tail FAT delay not exercised");
   if(meta[0]>4096 && maxlevel<3800)$fatal(1,"backpressure/wrap not exercised");
  end
  if(finishes!=((expected_error==0 && scenario!="missing") ? 2:0))$fatal(1,"completion count %d",finishes);
  $display("PASS WAV %s samples=%0d requests=%0d maxlevel=%0d silence=%0d error=%h",scenario,received,requests,maxlevel,silence,err);
  $finish;
 end
 initial begin #150000000;$fatal(1,"WAV test timeout %s samples=%d err=%h state=%d reqs=%d sc=%d found=%h fl=%d dec=%d levels=%d,%d good=%b tick=%b",scenario,received,err,dut.state,requests,dut.u_volume.state,dut.found,dut.u_file.state,dut.u_decode.state,dut.wr_level,dut.rd_level,dut.good,tick);end
endmodule
