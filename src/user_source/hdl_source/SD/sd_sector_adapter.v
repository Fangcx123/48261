// Bridge the existing level-request SD reader to the lesson 7 sector interface.
// The legacy SPI core discards CRC16: this detects length/stall errors, not CRC.
module sd_sector_adapter #(parameter integer TIMEOUT_CYCLES=100_000_000)(
 input clk, rst, input sector_req, input [31:0] sector_lba,
 output reg sector_busy, output reg sector_valid, output reg [7:0] sector_byte,
 output reg [8:0] sector_byte_index, output reg sector_done, output reg [7:0] sector_error,
 output reg sd_sec_read, output reg [31:0] sd_sec_read_addr,
 input [7:0] sd_sec_read_data, input sd_sec_read_data_valid, sd_sec_read_end
);
 reg [9:0] count;
 reg [31:0] stall;
 reg finishing, overrun;
 // Register the byte bundle before FAT/header field decode. Done remains
 // one clock after the final valid byte, including simultaneous byte/end.
 always @(posedge clk or posedge rst) begin
  if(rst) begin sector_valid<=0;sector_byte<=0;sector_byte_index<=0;end
  else begin
   sector_valid<=sector_busy && !finishing && sd_sec_read_data_valid && count<512;
   sector_byte<=sd_sec_read_data;sector_byte_index<=count[8:0];
  end
 end
 always @(posedge clk or posedge rst) begin
  if(rst) begin
   count<=0;stall<=0;finishing<=0;overrun<=0;sector_busy<=0;
   sector_done<=0;sector_error<=0;sd_sec_read<=0;sd_sec_read_addr<=0;
  end else begin
   sector_done<=0;
   if(!sector_busy) begin
    if(sector_req) begin
     sector_busy<=1;sd_sec_read<=1;sd_sec_read_addr<=sector_lba;
     count<=0;stall<=0;overrun<=0;sector_error<=0;
    end
   end else if(finishing) begin
    // Publish done after the last byte, including a simultaneous byte/end.
    finishing<=0;sector_busy<=0;sector_done<=1;
   end else begin
    if(sd_sec_read_data_valid) begin
     stall<=0;
     if(count<512) count<=count+1'b1;else overrun<=1;
    end else stall<=stall+1'b1;
    if(sd_sec_read_end) begin
     sd_sec_read<=0;finishing<=1;
     if(overrun || (count + (sd_sec_read_data_valid ? 11'd1:11'd0))!=512)
      sector_error<=8'h11;
    end else if(sd_sec_read_data_valid && count>=512) begin
     sd_sec_read<=0;finishing<=1;sector_error<=8'h11;
    end else if(stall>=TIMEOUT_CYCLES-1) begin
     sd_sec_read<=0;finishing<=1;sector_error<=8'h12;
    end
   end
  end
 end
endmodule
