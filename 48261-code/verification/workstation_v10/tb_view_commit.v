`timescale 1ns/1ps
module tb_view_commit;
reg clk=0,rst=1,token=0,view=0,req=0,ack=0;reg [1:0] bank=0,id=0;
reg [23:0] dimensions=0;wire [23:0] display_dimensions;reg [23:0] previous_dimensions=0;
wire ret,outview,on,readview;wire [1:0] rb,oid;always #20 clk=~clk;
frame_commit_cdc #(.ENABLE_VIEW(1),.ENABLE_DIMENSIONS(1)) dut(.clk(clk),.rst(rst),.commit_toggle(token),.commit_bank(bank),
.commit_dimensions(dimensions),.display_dimensions(display_dimensions),.commit_id(id),.commit_valid(1'b1),.commit_view(view),.frame_read_req(req),.frame_read_ack(ack),
.commit_ack(ret),.read_bank(rb),.media_id(oid),.display_valid(on),.display_thumbnail(outview),.read_thumbnail(readview));
task tick(input integer n);repeat(n)@(negedge clk);endtask
integer j;
initial begin
 tick(3);rst=0;
 for(j=0;j<8;j=j+1)begin
 case(j%4)
0:dimensions={12'd320,12'd240};1:dimensions={12'd640,12'd480};
2:dimensions={12'd1024,12'd768};3:dimensions={12'd1920,12'd1080};endcase
 bank=j%4;id=j%4;view=j%2;token=~token;tick(8);
 if(ret==token||outview==view&&j==1)$fatal(1,"early commit");
 req=1;tick(2);req=0;
 if(rb!=bank||readview!=view||ret==token)$fatal(1,"read request");
 if(display_dimensions!==previous_dimensions)$fatal(1,"dimensions changed before display ACK");
 tick(8);ack=1;tick(1);ack=0;
 if(ret!=token||oid!=id||outview!=view||!on)$fatal(1,"view/bank not atomic");
 if(display_dimensions!==dimensions)$fatal(1,"dimensions not atomic with image");
 previous_dimensions=dimensions;
 end
 $display("PASS view mailbox: target bank/view held through reader ACK, no early display change");$finish;
end
endmodule
