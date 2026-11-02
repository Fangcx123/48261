`timescale 1ns/1ps
module tb_scaled_fat;
reg clk=0,rst=1,io_reset=0,scan=0,load=0;always #5 clk=~clk;
wire [11:0] source_width,source_height;wire ready,done,err,scan_done,rd,pix,wr;wire [31:0] lba;wire [23:0] rgb;
wire [3:0] code,mask;wire [7:0] mount_error;reg [7:0] b=0;reg bv=0,se=0;
reg [31:0] slot=0;
fat32_bmp_reader #(.CLK_FREQ_HZ(1000000),.ENABLE_SCALING(1)) dut(
.source_width(source_width),.source_height(source_height),.clk(clk),.rst(rst),.io_reset(io_reset),.ready(ready),.load_done(done),.load_error(err),.bmp_error(code),
.scan_start(scan),.scan_done(scan_done),.resource_mask(mask),.scan_error(mount_error),.load_start(load),.load_sector(slot),
.sd_init_done(!rst && !io_reset),.bmp_width(16'd640),.bmp_height(16'd480),.write_req(wr),.write_req_ack(wr),
.sd_sec_read(rd),.sd_sec_read_addr(lba),.sd_sec_read_data(b),.sd_sec_read_data_valid(bv),.sd_sec_read_end(se),
.bmp_data_wr_en(pix),.bmp_data(rgb));
reg [31:0] lbas[0:4095],count[0:0];reg [7:0] bytes[0:2097151];
integer state=0,base,i,j=0,n=0,w=3,h=5,x,y,sx,sy;reg beat=0;reg [23:0] expect_rgb;string name,path;
always @(negedge clk)begin
 bv=0;se=0;
 if(rst||io_reset)state=0;
 else case(state)
 0:if(rd)begin base=-1;for(i=0;i<count[0];i=i+1)if(lbas[i]===lba)base=i*512;
 if(base<0)$fatal(1,"unknown LBA %d",lba);j=0;beat=0;state=1;end
 1:begin beat=~beat;if(beat)begin b=bytes[base+j];bv=1;if(j==511)begin se=1;state=2;end j=j+1;end end
 2:if(!rd)state=0;
 endcase
end
always @(posedge clk)if(pix)begin
 x=n%640;y=n/640;sx=x*w/640;sy=h-1-((479-y)*h/480);
 expect_rgb={8'((sx*7+sy*11)&255),8'((sx*5+sy)&255),8'((sx+3*sy)&255)};
 if(rgb!==expect_rgb)$fatal(1,"scaled FAT pixel %d got %h want %h",n,rgb,expect_rgb);
 n=n+1;
end
task tick(input integer t);repeat(t)@(negedge clk);endtask
task load_one;begin wait(ready);tick(2);n=0;load=1;tick(1);load=0;wait(done||err);tick(1);end endtask
initial begin
 if(!$value$plusargs("case=%s",name))name="tiny";
 if(name=="odd")begin w=641;h=481;end
 if(name=="latefat")begin w=640;h=480;end
 path={"verification/media_v9/scaled_fixtures/",name,"_count.hex"};$readmemh(path,count);
 path={"verification/media_v9/scaled_fixtures/",name,"_lba.hex"};$readmemh(path,lbas,0,count[0]-1);
 path={"verification/media_v9/scaled_fixtures/",name,"_data.hex"};$readmemh(path,bytes,0,count[0]*512-1);
 tick(3);rst=0;tick(4);scan=1;tick(1);scan=0;wait(scan_done);tick(2);
 if(mask!=5||mount_error)$fatal(1,"mount");load_one;
 if(name=="negative")begin if(code!=2||done||n)$fatal(1,"negative header accepted");end
 else if(name=="compressed")begin if(code!=3||done||n)$fatal(1,"compressed accepted");end
 else if(name=="latefat")begin if(code!=10||done)$fatal(1,"late FAT completed");end
 else begin
 if(source_width!=w || source_height!=h)$fatal(1,"BMP header dimensions wrong");
 if(err||n!=307200)$fatal(1,"scaled FAT result code=%h pixels=%d",code,n);
 if(name=="tiny")begin io_reset=1;tick(4);io_reset=0;tick(4);slot=2;load_one;
 if(err||n!=307200||mask!=5)$fatal(1,"IO reset metadata lost");end
 end
 $display("PASS scaled FAT %s: RGB golden, pixels=%0d, code=%h",name,n,code);$finish;
end
initial begin #150000000;$fatal(1,"scaled FAT timeout %s",name);end
endmodule
