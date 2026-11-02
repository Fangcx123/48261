module EG_LOGIC_BRAM (
  dia,
  addra, cea, ocea, clka, wea, rsta, bea,
  dib,
  addrb, ceb, oceb, clkb, web, rstb, beb,
  doa,
  dob);
  parameter DATA_WIDTH_A = 9;                                                // DEFAULT 9.
  parameter DATA_WIDTH_B = DATA_WIDTH_A;                                     // DEFAULT 9.
  parameter ADDR_WIDTH_A = 10;                                               // DEFAULT 10.
  parameter ADDR_WIDTH_B = ADDR_WIDTH_A;                                     // DEFAULT 10.
  parameter DATA_DEPTH_A = 2 ** ADDR_WIDTH_A;                                // DEFAULT 1024.
  parameter DATA_DEPTH_B = 2 ** ADDR_WIDTH_B;                                // DEFAULT 1024.
  parameter BYTE_ENABLE = 0;                                                 // 0, 8, 9.
  parameter BYTE_A = BYTE_ENABLE == 0 ? 1 : DATA_WIDTH_A / BYTE_ENABLE;      
  parameter BYTE_B = BYTE_ENABLE == 0 ? 1 : DATA_WIDTH_B / BYTE_ENABLE;      
  output  [DATA_WIDTH_A-1:0] doa;                                             
  output  [DATA_WIDTH_B-1:0] dob;                                             
  input   [DATA_WIDTH_A-1:0] dia; 
  input   [DATA_WIDTH_B-1:0] dib; 
  input   cea;   
  input   ocea;  
  input   clka;  
  input   wea;   
  input   rsta; 
  input   ceb;   
  input	  oceb; 
  input   clkb; 
  input   web; 
  input   rstb; 
  input [BYTE_A - 1 : 0] bea; 
  input [BYTE_B - 1 : 0] beb; 
  input   [ADDR_WIDTH_A-1:0] addra; 
  input   [ADDR_WIDTH_B-1:0] addrb; 
  parameter MODE = "DP";                  // "DP", "SP", "PDPW", "FIFO".
  parameter REGMODE_A = "NOREG";          // "NOREG", "OUTREG".
  parameter REGMODE_B = "NOREG";          // "NOREG", "OUTREG".
  parameter WRITEMODE_A = "NORMAL";       // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH".
  parameter WRITEMODE_B = "NORMAL";       // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH".
  parameter RESETMODE = "SYNC";           // "SYNC", "ASYNC".
  parameter DEBUGGABLE = "NO";            // "YES", "NO".
  parameter PACKABLE = "NO";              // "YES", "NO".
  parameter FORCE_KEEP = "OFF";           // "ON", "OFF".
  parameter INIT_FILE = "NONE";           // DEFAULT "NONE".
  parameter FILL_ALL = "NONE";            // "NONE", "0101".
  parameter IMPLEMENT = "9K";             // "9K", "9K(FAST)", "32K(all capitalized)".

reg [DATA_WIDTH_A-1:0] mem[0:DATA_DEPTH_A-1];
reg [DATA_WIDTH_A-1:0] qa;
assign doa=qa;assign dob=0;
integer i,j,k,word,bitn;reg [7:0] c;
initial begin
 for(i=0;i<DATA_DEPTH_A;i=i+1) mem[i]=0;
 word=0;bitn=0;
 for(i=$bits(INIT_FILE)/8-10;i>=0;i=i-1)begin
  c=INIT_FILE[i*8+:8];
  if(c=="0" || c=="1")begin mem[word][bitn]=(c=="1");bitn=bitn+1;end
  else if(bitn>0)begin word=word+1;bitn=0;end
 end
end
always @(posedge clka or posedge rsta)
 if(rsta)qa<=0;else if(cea)qa<=mem[addra];
endmodule
