// FAT32 frontend for the established frame scheduler. load_sector is now a
// logical PIC slot 0..3. Mount metadata survives local IO recovery resets.
module fat32_bmp_reader #(parameter integer CLK_FREQ_HZ=100_000_000, parameter integer ENABLE_SCALING=0,parameter ENABLE_BACKPRESSURE=0)(
 input clk,rst,io_reset,output ready,output reg load_done,load_error,
 output reg [3:0] bmp_error,input scan_start,output reg scan_done,scan_found_valid,
 output reg [31:0] scan_found_sector,output reg [2:0] scan_found_total,
 output reg [3:0] resource_mask,output reg [7:0] scan_error,
 input load_start,input [31:0] load_sector,input sd_init_done,
 input [15:0] bmp_width,bmp_height,output reg write_req,input write_req_ack,
 output sd_sec_read,output [31:0] sd_sec_read_addr,input [7:0] sd_sec_read_data,
 input sd_sec_read_data_valid,sd_sec_read_end,output reg bmp_data_wr_en,output reg [23:0] bmp_data,
 output [11:0] source_width,source_height,input pixel_ready
);
 wire pipe_rst=rst|io_reset;
 wire scale_allow;
 localparam IDLE=0,SCAN=1,EMIT=2,SCAN_END=3,HEADER_ADDR=4,HEADER_REQ=5,
  HEADER_WAIT=6,HEADER_CHECK=7,WRITE_WAIT=8,STREAM_START=9,STREAM=10;
 reg [3:0] state;
 reg sc_start,fl_start,hdr_req;
 wire sc_done,sc_busy,fl_done,fl_busy,fl_valid;
 wire [7:0] sc_error,fl_error,fl_byte;
 wire [31:0] fl_offset;
 wire [3:0] sc_mask;
 wire [7:0] sc_spc;
 wire [31:0] sc_fat,sc_data,sc_max;
 wire [31:0] sc_cluster[0:3],sc_size[0:3];
 reg [31:0] clusters[0:3],sizes[0:3];
 reg [7:0] spc;reg [2:0] spc_shift;reg [31:0] fat_lba,data_lba,max_cluster;
 reg [1:0] slot;
 reg [31:0] selected_cluster,selected_size,hdr_lba;
 wire sc_req,fl_req;wire [31:0] sc_lba,fl_lba;
 wire sec_busy,sec_valid,sec_done;wire [7:0] sec_byte,sec_error;wire [8:0] sec_index;
 wire scanning=(state==SCAN);
 wire streaming=(state==STREAM || state==STREAM_START);
 wire req=scanning ? sc_req : (streaming ? fl_req : hdr_req);
 wire [31:0] lba=scanning ? sc_lba : (streaming ? fl_lba : hdr_lba);
 assign ready=(state==IDLE) && sd_init_done && !pipe_rst;
 integer i;
 // Only full reset clears the cached directory. A load fault resets SPI and
 // transactions while retaining the four immutable file locations and sizes.
 always @(posedge clk or posedge rst) begin
  if(rst) begin
   resource_mask<=0;scan_error<=0;spc<=0;spc_shift<=0;fat_lba<=0;data_lba<=0;max_cluster<=0;
   for(i=0;i<4;i=i+1) begin clusters[i]<=0;sizes[i]<=0;end
  end else if(!io_reset && sc_done) begin
   resource_mask<=sc_mask;scan_error<=sc_error;
   spc<=sc_spc;fat_lba<=sc_fat;data_lba<=sc_data;max_cluster<=sc_max;
   case(sc_spc)
    1:spc_shift<=0;2:spc_shift<=1;4:spc_shift<=2;8:spc_shift<=3;
    16:spc_shift<=4;32:spc_shift<=5;64:spc_shift<=6;128:spc_shift<=7;
   endcase
   for(i=0;i<4;i=i+1) begin clusters[i]<=sc_cluster[i];sizes[i]<=sc_size[i];end
  end
 end
 sd_sector_adapter #(.TIMEOUT_CYCLES(CLK_FREQ_HZ)) u_sector(
  .clk(clk),.rst(pipe_rst),.sector_req(req),.sector_lba(lba),.sector_busy(sec_busy),
  .sector_valid(sec_valid),.sector_byte(sec_byte),.sector_byte_index(sec_index),.sector_done(sec_done),.sector_error(sec_error),
  .sd_sec_read(sd_sec_read),.sd_sec_read_addr(sd_sec_read_addr),.sd_sec_read_data(sd_sec_read_data),
  .sd_sec_read_data_valid(sd_sec_read_data_valid),.sd_sec_read_end(sd_sec_read_end));
 fat32_volume_scanner u_volume(
  .clk(clk),.rst_n(!pipe_rst),.scan_start(sc_start),.scan_busy(sc_busy),.scan_done(sc_done),.fs_error(sc_error),
  .partition_lba(),.sectors_per_cluster(sc_spc),.fat_start_lba(sc_fat),.data_start_lba(sc_data),.max_cluster(sc_max),
  .resource_valid(sc_mask),.resource0_cluster(sc_cluster[0]),.resource1_cluster(sc_cluster[1]),
  .resource2_cluster(sc_cluster[2]),.resource3_cluster(sc_cluster[3]),
  .resource0_size(sc_size[0]),.resource1_size(sc_size[1]),.resource2_size(sc_size[2]),.resource3_size(sc_size[3]),
  .sector_req(sc_req),.sector_lba(sc_lba),.sector_busy(sec_busy),.sector_valid(sec_valid && scanning),
  .sector_byte(sec_byte),.sector_byte_index(sec_index),.sector_done(sec_done && scanning),.sector_error(sec_error));
 fat32_file_streamer #(.THROTTLE(ENABLE_SCALING)) u_file(
  .clk(clk),.rst_n(!pipe_rst),.file_start(fl_start),.first_cluster(selected_cluster),.file_size(selected_size),
  .sectors_per_cluster(spc),.fat_start_lba(fat_lba),.data_start_lba(data_lba),.max_cluster(max_cluster),
  .sector_allow(!ENABLE_SCALING || scale_allow),.file_busy(fl_busy),.file_done(fl_done),.file_valid(fl_valid),.file_byte(fl_byte),.file_byte_offset(fl_offset),.fs_error(fl_error),
  .sector_req(fl_req),.sector_lba(fl_lba),.sector_busy(sec_busy),.sector_valid(sec_valid && streaming),
  .sector_byte(sec_byte),.sector_byte_index(sec_index),.sector_done(sec_done && streaming),.sector_error(sec_error));
 reg [15:0] magic,planes,bpp;
 reg [31:0] bf_size,pixel_offset,dib_size,width,height,compression;
 assign source_width=width[11:0];assign source_height=height[11:0];
 reg [31:0] frame_pixels,pixel_bytes,pixel_count;
 reg [32:0] pixel_end,dib_end;
 reg [3:0] header_error;
 reg [31:0] row_bytes,padded_row;
 // Accepted BMPs are at most 2048x2048: row <= 6144, height <= 2048.
 // A bounded 13x12 product fits one DSP. Invalid dimensions are rejected
 // independently before this byte count is used for header acceptance.
 reg [24:0] scaled_pixel_bytes;
 wire scale_valid,scale_done,scale_overflow;wire [23:0] scale_pixel;
 wire scale_start=(state==STREAM_START);
 wire scale_input=(state==STREAM && fl_valid && fl_offset>=pixel_offset && {1'b0,fl_offset}<pixel_end);
 reg file_finished;reg [7:0] file_result;
 reg file_failed,file_io_error;
 always @(posedge clk or posedge pipe_rst)
  if(pipe_rst)begin file_failed<=0;file_io_error<=0;end
  else if(fl_start)begin file_failed<=0;file_io_error<=0;end
  else if(fl_done)begin file_failed<=fl_error!=0;file_io_error<=fl_error==8'h10;end
 generate if(ENABLE_SCALING) begin: scaler
 bmp_nearest_scaler #(.ENABLE_BACKPRESSURE(ENABLE_BACKPRESSURE)) u_scale(.pixel_ready(pixel_ready),.clk(clk),.rst(pipe_rst),.start(scale_start),
 .width(width[11:0]),.height(height[11:0]),.padding(padded_row[1:0]-row_bytes[1:0]),
 .byte_valid(scale_input),.byte_data(fl_byte),.sector_allow(scale_allow),
 .pixel_valid(scale_valid),.pixel(scale_pixel),.done(scale_done),.overflow(scale_overflow));
 end else begin: legacy_scale
 assign scale_allow=1'b1;assign scale_valid=1'b0;assign scale_done=1'b0;
 assign scale_overflow=1'b0;assign scale_pixel=24'd0;
 end endgenerate
 reg [1:0] byte_phase;
 // Pipeline all header arithmetic; 54..511 give many cycles to settle.
 always @(posedge clk or posedge pipe_rst) begin
  if(pipe_rst) begin frame_pixels<=0;pixel_bytes<=0;pixel_end<=0;dib_end<=0;header_error<=0;scaled_pixel_bytes<=0;row_bytes<=0;padded_row<=0;end
  else begin
   frame_pixels<={16'd0,bmp_width}*{16'd0,bmp_height};
   row_bytes<=width*3;padded_row<=(row_bytes+3)&32'hfffffffc;
   scaled_pixel_bytes<=padded_row[12:0]*height[11:0];
   pixel_bytes<=ENABLE_SCALING ? {7'd0,scaled_pixel_bytes} : frame_pixels*3;pixel_end<={1'b0,pixel_offset}+pixel_bytes;
   dib_end<={1'b0,dib_size}+33'd14;
   if(magic!=16'h4d42) header_error<=1;
   else if(ENABLE_SCALING ? (width==0 || width>2048 || height==0 || height>2048) :
    (width!={16'd0,bmp_width} || height!={16'd0,bmp_height} || width==0 || height==0 || width[1:0]!=0)) header_error<=2;
   else if(planes!=1 || bpp!=24 || compression!=0) header_error<=3;
   else if(dib_size<40 || dib_end>pixel_offset || pixel_offset<54 || pixel_offset>4096 ||
     pixel_end[32] || bf_size<pixel_end || bf_size>selected_size || selected_size>32'h01000000) header_error<=4;
   else header_error<=0;
  end
 end
 always @(posedge clk or posedge pipe_rst) begin
  if(pipe_rst) begin
   state<=IDLE;load_done<=0;load_error<=0;bmp_error<=0;scan_done<=0;scan_found_valid<=0;
   scan_found_sector<=0;scan_found_total<=0;write_req<=0;bmp_data_wr_en<=0;bmp_data<=0;
   sc_start<=0;fl_start<=0;hdr_req<=0;slot<=0;selected_cluster<=0;selected_size<=0;hdr_lba<=0;
   magic<=0;planes<=0;bpp<=0;bf_size<=0;pixel_offset<=0;dib_size<=0;width<=0;height<=0;compression<=0;
   byte_phase<=0;pixel_count<=0;file_finished<=0;file_result<=0;
  end else begin
   load_done<=0;load_error<=0;scan_done<=0;scan_found_valid<=0;bmp_data_wr_en<=0;
   sc_start<=0;fl_start<=0;hdr_req<=0;
   if(state==HEADER_WAIT && sec_valid) begin
    case(sec_index)
     0:magic[7:0]<=sec_byte;1:magic[15:8]<=sec_byte;
     2:bf_size[7:0]<=sec_byte;3:bf_size[15:8]<=sec_byte;4:bf_size[23:16]<=sec_byte;5:bf_size[31:24]<=sec_byte;
     10:pixel_offset[7:0]<=sec_byte;11:pixel_offset[15:8]<=sec_byte;12:pixel_offset[23:16]<=sec_byte;13:pixel_offset[31:24]<=sec_byte;
     14:dib_size[7:0]<=sec_byte;15:dib_size[15:8]<=sec_byte;16:dib_size[23:16]<=sec_byte;17:dib_size[31:24]<=sec_byte;
     18:width[7:0]<=sec_byte;19:width[15:8]<=sec_byte;20:width[23:16]<=sec_byte;21:width[31:24]<=sec_byte;
     22:height[7:0]<=sec_byte;23:height[15:8]<=sec_byte;24:height[23:16]<=sec_byte;25:height[31:24]<=sec_byte;
     26:planes[7:0]<=sec_byte;27:planes[15:8]<=sec_byte;28:bpp[7:0]<=sec_byte;29:bpp[15:8]<=sec_byte;
     30:compression[7:0]<=sec_byte;31:compression[15:8]<=sec_byte;32:compression[23:16]<=sec_byte;33:compression[31:24]<=sec_byte;
     default:;
    endcase
   end
   if(!ENABLE_SCALING && state==STREAM && fl_valid && fl_offset>=pixel_offset && {1'b0,fl_offset}<pixel_end) begin
    case(byte_phase)
     0:begin bmp_data[7:0]<=fl_byte;byte_phase<=1;end
     1:begin bmp_data[15:8]<=fl_byte;byte_phase<=2;end
     2:begin bmp_data[23:16]<=fl_byte;byte_phase<=0;bmp_data_wr_en<=1;pixel_count<=pixel_count+1'b1;end
    endcase
   end
   if(ENABLE_SCALING && scale_valid && state==STREAM) begin
    bmp_data<=scale_pixel;bmp_data_wr_en<=1;pixel_count<=pixel_count+1'b1;
   end
   if(fl_done) begin file_finished<=1;file_result<=fl_error;end
   case(state)
    IDLE:begin
     write_req<=0;
     if(sd_init_done && scan_start) begin sc_start<=1;scan_found_total<=0;state<=SCAN;end
     else if(sd_init_done && load_start) begin
      bmp_error<=0;slot<=load_sector[1:0];pixel_count<=0;byte_phase<=0;
      if(load_sector>3 || !resource_mask[load_sector[1:0]]) begin bmp_error<=4'ha;load_error<=1;end
      else begin selected_cluster<=clusters[load_sector[1:0]];selected_size<=sizes[load_sector[1:0]];state<=HEADER_ADDR;end
     end
    end
    SCAN:if(sc_done) begin slot<=0;state<=EMIT;end
    EMIT:begin
     if(resource_mask!=0 && scan_error==0) begin
      // Emit four stable logical IDs; the scheduler masks missing resources.
      scan_found_valid<=1;scan_found_sector<={30'd0,slot};scan_found_total<={1'b0,slot}+1'b1;
      if(slot==3) state<=SCAN_END;else slot<=slot+1'b1;
     end else state<=SCAN_END;
    end
    SCAN_END:begin scan_done<=1;state<=IDLE;end
    HEADER_ADDR:begin
     if(selected_cluster<2 || selected_cluster>max_cluster || selected_size<54 || selected_size>32'h01000000) begin
      bmp_error<=4'ha;load_error<=1;state<=IDLE;
     end else begin hdr_lba<=data_lba+((selected_cluster-2)<<spc_shift);state<=HEADER_REQ;end
    end
    HEADER_REQ:if(!sec_busy) begin hdr_req<=1;state<=HEADER_WAIT;end
    HEADER_WAIT:if(sec_done) begin
     if(sec_error!=0) begin bmp_error<=4'hb;load_error<=1;state<=IDLE;end
     else state<=HEADER_CHECK;
    end
    HEADER_CHECK:begin
     if(header_error!=0) begin bmp_error<=header_error;load_error<=1;state<=IDLE;end
     else begin write_req<=1;state<=WRITE_WAIT;end
    end
    WRITE_WAIT:if(write_req_ack) begin write_req<=0;state<=STREAM_START;end
    STREAM_START:begin fl_start<=1;file_finished<=0;file_result<=0;state<=STREAM;end
    STREAM:if(ENABLE_SCALING ? (file_finished && (file_failed || scale_done || scale_overflow)) : fl_done) begin
     if((ENABLE_SCALING ? file_failed : fl_error!=0)) begin bmp_error<=(ENABLE_SCALING ? file_io_error : fl_error==8'h10) ? 4'hb:4'ha;load_error<=1;end
     else if(ENABLE_SCALING && scale_overflow) begin bmp_error<=4'hc;load_error<=1;end
     else if(pixel_count!=frame_pixels || byte_phase!=0) begin bmp_error<=4'd5;load_error<=1;end
     else load_done<=1;
     state<=IDLE;
    end
    default:state<=IDLE;
   endcase
  end
 end
endmodule
