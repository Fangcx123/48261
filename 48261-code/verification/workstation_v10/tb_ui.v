`timescale 1ns/1ps
module tb_ui;
 reg clk=0,rst=1,ready=0,busy=0,ns=0,nl=0,ms=0,ml=0;always #5 clk=~clk;
 reg [1:0] cur=2;reg [3:0] complete=4'b0101;
 reg sw=0,pr=1,home=0;wire req,view;wire [1:0] idx,mode,focus;wire [2:0] field;reg ab=1,av=1;wire replay;wire [7:0] b,c,v;wire [5:0] p;
 media_ui_controller dut(clk,rst,ready,busy,ns,nl,ms,ml,cur,complete,req,idx,view,mode,focus,field,b,c,v,p,ab,av,replay,sw,pr,home);
 task event_key;input [3:0] key;
 begin {ns,nl,ms,ml}=key;@(negedge clk);{ns,nl,ms,ml}=0;end endtask
 initial begin
  repeat(3)@(negedge clk);rst=0;event_key(1);if(mode!=0)$fatal(1,"not ready");
  ready=1;event_key(1);if(mode!=1 || !req || !view || idx!=2 || focus!=2)$fatal(1,"enter");
  event_key(8);if(focus!=3)$fatal(1,"focus");event_key(2);if(mode!=1 || req)$fatal(1,"incomplete selected");
  event_key(8);if(focus!=0)$fatal(1,"wrap");event_key(4);if(focus!=3)$fatal(1,"previous wrap");
  busy=1;event_key(8);if(focus!=3)$fatal(1,"busy focus");busy=0;
  event_key(4);event_key(2);if(mode!=0 || !req || view || idx!=2)$fatal(1,"confirm");
  sw=1;event_key(1);if(mode!=2 || field!=0)$fatal(1,"menu");
  event_key(4);if(b!=192)$fatal(1,"brightness");event_key(2);event_key(8);if(c!=192)$fatal(1,"contrast");
  event_key(2);event_key(4);if(v!=64)$fatal(1,"volume");event_key(2);event_key(8);if(p!=5)$fatal(1,"period");
  event_key(2);if(field!=4)$fatal(1,"R menu missing");
  event_key(8);if(replay || mode!=2 || req)$fatal(1,"busy replay accepted");
  ab=0;av=0;event_key(8);if(replay || mode!=2)$fatal(1,"unavailable replay accepted");
  av=1;event_key(4);if(replay)$fatal(1,"long press replay");
  event_key(8);if(!replay || mode!=0 || !req || view || idx!=0)$fatal(1,"R return/replay");
  event_key(1);sw=0;
  event_key(1);if(mode!=0 || !req || view || idx!=cur)$fatal(1,"menu exit");
  pr=0;event_key(1);if(mode!=0)$fatal(1,"preview entered before built");
  pr=1;event_key(1);sw=1;event_key(1);if(mode!=0)$fatal(1,"preview exit depends on switch");
  event_key(1);if(mode!=2)$fatal(1,"direct settings");home=1;@(negedge clk);home=0;
  if(mode!=0)$fatal(1,"end of speech must exit menu");
  rst=1;@(negedge clk);rst=0;@(negedge clk);if(b!=255 || c!=128 || v!=96 || p!=3)$fatal(1,"defaults");
  $display("PASS UI ready/busy/wrap/missing/confirm/menu/defaults");$finish;
 end
endmodule
