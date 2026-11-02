// Lesson 7: read-only FAT32 mount and exact root-directory PIC1..PIC4 lookup.
// Streaming field extraction avoids a 512-byte multi-read-port register bank.
module fat32_volume_scanner #(parameter integer MAX_ROOT_CLUSTERS=1024,
 parameter integer AUDIO_FILE=0)(
 input clk,rst_n,scan_start, output scan_busy,output reg scan_done,
 output reg [7:0] fs_error,output reg [31:0] partition_lba,
 output reg [7:0] sectors_per_cluster,output reg [31:0] fat_start_lba,data_start_lba,max_cluster,
 output reg [3:0] resource_valid,
 output [31:0] resource0_cluster,resource1_cluster,resource2_cluster,resource3_cluster,
 output [31:0] resource0_size,resource1_size,resource2_size,resource3_size,
 output reg sector_req,output reg [31:0] sector_lba,
 input sector_busy,sector_valid,input [7:0] sector_byte,input [8:0] sector_byte_index,
 input sector_done,input [7:0] sector_error
);
 localparam IDLE=0,REQ=1,WAIT=2,BOOT=3,PART=4,BPB1=5,BPB2=6,BPB3=7,
  BPB4=8,ROOT_ADDR=9,ROOT_NEXT=10,FAT_PARSE=11,FINISH=12;
 localparam K_BOOT=0,K_BPB=1,K_ROOT=2,K_FAT=3;
 reg [3:0] state;reg [1:0] kind,part_index;
 reg [31:0] part_start[0:3],part_size[0:3];reg [7:0] part_type[0:3];
 reg [31:0] clusters[0:3],sizes[0:3];
 assign resource0_cluster=clusters[0];assign resource1_cluster=clusters[1];
 assign resource2_cluster=clusters[2];assign resource3_cluster=clusters[3];
 assign resource0_size=sizes[0];assign resource1_size=sizes[1];
 assign resource2_size=sizes[2];assign resource3_size=sizes[3];
 assign scan_busy=(state!=IDLE);
 reg [15:0] bps,reserved,root_entries,total16,fat16,ext_flags,version,signature;
 reg [7:0] fat_count;reg [31:0] total,fat_size,root_cluster;
 reg [32:0] volume_end,fat_end,data_calc;
 reg [31:0] partition_size,data_sectors,cluster_count,root_current;
 reg [2:0] spc_shift;
 reg [7:0] root_sector;
 reg [31:0] fat_value;
 reg [31:0] chain_anchor,chain_power,chain_span,chain_count;
 reg [3:0] name_match;reg [7:0] entry_attr,entry_first;
 reg [31:0] entry_cluster,entry_size;
 reg directory_end;
 integer i;
 wire [4:0] entry_offset=sector_byte_index[4:0];
 wire [8:0] mbr_offset=sector_byte_index-9'd446;
 wire [27:0] next_cluster=fat_value[27:0];
 function [7:0] expected_name;
  input [4:0] pos;input integer slot;
  begin if(AUDIO_FILE) begin
   case(pos)
    0:expected_name="A";1:expected_name="U";2:expected_name="D";
    3:expected_name="I";4:expected_name="O";
    8:expected_name="W";9:expected_name="A";10:expected_name="V";
    default:expected_name=" ";
   endcase
  end else case(pos)
   0:expected_name="P";1:expected_name="I";2:expected_name="C";
   3:expected_name=8'h31+slot;8:expected_name="B";9:expected_name="M";10:expected_name="P";
   default:expected_name=" ";endcase end
 endfunction
 task fail;input [7:0] code;begin fs_error<=code;resource_valid<=0;state<=FINISH;end endtask
 task finish_directory;begin
  if(resource_valid==0) fs_error<=8'h22;
  state<=FINISH;
 end endtask
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
   state<=IDLE;scan_done<=0;sector_req<=0;sector_lba<=0;fs_error<=0;
   partition_lba<=0;sectors_per_cluster<=0;fat_start_lba<=0;data_start_lba<=0;max_cluster<=0;
   resource_valid<=0;kind<=K_BOOT;part_index<=0;partition_size<=0;
   bps<=0;reserved<=0;root_entries<=0;total16<=0;fat16<=0;ext_flags<=0;version<=0;signature<=0;
   fat_count<=0;total<=0;fat_size<=0;root_cluster<=0;volume_end<=0;fat_end<=0;data_calc<=0;
   data_sectors<=0;cluster_count<=0;root_current<=0;spc_shift<=0;root_sector<=0;fat_value<=0;
   chain_anchor<=0;chain_power<=1;chain_span<=0;chain_count<=0;
   name_match<=0;entry_attr<=0;entry_first<=0;entry_cluster<=0;entry_size<=0;directory_end<=0;
   for(i=0;i<4;i=i+1) begin part_start[i]<=0;part_size[i]<=0;part_type[i]<=0;clusters[i]<=0;sizes[i]<=0;end
  end else begin
   scan_done<=0;sector_req<=0;
   if(state==WAIT && sector_valid) begin
    if(kind==K_BOOT || kind==K_BPB) begin
     case(sector_byte_index)
      11:bps[7:0]<=sector_byte;12:bps[15:8]<=sector_byte;
      13:sectors_per_cluster<=sector_byte;
      14:reserved[7:0]<=sector_byte;15:reserved[15:8]<=sector_byte;16:fat_count<=sector_byte;
      17:root_entries[7:0]<=sector_byte;18:root_entries[15:8]<=sector_byte;
      19:total16[7:0]<=sector_byte;20:total16[15:8]<=sector_byte;
      22:fat16[7:0]<=sector_byte;23:fat16[15:8]<=sector_byte;
      32:total[7:0]<=sector_byte;33:total[15:8]<=sector_byte;34:total[23:16]<=sector_byte;35:total[31:24]<=sector_byte;
      36:fat_size[7:0]<=sector_byte;37:fat_size[15:8]<=sector_byte;38:fat_size[23:16]<=sector_byte;39:fat_size[31:24]<=sector_byte;
      40:ext_flags[7:0]<=sector_byte;41:ext_flags[15:8]<=sector_byte;
      42:version[7:0]<=sector_byte;43:version[15:8]<=sector_byte;
      44:root_cluster[7:0]<=sector_byte;45:root_cluster[15:8]<=sector_byte;
      46:root_cluster[23:16]<=sector_byte;47:root_cluster[31:24]<=sector_byte;
      510:signature[7:0]<=sector_byte;511:signature[15:8]<=sector_byte;
      default:;
     endcase
     if(kind==K_BOOT && sector_byte_index>=446 && sector_byte_index<510) begin
      case(mbr_offset[3:0])
       4:part_type[mbr_offset[5:4]]<=sector_byte;
       8:part_start[mbr_offset[5:4]][7:0]<=sector_byte;
       9:part_start[mbr_offset[5:4]][15:8]<=sector_byte;
       10:part_start[mbr_offset[5:4]][23:16]<=sector_byte;
       11:part_start[mbr_offset[5:4]][31:24]<=sector_byte;
       12:part_size[mbr_offset[5:4]][7:0]<=sector_byte;
       13:part_size[mbr_offset[5:4]][15:8]<=sector_byte;
       14:part_size[mbr_offset[5:4]][23:16]<=sector_byte;
       15:part_size[mbr_offset[5:4]][31:24]<=sector_byte;
       default:;
      endcase
     end
    end else if(kind==K_ROOT && !directory_end) begin
     if(entry_offset==0) begin
      entry_first<=sector_byte;
      if(sector_byte==0) directory_end<=1;
      for(i=0;i<4;i=i+1) name_match[i]<=(sector_byte==expected_name(0,i));
     end else if(entry_offset<=10) begin
      for(i=0;i<4;i=i+1) if(sector_byte!=expected_name(entry_offset,i)) name_match[i]<=0;
     end
     case(entry_offset)
      11:entry_attr<=sector_byte;
      20:entry_cluster[23:16]<=sector_byte;21:entry_cluster[31:24]<=sector_byte;
      26:entry_cluster[7:0]<=sector_byte;27:entry_cluster[15:8]<=sector_byte;
      28:entry_size[7:0]<=sector_byte;29:entry_size[15:8]<=sector_byte;30:entry_size[23:16]<=sector_byte;
      31:begin
       entry_size[31:24]<=sector_byte;
       for(i=0;i<4;i=i+1) if(name_match[i] && !resource_valid[i] && entry_first!=8'he5 &&
         (entry_attr & 8'hd8)==0) begin
        clusters[i]<=entry_cluster;sizes[i]<={sector_byte,entry_size[23:0]};resource_valid[i]<=1;
       end
      end
      default:;
     endcase
    end else if(kind==K_FAT && sector_byte_index[8:2]==root_current[6:0]) begin
     case(sector_byte_index[1:0])
      0:fat_value[7:0]<=sector_byte;1:fat_value[15:8]<=sector_byte;
      2:fat_value[23:16]<=sector_byte;3:fat_value[31:24]<=sector_byte;
     endcase
    end
   end
   case(state)
    IDLE:if(scan_start) begin
     fs_error<=0;resource_valid<=0;partition_lba<=0;partition_size<=0;
     directory_end<=0;part_index<=0;kind<=K_BOOT;sector_lba<=0;state<=REQ;
    end
    REQ:if(!sector_busy) begin sector_req<=1;state<=WAIT;end
    WAIT:if(sector_done) begin
     if(sector_error!=0) fail(8'h10);
     else case(kind)
      K_BOOT:state<=BOOT;K_BPB:state<=BPB1;K_ROOT:state<=ROOT_NEXT;K_FAT:state<=FAT_PARSE;
     endcase
    end
    BOOT:begin
     if(signature!=16'haa55) fail(8'h20);
     else if(bps==512 && reserved!=0 && fat_size!=0 && root_entries==0 && fat16==0)
      state<=BPB1;
     else state<=PART;
    end
    PART:begin
     if((part_type[part_index]==8'h0b || part_type[part_index]==8'h0c) &&
        part_start[part_index]!=0 && part_size[part_index]!=0) begin
      partition_lba<=part_start[part_index];partition_size<=part_size[part_index];
      sector_lba<=part_start[part_index];kind<=K_BPB;state<=REQ;
     end else if(part_index==3) fail(8'h21);else part_index<=part_index+1'b1;
    end
    BPB1:begin
     if(signature!=16'haa55) fail(8'h20);
     else if(bps!=512 || sectors_per_cluster==0 || sectors_per_cluster>128 ||
       (sectors_per_cluster & (sectors_per_cluster-1'b1))!=0 || reserved==0 ||
       (fat_count!=1 && fat_count!=2) || root_entries!=0 || total16!=0 || fat16!=0 ||
       version!=0 || fat_size==0 || fat_size>32'h01ffffff || total==0 ||
       (partition_size!=0 && total>partition_size) ||
       (ext_flags[7] && ext_flags[3:0]>=fat_count)) fail(8'h21);
     else begin
      case(sectors_per_cluster)
       1:spc_shift<=0;2:spc_shift<=1;4:spc_shift<=2;8:spc_shift<=3;
       16:spc_shift<=4;32:spc_shift<=5;64:spc_shift<=6;128:spc_shift<=7;
      endcase
      volume_end<={1'b0,partition_lba}+{1'b0,total};
      fat_end<={1'b0,partition_lba}+reserved;
      state<=BPB2;
     end
    end
    BPB2:begin
     data_calc<=fat_end+(fat_count==2 ? {fat_size,1'b0}:{1'b0,fat_size});
     fat_start_lba<=fat_end[31:0]+((ext_flags[7] && ext_flags[3:0]==1) ? fat_size:32'd0);
     state<=BPB3;
    end
    BPB3:begin
     if(volume_end>33'h100000000 || fat_end[32] || data_calc>=volume_end || data_calc[32]) fail(8'h21);
     else begin
      data_start_lba<=data_calc[31:0];data_sectors<=volume_end-data_calc;state<=BPB4;
     end
    end
    BPB4:begin
     cluster_count<=data_sectors>>spc_shift;
     max_cluster<=(data_sectors>>spc_shift)+1'b1;
     state<=ROOT_ADDR;root_current<=root_cluster;
     chain_anchor<=root_cluster;chain_span<=0;chain_power<=1;chain_count<=1;root_sector<=0;
    end
    ROOT_ADDR:begin
     if(cluster_count<65525 || max_cluster>=32'h0ffffff0 || (fat_size<<7)<=max_cluster ||
       root_current<2 || root_current>max_cluster) fail(8'h21);
     else begin sector_lba<=data_start_lba+((root_current-2)<<spc_shift);kind<=K_ROOT;state<=REQ;end
    end
    ROOT_NEXT:begin
     if(directory_end || resource_valid==4'hf) finish_directory;
     else if(root_sector+1'b1<sectors_per_cluster) begin
      root_sector<=root_sector+1'b1;sector_lba<=sector_lba+1'b1;state<=REQ;
     end else begin
      kind<=K_FAT;sector_lba<=fat_start_lba+(root_current>>7);state<=REQ;
     end
    end
    FAT_PARSE:begin
     if(next_cluster>=28'hffffff8) finish_directory;
     else if(next_cluster<2 || next_cluster>max_cluster) fail(8'h24);
     else if(next_cluster==root_current || next_cluster==chain_anchor) fail(8'h23);
     else if(chain_count>=MAX_ROOT_CLUSTERS) fail(8'h26);
     else begin
      if(chain_span+1==chain_power) begin chain_anchor<={4'd0,next_cluster};chain_span<=0;chain_power<=chain_power<<1;end
      else chain_span<=chain_span+1'b1;
      chain_count<=chain_count+1'b1;root_current<={4'd0,next_cluster};root_sector<=0;state<=ROOT_ADDR;
     end
    end
    FINISH:begin scan_done<=1;state<=IDLE;end
    default:state<=IDLE;
   endcase
  end
 end
endmodule
