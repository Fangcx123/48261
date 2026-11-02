// Three aligned stages, signed center/contrast arithmetic with saturation.
// B=255 and C=128 are exact identity, including the least significant bits.
module brightness_contrast_adjust(
 input clk,rst,vs,de,input [23:0] rgb,input [7:0] brightness,contrast,
 output reg vs_out,de_out,output reg [23:0] rgb_out
);
 reg [15:0] mult[0:2];reg [7:0] raw[0:2],c1;
 reg bypass1;reg v1,d1,v2,d2;
 reg signed [18:0] adjusted[0:2];integer i;
 wire [7:0] channel[0:2];assign channel[0]=rgb[23:16];assign channel[1]=rgb[15:8];assign channel[2]=rgb[7:0];
 function [7:0] clip;input signed [18:0] a;reg signed [18:0] value;
 begin value=(a>>>7)+19'sd128;clip=value<0 ? 8'd0 : value>255 ? 8'd255 : value[7:0];end endfunction
 always @(posedge clk or posedge rst) begin
  if(rst) begin
   v1<=1;d1<=0;v2<=1;d2<=0;vs_out<=1;de_out<=0;rgb_out<=0;c1<=128;bypass1<=1;
   for(i=0;i<3;i=i+1) begin mult[i]<=0;raw[i]<=0;adjusted[i]<=0;end
  end else begin
   v1<=vs;d1<=de;v2<=v1;d2<=d1;vs_out<=v2;de_out<=d2;c1<=contrast;bypass1<=brightness==255;
   for(i=0;i<3;i=i+1) begin
    mult[i]<=channel[i]*brightness;raw[i]<=channel[i];
    adjusted[i]<=($signed({1'b0,(bypass1 ? raw[i] : mult[i][15:8])})-9'sd128)*$signed({1'b0,c1});
   end
   rgb_out<=d2 ? {clip(adjusted[0]),clip(adjusted[1]),clip(adjusted[2])} : 24'd0;
  end
 end
endmodule
