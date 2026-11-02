from pathlib import Path
p=Path(r'D:\FPGA\lab_ex5_i2s\src\user_source\hdl_source\SD\fat32_bmp_reader.v')
s=p.read_text()
s=s.replace('parameter integer CLK_FREQ_HZ=100_000_000','parameter integer CLK_FREQ_HZ=100_000_000, parameter integer ENABLE_SCALING=0')
s=s.replace('fat32_file_streamer u_file(', 'fat32_file_streamer #(.THROTTLE(ENABLE_SCALING)) u_file(')
s=s.replace('.file_busy(fl_busy)', '.sector_allow(!ENABLE_SCALING || scale_allow),.file_busy(fl_busy)')
s=s.replace('reg [3:0] header_error;', '''reg [3:0] header_error;
 reg [31:0] row_bytes,padded_row;
 wire scale_allow,scale_valid,scale_done,scale_overflow;wire [23:0] scale_pixel;
 wire scale_start=(state==STREAM_START);
 wire scale_input=(state==STREAM && fl_valid && fl_offset>=pixel_offset && {1'b0,fl_offset}<pixel_end);
 reg file_finished;reg [7:0] file_result;
 generate if(ENABLE_SCALING) begin: scaler
 bmp_nearest_scaler u_scale(.clk(clk),.rst(pipe_rst),.start(scale_start),
 .width(width[11:0]),.height(height[11:0]),.padding(padded_row[1:0]-row_bytes[1:0]),
 .byte_valid(scale_input),.byte_data(fl_byte),.sector_allow(scale_allow),
 .pixel_valid(scale_valid),.pixel(scale_pixel),.done(scale_done),.overflow(scale_overflow));
 end else begin: legacy_scale
 assign scale_allow=1'b1;assign scale_valid=1'b0;assign scale_done=1'b0;
 assign scale_overflow=1'b0;assign scale_pixel=24'd0;
 end endgenerate''')
s=s.replace('header_error<=0;end','header_error<=0;row_bytes<=0;padded_row<=0;end')
s=s.replace('pixel_bytes<=frame_pixels*3;', '''row_bytes<=width*3;padded_row<=(row_bytes+3)&32'hfffffffc;
   pixel_bytes<=ENABLE_SCALING ? padded_row*height : frame_pixels*3;''')
s=s.replace('else if(width!={16\'d0,bmp_width} || height!={16\'d0,bmp_height} || width==0 || height==0 || width[1:0]!=0) header_error<=2;', '''else if(ENABLE_SCALING ? (width==0 || width>2048 || height==0 || height>2048) :
    (width!={16'd0,bmp_width} || height!={16'd0,bmp_height} || width==0 || height==0 || width[1:0]!=0)) header_error<=2;''')
s=s.replace('byte_phase<=0;pixel_count<=0;\n  end', 'byte_phase<=0;pixel_count<=0;file_finished<=0;file_result<=0;\n  end')
s=s.replace('if(state==STREAM && fl_valid &&', 'if(!ENABLE_SCALING && state==STREAM && fl_valid &&')
s=s.replace('   case(state)\n', '''   if(ENABLE_SCALING && scale_valid && state==STREAM) begin
    bmp_data<=scale_pixel;bmp_data_wr_en<=1;pixel_count<=pixel_count+1'b1;
   end
   if(fl_done) begin file_finished<=1;file_result<=fl_error;end
   case(state)
''')
s=s.replace('STREAM_START:begin fl_start<=1;state<=STREAM;end','STREAM_START:begin fl_start<=1;file_finished<=0;file_result<=0;state<=STREAM;end')
s=s.replace('STREAM:if(fl_done) begin', '''STREAM:if(ENABLE_SCALING ? (file_finished && (file_result!=0 || scale_done || scale_overflow)) : fl_done) begin''')
s=s.replace('if(fl_error!=0) begin bmp_error<=(fl_error==8\'h10) ? 4\'hb:4\'ha;load_error<=1;end','''if((ENABLE_SCALING ? file_result : fl_error)!=0) begin bmp_error<=((ENABLE_SCALING ? file_result : fl_error)==8'h10) ? 4'hb:4'ha;load_error<=1;end
     else if(ENABLE_SCALING && scale_overflow) begin bmp_error<=4'hc;load_error<=1;end''')
p.write_text(s)
