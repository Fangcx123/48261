// Lesson 7 file stream. Every cluster transition follows FAT, never assumes
// contiguous allocation. Brent cycle detection uses constant register space.
module fat32_file_streamer #(parameter integer MAX_VISITED_CLUSTERS=32768,
 parameter integer THROTTLE=0)(
 input clk,rst_n,file_start,input [31:0] first_cluster,file_size,
 input [7:0] sectors_per_cluster,input [31:0] fat_start_lba,data_start_lba,max_cluster,
 output file_busy,output reg file_done,file_valid,output reg [7:0] file_byte,
 output reg [31:0] file_byte_offset,output reg [7:0] fs_error,
 output reg sector_req,output reg [31:0] sector_lba,input sector_busy,sector_valid,
 input [7:0] sector_byte,input [8:0] sector_byte_index,input sector_done,input [7:0] sector_error,
 input sector_allow
);
 localparam IDLE=0,ADDR=1,DATA_REQ=2,DATA_WAIT=3,FAT_REQ=4,FAT_WAIT=5,PARSE=6,FINISH=7,
  ADDR_SHIFT=8,ADDR_ADD=9;
 reg [3:0] state;
 reg [2:0] spc_shift;
 reg [31:0] cluster_offset;
 reg [31:0] current_cluster,remaining,fat_value,offset;
 reg [31:0] anchor,power_count,span,visited;
 reg [7:0] sector_in_cluster;
 reg final_check;
 reg anchor_due;
 // Span/power remain stable throughout each sector transaction.
 always @(posedge clk or negedge rst_n)
  if(!rst_n) anchor_due<=0;else anchor_due<=(span+1==power_count);
 wire [27:0] next_cluster=fat_value[27:0];
 assign file_busy=(state!=IDLE);
 task fail;input [7:0] code;begin fs_error<=code;state<=FINISH;end endtask
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
   state<=IDLE;file_done<=0;file_valid<=0;file_byte<=0;file_byte_offset<=0;fs_error<=0;
   sector_req<=0;sector_lba<=0;spc_shift<=0;current_cluster<=0;remaining<=0;fat_value<=0;
   offset<=0;anchor<=0;power_count<=1;span<=0;visited<=0;sector_in_cluster<=0;final_check<=0;cluster_offset<=0;
  end else begin
   file_done<=0;file_valid<=0;sector_req<=0;
   if(state==DATA_WAIT && sector_valid && remaining!=0) begin
    file_valid<=1;file_byte<=sector_byte;file_byte_offset<=offset;
    offset<=offset+1'b1;remaining<=remaining-1'b1;
   end
   if(state==FAT_WAIT && sector_valid && sector_byte_index[8:2]==current_cluster[6:0]) begin
    case(sector_byte_index[1:0])
     0:fat_value[7:0]<=sector_byte;1:fat_value[15:8]<=sector_byte;
     2:fat_value[23:16]<=sector_byte;3:fat_value[31:24]<=sector_byte;
    endcase
   end
   case(state)
    IDLE:if(file_start) begin
     fs_error<=0;remaining<=file_size;offset<=0;file_byte_offset<=0;
     current_cluster<=first_cluster;sector_in_cluster<=0;final_check<=0;
     anchor<=first_cluster;power_count<=1;span<=0;visited<=1;
     case(sectors_per_cluster)
      1:spc_shift<=0;2:spc_shift<=1;4:spc_shift<=2;8:spc_shift<=3;
      16:spc_shift<=4;32:spc_shift<=5;64:spc_shift<=6;128:spc_shift<=7;
     endcase
     if(file_size==0) state<=FINISH;
     else if(first_cluster<2 || first_cluster>max_cluster || file_size>32'h01000000 ||
      sectors_per_cluster==0 || sectors_per_cluster>128 ||
      (sectors_per_cluster & (sectors_per_cluster-1'b1))!=0) fail(8'h24);
     else state<=ADDR;
    end
    // Separate subtract, variable shift and add: no single 100 MHz path
    // traverses both carry chains and the barrel shifter. Sector semantics
    // unchanged; two additional control clocks per FAT cluster.
    ADDR:begin cluster_offset<=current_cluster-2;state<=ADDR_SHIFT;end
    ADDR_SHIFT:begin cluster_offset<=cluster_offset<<spc_shift;state<=ADDR_ADD;end
    ADDR_ADD:begin sector_lba<=data_start_lba+cluster_offset;state<=DATA_REQ;end
    DATA_REQ:if(!sector_busy && (!THROTTLE || sector_allow)) begin sector_req<=1;state<=DATA_WAIT;end
    DATA_WAIT:if(sector_done) begin
     if(sector_error!=0) fail(8'h10);
     else if(remaining==0 || (remaining==1 && sector_valid)) begin
      final_check<=1;sector_lba<=fat_start_lba+(current_cluster>>7);state<=FAT_REQ;
     end else if(sector_in_cluster+1'b1<sectors_per_cluster) begin
      sector_in_cluster<=sector_in_cluster+1'b1;sector_lba<=sector_lba+1'b1;state<=DATA_REQ;
     end else begin
      sector_lba<=fat_start_lba+(current_cluster>>7);state<=FAT_REQ;
     end
    end
    FAT_REQ:if(!sector_busy) begin sector_req<=1;state<=FAT_WAIT;end
    FAT_WAIT:if(sector_done) begin
     if(sector_error!=0) fail(8'h10);else state<=PARSE;
    end
    PARSE:begin
     if(final_check) begin
      // Ordinary copied BMPs must end at EOC. Reject extra allocated chains.
      if(next_cluster>=28'hffffff8) state<=FINISH;
      else if(next_cluster<2 || next_cluster>max_cluster) fail(8'h24);
      else fail(8'h23);
     end else if(next_cluster>=28'hffffff8) fail(8'h25);
     else if(next_cluster<2 || next_cluster>max_cluster) fail(8'h24);
     else if(next_cluster==current_cluster || next_cluster==anchor) fail(8'h23);
     else if(visited>=MAX_VISITED_CLUSTERS) fail(8'h26);
     else begin
      if(anchor_due) begin anchor<={4'd0,next_cluster};span<=0;power_count<=power_count<<1;end
      else span<=span+1'b1;
      visited<=visited+1'b1;current_cluster<={4'd0,next_cluster};sector_in_cluster<=0;state<=ADDR;
     end
    end
    FINISH:begin file_done<=1;state<=IDLE;end
    default:state<=IDLE;
   endcase
  end
 end
endmodule
