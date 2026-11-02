`timescale 1ns/1ps
// Exercise the real command, sector and bit-level SPI engines together.
// This is a protocol model; it does not model board supply ramps or signal integrity.
module tb_sd_startup;
reg clk=0, rst=1, miso=1, read_req=0;
always #5 clk=~clk;
wire cs, sclk, mosi, ready;
wire [3:0] init_stage;
wire [7:0] response_r1;
wire [7:0] data;
wire valid, read_end;
localparam WAIT_CYCLES=1000;
sd_card_top #(.SPI_LOW_SPEED_DIV(2), .SPI_HIGH_SPEED_DIV(1),
              .POWER_ON_CYCLES(WAIT_CYCLES)) dut (
    .clk(clk), .rst(rst), .SD_nCS(cs), .SD_DCLK(sclk),
    .SD_MOSI(mosi), .SD_MISO(miso), .sd_init_done(ready), .init_stage(init_stage),
    .response_r1(response_r1),
    .sd_sec_read(read_req), .sd_sec_read_addr(32'd123),
    .sd_sec_read_data(data), .sd_sec_read_data_valid(valid), .sd_sec_read_end(read_end),
    .sd_sec_write(1'b0), .sd_sec_write_addr(32'd0), .sd_sec_write_data(8'd0),
    .sd_sec_write_data_req(), .sd_sec_write_end()
);
integer cycles=0, bits=0, bytes=0, startup_bytes=0;
integer acmd_attempts=0, cmd0_count=0, cmd16_count=0, cmd17_count=0;
integer ready_cmd55_count=0, cmd55_count=0;
reg corrupt_ready, drop_ready, reject_cmd55, late_r1;
initial begin
    corrupt_ready=$test$plusargs("corrupt_ready");
    drop_ready=$test$plusargs("drop_ready");
    reject_cmd55=$test$plusargs("reject_cmd55");
    late_r1=$test$plusargs("late_r1");
end
integer reply_pos=0, reply_len=0;
reg [7:0] rx=0, tx=8'hff;
reg [7:0] reply[0:15];
reg [7:0] packet[0:5];
reg app_pending=0, card_idle=1, cmd16_delivered=0;
reg first_cmd=1;
integer id;

always @(posedge clk) begin
    if (rst) cycles<=0;
    else begin
        cycles<=cycles+1;
        if(cycles < WAIT_CYCLES-1 && (!cs || mosi!==1'b1 || dut.spi_wr_req))
            $fatal(1,"SD activity before power settling delay");
        if(ready && !cmd16_delivered)
            $fatal(1,"init_done asserted before successful CMD16 R1");
        if(!ready && dut.spi_clk_div != 2)
            $fatal(1,"high-speed switch before initialization completion");
        if(cycles>100000) $fatal(1,"SD startup/retry deadlock: stage=%0d card_idle=%0d ready_CMD55=%0d",init_stage,card_idle,ready_cmd55_count);
    end
end

// Mode 3: drive MISO on falling SCLK, sample MOSI on rising SCLK.
always @(negedge sclk) begin
    if(!rst && !cs) miso=tx[7-bits];
    else miso=1;
end
always @(posedge cs) begin
    bits=0; bytes=0; rx=0; tx=8'hff;
    reply_pos=0; reply_len=0; miso=1;
end
always @(posedge sclk) begin
    if(!rst && cycles>2) begin
        rx={rx[6:0],mosi};
        if(bits==7) begin
            bits=0;
            if(cs) begin
                if(rx!==8'hff) $fatal(1,"MOSI must stay high during startup clocks");
                startup_bytes=startup_bytes+1;
            end else begin
                if(bytes<6) packet[bytes]=rx;
                bytes=bytes+1;
                tx=8'hff;
                if(bytes==6) begin
                    id=packet[0] & 8'h3f;
                    if(first_cmd) begin
                        if(startup_bytes<11 || cycles<WAIT_CYCLES)
                            $fatal(1,"Missing delayed startup clocks");
                        first_cmd=0;
                    end
                    reply_pos=0; reply_len=1;
                    case(id)
                    0: begin
                        cmd0_count=cmd0_count+1; card_idle=1; app_pending=0;
                        if(reject_cmd55 && cmd0_count==2 && response_r1!==8'h04)
                            $fatal(1,"CMD55 error response not captured");
                        reply[0]=1;
                    end
                    8: begin
                        reply[0]=1; reply[1]=0; reply[2]=0;
                        reply[3]=1; reply[4]=8'haa; reply_len=5;
                    end
                    55: begin
                        cmd55_count=cmd55_count+1;
                        if(!card_idle) begin
                            ready_cmd55_count=ready_cmd55_count+1;
                            if(drop_ready && response_r1!==8'hff)
                                $fatal(1,"missing response was not recorded as FF");
                            if(corrupt_ready && response_r1!==8'h04)
                                $fatal(1,"wrong R1 was not recorded");
                        end
                        app_pending=1; reply[0]=card_idle ? 1 : 0;
                        if(reject_cmd55 && cmd55_count==1) reply[0]=4;
                    end
                    41: begin
                        if(!app_pending) $fatal(1,"ACMD41 without CMD55");
                        app_pending=0; acmd_attempts=acmd_attempts+1;
                        reply[0]=(acmd_attempts<=2) ? 1 : 0;
                        if(reply[0]==0) card_idle=0;
                        // The card becomes ready, but the host misses that R1.
                        // Subsequent CMD55 legitimately replies 00, not 01.
                        if(acmd_attempts==3 && corrupt_ready) reply[0]=4;
                        if(acmd_attempts==3 && drop_ready) reply[0]=8'hff;
                    end
                    16: begin
                        if({packet[1],packet[2],packet[3],packet[4]}!=512)
                            $fatal(1,"Wrong block length");
                        cmd16_count=cmd16_count+1;
                        // First attempt fails after ACMD41 has left idle.
                        // Second succeeds after several R1 wait bytes.
                        if(cmd16_count==1) reply[0]=4;
                        else begin
                            reply[0]=8'hff; reply[1]=8'hff;
                            reply[2]=8'hff; reply[3]=0; reply_len=4;
                            if(late_r1) begin
                                for(integer k=0;k<15;k=k+1) reply[k]=8'hff;
                                reply[15]=0; reply_len=16;
                            end
                        end
                    end
                    17: begin
                        if(!cmd16_delivered) $fatal(1,"Read before init");
                        if({packet[1],packet[2],packet[3],packet[4]}!=123)
                            $fatal(1,"Wrong sector address");
                        cmd17_count=cmd17_count+1; reply[0]=0;
                    end
                    default: $fatal(1,"Unexpected command %0d",id);
                    endcase
                end else if(bytes>6 && id==16 && cmd16_count>1 && tx==8'hff) begin
                    // Successful final R1 was clocked on this byte.
                    if(reply_pos==reply_len) cmd16_delivered=1;
                end
                if(bytes>=6 && reply_pos<reply_len) begin
                    tx=reply[reply_pos]; reply_pos=reply_pos+1;
                end
            end
        end else bits=bits+1;
    end
end

initial begin
    #31 rst=0;
    wait(ready);
    if(cmd0_count!=(reject_cmd55 ? 3 : 2) || cmd16_count!=2 ||
       acmd_attempts!=((corrupt_ready || drop_ready) ? 5 : 4))
        $fatal(1,"Missing idle retries or CMD16 error recovery");
    if((corrupt_ready || drop_ready) && ready_cmd55_count!=1)
        $fatal(1,"Did not recover via a ready-state CMD55 response");
    @(negedge clk) read_req=1;
    wait(cmd17_count==1);
    repeat(200) @(posedge clk);
    if(dut.spi_clk_div!=1) $fatal(1,"High-speed divider parameter lost");
    $display("PASS SD startup: power delay, 88 clocks, ACMD41 retries, CMD16 recovery, late init_done, read command");
    if(corrupt_ready || drop_ready || reject_cmd55)
        $display("PASS SD R1 recovery: corrupt=%0d drop=%0d CMD55_error=%0d late=%0d ready_CMD55=%0d",
                 corrupt_ready,drop_ready,reject_cmd55,late_r1,ready_cmd55_count);
    $finish;
end
endmodule
