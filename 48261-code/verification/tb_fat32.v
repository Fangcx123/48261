`timescale 1ns/1ps
// End-to-end FAT32/BMP frontend, using the unchanged legacy SD byte boundary.
module tb_fat32;
 reg clk=0,rst=1,io_reset=0,scan_start=0,load_start=0;
 always #5 clk=~clk;
 reg [31:0] slot=0;
 reg [15:0] width=4,height=400;
 wire ready,load_done,load_error,scan_done,found,wr_req,rd,pixel;
 wire [3:0] error,mask;wire [7:0] scan_error;wire [31:0] lba,found_slot;
 wire [23:0] rgb;
 reg [7:0] data=0;reg valid=0,sec_end=0;
 fat32_bmp_reader #(.CLK_FREQ_HZ(20000)) dut(
  .clk(clk),.rst(rst),.io_reset(io_reset),.ready(ready),.load_done(load_done),.load_error(load_error),.bmp_error(error),
  .scan_start(scan_start),.scan_done(scan_done),.scan_found_valid(found),.scan_found_sector(found_slot),
  .scan_found_total(),.resource_mask(mask),.scan_error(scan_error),.load_start(load_start),.load_sector(slot),
  .sd_init_done(!io_reset && !rst),.bmp_width(width),.bmp_height(height),.write_req(wr_req),.write_req_ack(wr_req),
  .sd_sec_read(rd),.sd_sec_read_addr(lba),.sd_sec_read_data(data),.sd_sec_read_data_valid(valid),.sd_sec_read_end(sec_end),
  .bmp_data_wr_en(pixel),.bmp_data(rgb));
 reg [31:0] lbas[0:4095];reg [7:0] bytes[0:2097151];reg [31:0] fixture_count[0:0];
 string scenario,path;
 integer model_state=0,idx=0,base=0,k,found_count=0,pixel_count=0,request_count=0;
 integer expected,expected_error=0,fail_after=0;
 reg byte_tick=0,failed=0;
 // Level request must fall between transfers. Last byte and end coincide.
 always @(negedge clk) begin
  valid=0;sec_end=0;
  if(rst || io_reset) begin model_state=0;byte_tick=0;end
  else case(model_state)
   0:if(rd) begin
    base=-1;
    for(k=0;k<fixture_count[0];k=k+1) if(lbas[k]===lba) base=k*512;
    if(base<0) $fatal(1,"Unexpected LBA %0d in %s",lba,scenario);
    idx=0;byte_tick=0;model_state=1;request_count=request_count+1;
   end
   1:begin
    byte_tick=~byte_tick;
    if(byte_tick) begin
     if(scenario=="timeout" && fail_after>0 && request_count>=fail_after && !failed) begin
      failed=1;model_state=3;
     end else begin
      data=bytes[base+idx];valid=1;
      if((idx==511 && !(scenario=="overrun" && fail_after>0 && request_count>=fail_after && !failed)) ||
         idx==512 || (scenario=="short_sector" && fail_after>0 && request_count>=fail_after && idx==510 && !failed)) begin
       sec_end=1;model_state=2;
       if(idx!=511)failed=1;
      end
      idx=idx+1;
     end
    end
   end
   2:if(!rd) model_state=0;
   3:; // wait for the bounded adapter timeout then local reset
  endcase
 end
 always @(posedge clk) begin
  if(found) begin
   if(found_slot!==found_count) $fatal(1,"logical slot order");
   found_count=found_count+1;
  end
  if(pixel) begin
   expected=(((pixel_count*3+2)*13+7)&255)*65536+
            (((pixel_count*3+1)*13+7)&255)*256+((pixel_count*3*13+7)&255);
   if(scenario!="loop" && rgb!==expected[23:0]) $fatal(1,"RGB mismatch pixel %0d: %h vs %h",pixel_count,rgb,expected);
   pixel_count=pixel_count+1;
  end
 end
 task tick(input integer n);repeat(n)@(negedge clk);endtask
 task load_image(input [31:0] s);
 begin
  wait(ready);tick(2);pixel_count=0;slot=s;load_start=1;tick(1);load_start=0;
  wait(load_done || load_error);tick(1);
 end endtask
 initial begin
  if(!$value$plusargs("case=%s",scenario))scenario="mbr_fragmented";
  if(scenario=="full_640x480")begin width=640;height=480;end
  path={"verification/fat32_fixtures/",scenario,"_count.hex"};$readmemh(path,fixture_count);
  path={"verification/fat32_fixtures/",scenario,"_lba.hex"};$readmemh(path,lbas,0,fixture_count[0]-1);
  path={"verification/fat32_fixtures/",scenario,"_data.hex"};$readmemh(path,bytes,0,fixture_count[0]*512-1);
  tick(3);rst=0;tick(4);scan_start=1;tick(1);scan_start=0;
  wait(scan_done);tick(1);
  if(scenario=="bad_bpb" || scenario=="bad_signature" || scenario=="no_files" || scenario=="root_loop") begin
   expected_error=(scenario=="bad_bpb")?8'h21:((scenario=="bad_signature")?8'h20:((scenario=="root_loop")?8'h23:8'h22));
   if(scan_error!=expected_error || mask!=0 || found_count!=0)$fatal(1,"mount fault %h expected %h",scan_error,expected_error);
  end else begin
   if(scan_error!=0 || mask!=((scenario=="missing_pic1")?4'h4:4'h5) || found_count!=4)
    $fatal(1,"mount %s error=%h mask=%h count=%d",scenario,scan_error,mask,found_count);
   // Header and file data requests must fail before successful completion.
   fail_after=request_count+4;
   if(scenario=="early_eof" || scenario=="range" || scenario=="loop" || scenario=="fat_last_error")expected_error=10;
   if(scenario=="bad_bmp")expected_error=3;
   if(scenario=="short_sector" || scenario=="timeout" || scenario=="overrun")expected_error=11;
   load_image((scenario=="missing_pic1")?2:0);
   if(expected_error) begin
    if(error!=expected_error || load_done)$fatal(1,"load fault %s code=%h expected=%h",scenario,error,expected_error);
   end else if(error!=0 || pixel_count!=width*height) $fatal(1,"load %s code=%h pixels=%d",scenario,error,pixel_count);
   // Same-card recovery must retain metadata without a second mount.
   if(expected_error==0 || scenario=="short_sector" || scenario=="timeout" || scenario=="overrun") begin
    io_reset=1;tick(3);io_reset=0;tick(3);load_image(2);
    if(error!=0 || pixel_count!=width*height || mask==0)$fatal(1,"metadata lost across IO reset");
   end
  end
  $display("PASS FAT32 %s: mask=%h mount=%h load=%h pixels=%0d",scenario,mask,scan_error,error,pixel_count);
  $finish;
 end
 initial begin #100000000;$fatal(1,"FAT32 timeout %s",scenario);end
endmodule
