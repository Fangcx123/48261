// RIFF/WAVE PCM parser: 48 kHz, signed 16-bit, mono or stereo.
// Walk chunk headers (including odd padding), accept extended fmt/JUNK/LIST.
// All byte positions and extents are bounded by RIFF and FAT directory size.
module wav_pcm_decoder(
 input clk,rst_n,start,input [31:0] file_size,
 input byte_valid,input [7:0] byte_data,input file_done,
 output reg pcm_valid,output reg [31:0] pcm_data,
 output reg format_valid,output reg data_done,output reg [7:0] error
);
 localparam RIFF=0,CHUNK=1,BODY=2,PAD=3,END=4,FAIL=5;
 reg [2:0] state;
 reg [31:0] offset,riff_size,riff_end,chunk_id,chunk_size,left_bytes,body_pos;
 reg [32:0] chunk_limit;
 reg [3:0] header_pos;
 reg [15:0] format,channels,bits,alignment;
 reg [31:0] rate,byte_rate;
 reg fmt_seen;
 reg [1:0] phase;
 reg [7:0] low_byte;
 reg [15:0] left_sample;
 wire [31:0] size_now={byte_data,chunk_size[23:0]};
 wire [32:0] chunk_padded={1'b0,size_now}+{32'd0,size_now[0]};
 task fail;input [7:0] e;begin error<=e;format_valid<=0;state<=FAIL;end endtask
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
   state<=END;offset<=0;riff_size<=0;riff_end<=0;chunk_id<=0;chunk_size<=0;
   left_bytes<=0;body_pos<=0;header_pos<=0;chunk_limit<=0;format<=0;channels<=0;bits<=0;
   alignment<=0;rate<=0;byte_rate<=0;fmt_seen<=0;phase<=0;low_byte<=0;
   left_sample<=0;pcm_valid<=0;pcm_data<=0;format_valid<=0;data_done<=0;error<=0;
  end else begin
   pcm_valid<=0;
   if(start) begin
    state<=RIFF;offset<=0;riff_size<=0;riff_end<=0;chunk_id<=0;chunk_size<=0;
    left_bytes<=0;body_pos<=0;header_pos<=0;format<=0;channels<=0;bits<=0;
    alignment<=0;rate<=0;byte_rate<=0;fmt_seen<=0;phase<=0;format_valid<=0;
    data_done<=0;error<=0;
   end else if(byte_valid && error==0) begin
    offset<=offset+1'b1;
    case(state)
     RIFF:begin
      case(offset)
       0:if(byte_data!="R") fail(8'h31);
       1:if(byte_data!="I") fail(8'h31);
       2:if(byte_data!="F") fail(8'h31);
       3:if(byte_data!="F") fail(8'h31);
       4:riff_size[7:0]<=byte_data;5:riff_size[15:8]<=byte_data;6:riff_size[23:16]<=byte_data;
       7:begin
        riff_size[31:24]<=byte_data;
        riff_end<={byte_data,riff_size[23:0]}+32'd8;
        
       end
       8:if(byte_data!="W") fail(8'h31);
       9:begin
        if(byte_data!="A") fail(8'h31);
        // The complete RIFF size and registered end have settled by byte 9.
        // Compare after the addition, without combining two carry chains.
        else if(riff_size<36 || riff_size>32'hfffffff7 || riff_end>file_size) fail(8'h32);
       end
       10:if(byte_data!="V") fail(8'h31);
       11:if(byte_data!="E") fail(8'h31);else begin state<=CHUNK;header_pos<=0;end
      endcase
     end
     CHUNK:begin
      header_pos<=header_pos+1'b1;
      case(header_pos)
       0:begin
        chunk_id[7:0]<=byte_data;
        // Compute remaining chunk space seven bytes before length validation,
        // removing offset + size + padding from the 100 MHz decision path.
        chunk_limit<={1'b0,riff_end}-{1'b0,offset}-33'd8;
       end
       1:chunk_id[15:8]<=byte_data;
       2:chunk_id[23:16]<=byte_data;3:chunk_id[31:24]<=byte_data;
       4:chunk_size[7:0]<=byte_data;5:chunk_size[15:8]<=byte_data;6:chunk_size[23:16]<=byte_data;
       7:begin
        chunk_size[31:24]<=byte_data;left_bytes<=size_now;body_pos<=0;phase<=0;
        state<=size_now==0 ? CHUNK : BODY;header_pos<=0;
        if(chunk_limit[32] || chunk_padded>chunk_limit) fail(8'h32);
        else if(chunk_id==32'h20746d66) begin
         if(size_now<16 || fmt_seen) fail(8'h33);
        end else if(chunk_id==32'h61746164) begin
         if(!fmt_seen || size_now==0 || size_now[0] || (channels==2 && size_now[1])) fail(8'h34);
         else format_valid<=1;
        end
       end
      endcase
     end
     BODY:begin
      body_pos<=body_pos+1'b1;left_bytes<=left_bytes-1'b1;
      if(chunk_id==32'h20746d66) begin
       case(body_pos)
        0:format[7:0]<=byte_data;1:format[15:8]<=byte_data;
        2:channels[7:0]<=byte_data;3:channels[15:8]<=byte_data;
        4:rate[7:0]<=byte_data;5:rate[15:8]<=byte_data;6:rate[23:16]<=byte_data;7:rate[31:24]<=byte_data;
        8:byte_rate[7:0]<=byte_data;9:byte_rate[15:8]<=byte_data;10:byte_rate[23:16]<=byte_data;11:byte_rate[31:24]<=byte_data;
        12:alignment[7:0]<=byte_data;13:alignment[15:8]<=byte_data;
        14:bits[7:0]<=byte_data;
        15:begin
         bits[15:8]<=byte_data;
         if(format!=1 || (channels!=1 && channels!=2) || rate!=48000 ||
            {byte_data,bits[7:0]}!=16 || alignment!=(channels==1 ? 2 : 4) ||
            byte_rate!=(channels==1 ? 96000 : 192000)) fail(8'h33);
         else fmt_seen<=1;
        end
       endcase
      end else if(chunk_id==32'h61746164) begin
       phase<=phase+1'b1;
       if(!phase[0]) low_byte<=byte_data;
       else if(channels==1) begin
        pcm_data<={byte_data,low_byte,byte_data,low_byte};pcm_valid<=1;phase<=0;
       end else if(phase==1) left_sample<={byte_data,low_byte};
       else begin pcm_data<={byte_data,low_byte,left_sample};pcm_valid<=1;end
      end
      if(left_bytes==1) begin
       header_pos<=0;state<=chunk_size[0] ? PAD : CHUNK;
       if(chunk_id==32'h61746164) begin data_done<=1;state<=END;end
       // Preserve a format validation error on the final byte of fmt.
       if(chunk_id==32'h20746d66 && body_pos==15 &&
          (format!=1 || (channels!=1 && channels!=2) || rate!=48000 ||
           {byte_data,bits[7:0]}!=16 || alignment!=(channels==1 ? 2 : 4) ||
           byte_rate!=(channels==1 ? 96000 : 192000))) state<=FAIL;
      end
     end
     PAD:begin state<=CHUNK;header_pos<=0;end
     default:;
    endcase
    if(offset>=file_size || (state!=RIFF && state!=END && offset>=riff_end)) fail(8'h32);
   end
   if(file_done && !data_done && error==0) fail(8'h35);
  end
 end
endmodule
