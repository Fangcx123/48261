from pathlib import Path
v=Path('verification/workstation_v10')
s=Path('verification/wav_v8/tb_wav_player.v').read_text()
s=s.replace('wire req,active,uv,valid,source_wav;', 'reg enable=0,replay=0;wire busy,available,speech;wire [31:0] samples;wire req,active,uv,valid,source_wav;')
s=s.replace('reg injected=0,consumed=0;', 'reg injected=0,consumed=0,seen_underflow=0;always @(posedge rc)if(uv)seen_underflow<=1;')
s=s.replace('if(!uv || silence==0 || !injected)', 'if(!seen_underflow || silence==0 || !injected)')
s=s.replace('.wr_clk(wc)', '.play_enable(enable),.replay_toggle(replay),.audio_busy(busy),.audio_available(available),.speech_busy(speech),.played_samples(samples),.wr_clk(wc)')
s=s.replace('else if(l!=123 || r!=16\'hfedc)$fatal(1,"legacy fallback changed");', '''else if(speech)begin if(l!=0 || r!=0)$fatal(1,"prebuffer/settle not silent");end
  else if(l!=123 || r!=16'hfedc)$fatal(1,"idle cue input changed");''')
s=s.replace('wait(dut.state==3);repeat(500)', 'wait(!busy);repeat(500)')
s=s.replace('grant=1;\n  if(scenario', '''grant=1;
  // No samples may leave the FIFO while the display/HDMI gate is closed.
  repeat(20000)@(negedge rc);
  if(received || samples)$fatal(1,"WAV prefix consumed before display ready");
  enable=1;
  if(scenario''')
s=s.replace('wait(received>=meta[0]*2+19);repeat(4)@(negedge rc);', '''wait(received>=500 || !busy);
   // Busy replay request is discarded, never queued.
   @(negedge wc);replay=~replay;
   wait(!busy);repeat(500)@(negedge rc);
   if(received!=meta[0] || samples!=meta[0] || active || speech)$fatal(1,"one-shot tail count %d/%d samples=%d",received,meta[0],samples);
   if(!available)$fatal(1,"valid WAV not replayable");
   repeat(1000)@(negedge rc);
   if(received!=meta[0])$fatal(1,"unsolicited loop/queued replay");
   @(negedge wc);replay=~replay;
   wait(busy);wait(!busy);repeat(500)@(negedge rc);
   if(received!=meta[0]*2 || samples!=meta[0])$fatal(1,"replay not exact %d",received);''')
# Reset subsection belongs to old looping contract; new test already covers replay.
a=s.index('  if(scenario=="mono")begin\n   @(negedge wc);rst=1;');b=s.index('  $display("PASS WAV %s',a)
s=s[:a]+s[b:]
s=s.replace('#50000000;', '#150000000;')
# Delay the final FAT lookup beyond consumption of the last PCM word. EOF
# validation must keep the session busy without treating the tail as underflow.
s=s.replace('requests=requests+1;idx=0;ms=1;', '''requests=requests+1;idx=0;ms=1;
     if(scenario=="tailfat" && dut.data_done && !injected)begin delay_count=800000;injected=1;end''')
s=s.replace('string scenario,path;', 'string scenario,path,fixture_name;')
s=s.replace('  path={"verification/wav_v8/fixtures/",scenario,"_count.hex"};', '  fixture_name=scenario;if(scenario=="tailfat")fixture_name="mono";\n  path={"verification/wav_v8/fixtures/",scenario,"_count.hex"};')
s=s.replace('path={"verification/wav_v8/fixtures/",scenario,', 'path={"verification/wav_v8/fixtures/",fixture_name,')
s=s.replace('else if(uv)$fatal(1,"unexpected underflow");', '''else if(uv || seen_underflow)$fatal(1,"unexpected underflow");
   if(scenario=="tailfat" && !injected)$fatal(1,"tail FAT delay not exercised");''')
(v/'tb_wav_player.v').write_text(s)
