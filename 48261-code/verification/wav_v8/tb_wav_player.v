`timescale 1ns/1ps
module tb_wav_player;
 reg wc=0,rc=0,rst=1,grant=0,tick=0;
 always #5 wc=~wc;
 always #20 rc=~rc;
 wire req,active,uv,valid,source_wav;wire [31:0] lba;wire [7:0] err;wire [15:0] l,r;
 reg [7:0] data=0;reg dv=0,done=0;
 fat32_wav_player #(.CLOCK_HZ(900000)) dut(
 .wr_clk(wc),.wr_rst_n(!rst),.sd_grant(grant),.sd_read(req),.sd_addr(lba),
 .sd_data(data),.sd_valid(dv),.sd_end(done),.rd_clk(rc),.rd_rst_n(!rst),
 .sample_tick(tick),.tone_left(16'd123),.tone_right(16'hfedc),
 .sample_valid(valid),.sample_left(l),.sample_right(r),.sample_is_wav(source_wav),.wav_active(active),.underflow(uv),.audio_error(err));
 reg [31:0] lbas[0:255],count[0:0],meta[0:1];reg [7:0] bytes[0:131071];
 string scenario,path;
 integer ms=0,idx=0,base=0,k,requests=0,delay_count=0,divider=0;
 integer received=0,silence=0,expected_l,expected_r,j,maxlevel=0;
 reg injected=0,consumed=0;
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
  end else if(l!=123 || r!=16'hfedc)$fatal(1,"legacy fallback changed");
 end
 integer expected_error=0;
 initial begin
  if(!$value$plusargs("case=%s",scenario))scenario="mono";
  path={"verification/wav_v8/fixtures/",scenario,"_count.hex"};$readmemh(path,count);
  path={"verification/wav_v8/fixtures/",scenario,"_lba.hex"};$readmemh(path,lbas,0,count[0]-1);
  path={"verification/wav_v8/fixtures/",scenario,"_data.hex"};$readmemh(path,bytes,0,count[0]*512-1);
  path={"verification/wav_v8/fixtures/",scenario,"_meta.hex"};$readmemh(path,meta);
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
  if(scenario=="missing")begin
   wait(dut.state==3);repeat(500)@(negedge rc);
   if(active || err || received)$fatal(1,"missing audio must retain tone");
  end else if(expected_error!=0)begin
   wait(err!=0);repeat(200)@(negedge rc);
   if(err!=expected_error || active)$fatal(1,"error %s got=%h expected=%h",scenario,err,expected_error);
  end else begin
   wait(received>=meta[0]*2+19);repeat(4)@(negedge rc);
   if(err)$fatal(1,"unexpected audio error %h",err);
   if(scenario=="underflow")begin if(!uv || silence==0 || !injected)$fatal(1,"underflow not exercised");end
   else if(uv)$fatal(1,"unexpected underflow");
   if(meta[0]>4096 && maxlevel<3800)$fatal(1,"backpressure/wrap not exercised");
  end
  if(scenario=="mono")begin
   @(negedge wc);rst=1;grant=0;repeat(6)@(negedge rc);
   if(dut.wr_level || dut.rd_level || valid || active || uv || err)$fatal(1,"in-flight global reset failed");
   received=0;@(negedge wc);rst=0;repeat(20)@(negedge wc);grant=1;
   wait(received>=1024);$display("PASS WAV reset: queued/in-flight stream cleared, refill restarts at first sample");
  end
  $display("PASS WAV %s samples=%0d requests=%0d maxlevel=%0d silence=%0d error=%h",scenario,received,requests,maxlevel,silence,err);
  $finish;
 end
 initial begin #50000000;$fatal(1,"WAV test timeout %s samples=%d err=%h state=%d reqs=%d sc=%d found=%h fl=%d dec=%d levels=%d,%d good=%b tick=%b",scenario,received,err,dut.state,requests,dut.u_volume.state,dut.found,dut.u_file.state,dut.u_decode.state,dut.wr_level,dut.rd_level,dut.good,tick);end
endmodule
