`timescale 1ns/1ps
module tb_lessons456;
    reg clk=0;
    always #20 clk=~clk;
    reg rst=1;
    reg load_start=0;
    wire ready, done, error;
    wire [3:0] code;
    wire req, sec_req;
    reg ack=0;
    reg [7:0] byte_data=0;
    reg byte_valid=0, sec_end=0;
    wire pixel_valid;
    wire [23:0] pixel;
    reg [7:0] bytes[0:511];
    integer pixels=0, completions=0, failures=0, i;
    bmp_read bmp(
        .clk(clk),.rst(rst),.ready(ready),.load_done(done),.load_error(error),.bmp_error(code),
        .scan_start(1'b0),.scan_start_sector(32'd0),.scan_max_sector(32'd100),.scan_target_count(3'd1),
        .load_start(load_start),.load_sector(32'd0),.sd_init_done(1'b1),
        .bmp_width(16'd4),.bmp_height(16'd2),.write_req(req),.write_req_ack(ack),
        .sd_sec_read(sec_req),.sd_sec_read_data(byte_data),.sd_sec_read_data_valid(byte_valid),
        .sd_sec_read_end(sec_end),.bmp_data_wr_en(pixel_valid),.bmp_data(pixel)
    );
    always @(posedge clk) begin
        if(pixel_valid) begin
            if(pixel!==24'h332211) $fatal(1,"BGR to RGB mismatch");
            pixels=pixels+1;
        end
        if(done) completions=completions+1;
        if(error) failures=failures+1;
    end
    task cycles(input integer n);
        repeat(n) @(negedge clk);
    endtask
    task header;
        begin
            for(i=0;i<512;i=i+1) bytes[i]=8'hee;
            bytes[0]="B";bytes[1]="M";
            // bfSize deliberately includes a tail: decoder must emit only 8 pixels.
            bytes[2]=100;bytes[3]=0;bytes[4]=0;bytes[5]=0;
            bytes[10]=54;bytes[11]=0;bytes[12]=0;bytes[13]=0;
            bytes[14]=40;bytes[15]=0;bytes[16]=0;bytes[17]=0;
            bytes[18]=4;bytes[19]=0;bytes[20]=0;bytes[21]=0;
            bytes[22]=2;bytes[23]=0;bytes[24]=0;bytes[25]=0;
            bytes[26]=1;bytes[27]=0;bytes[28]=24;bytes[29]=0;
            bytes[30]=0;bytes[31]=0;bytes[32]=0;bytes[33]=0;
            for(i=54;i<78;i=i+3) begin bytes[i]=8'h11;bytes[i+1]=8'h22;bytes[i+2]=8'h33;end
        end
    endtask
    task start_load;
        begin cycles(3);load_start=1;cycles(1);load_start=0;wait(sec_req);cycles(1);end
    endtask
    task sector(input integer n);
        integer j;
        begin
            for(j=0;j<n;j=j+1) begin byte_data=bytes[j];byte_valid=1;cycles(1);end
            byte_valid=0;cycles(2);sec_end=1;cycles(1);sec_end=0;cycles(3);
        end
    endtask
    task finish_good;
        begin wait(req);ack=1;cycles(2);ack=0;wait(sec_req);cycles(1);sector(512);end
    endtask

    reg token=0, frame_req=0, frame_ack=0;
    reg [1:0] bank=0, id=0;
    wire token_ack, valid;
    wire [1:0] visible_bank, visible_id;
    frame_commit_cdc mailbox(.clk(clk),.rst(rst),.commit_toggle(token),.commit_bank(bank),.commit_id(id),
                             .commit_valid(1'b1),.frame_read_req(frame_req),.frame_read_ack(frame_ack),
                             .commit_ack(token_ack),.read_bank(visible_bank),.media_id(visible_id),.display_valid(valid));
    reg ext_n=0;
    wire reset_n;
    reset_sync rs(clk,ext_n,reset_n);
    wire pcm_valid,overflow;
    wire signed [15:0] left,right;
    reg [1:0] media=0;
    wire blip;
    pcm_media_tone tone(.clk(clk),.rst_n(!rst),.media_id(media),.volume(8'd96),
        .sample_valid(pcm_valid),.sample_ready(1'b1),.sample_left(left),.sample_right(right),
        .overflow(overflow),.blip_active(blip));
    wire acr_valid;
    wire [19:0] acr_n, acr_cts;
    integer acr_packets=0;
    audio_arc_calculate acr(.I_clk(clk),.I_rst(rst),.I_audio_valid(pcm_valid),
        .O_acr_valid(acr_valid),.O_acr_n(acr_n),.O_acr_cts(acr_cts));
    always @(negedge clk) begin
        if(rst) acr_packets=0;
        else if(acr_valid) begin
            // The first interval starts at reset rather than a previous sample.
            if(acr_n!=6144 || (acr_packets>0 && acr_cts!=25000))
                $fatal(1,"ACR mismatch: N=%d CTS=%d",acr_n,acr_cts);
            acr_packets=acr_packets+1;
        end
    end
    integer samples, k, prior_sample, gap;
    initial begin
        cycles(3);rst=0;ext_n=1;
        @(posedge clk);#1;if(reset_n!==0) $fatal(1,"reset released too soon");
        @(posedge clk);#1;if(reset_n!==1) $fatal(1,"reset did not release after two edges");
        #3;ext_n=0;#1;if(reset_n!==0) $fatal(1,"reset assertion not asynchronous");
        ext_n=1;

        header;start_load;sector(512);finish_good;
        if(pixels!=8 || completions!=1 || failures!=0) $fatal(1,"valid BMP/tail handling failed");
        header;bytes[20]=1;start_load;sector(512);
        if(code!=2 || failures!=1 || req) $fatal(1,"full 32-bit width check failed");
        header;bytes[26]=2;start_load;sector(512);
        if(code!=3 || failures!=2) $fatal(1,"planes check failed");
        header;bytes[2]=60;start_load;sector(512);
        if(code!=4 || failures!=3) $fatal(1,"pixel length bounds check failed");
        header;bytes[14]=12;start_load;sector(512);
        if(code!=1 || failures!=4) $fatal(1,"DIB size check failed");
        header;start_load;sector(32);
        if(code!=5 || failures!=5) $fatal(1,"short header check failed");
        header;start_load;sector(512);
        wait(req);ack=1;cycles(2);ack=0;wait(sec_req);cycles(1);sector(80);
        if(code!=5 || failures!=6 || completions!=1) $fatal(1,"short sector falsely committed");
        $display("PASS BMP: RGB24, exact pixels/tail, 32-bit dimensions, planes, bounds, DIB, short header/sector");

        bank=1;id=3;token=1;cycles(6);
        if(visible_bank!=0 || token_ack!=0) $fatal(1,"bank switched before frame boundary");
        frame_req=1;cycles(2);
        if(visible_bank!=1 || token_ack!=0 || valid) $fatal(1,"mailbox failed staged switch");
        frame_ack=1;cycles(2);frame_req=0;frame_ack=0;
        if(token_ack!=1 || visible_id!=3 || !valid) $fatal(1,"frame ACK missing");
        bank=0;id=2;token=0;cycles(6);
        if(visible_bank!=1) $fatal(1,"second bank switched early");
        frame_req=1;cycles(2);frame_ack=1;cycles(2);frame_req=0;frame_ack=0;
        if(visible_bank!=0 || visible_id!=2 || token_ack!=0) $fatal(1,"second frame switch failed");
        $display("PASS frame mailbox: boundary switch and ACK, both toggle polarities");

        // Restart audio for a precise 25 MHz / 48 kHz measurement over 100 ms.
        rst=1;cycles(2);rst=0;samples=0;prior_sample=-1;
        for(k=0;k<2500000;k=k+1) begin
            @(negedge clk);
            if(pcm_valid) begin
                if(left!==right) $fatal(1,"stereo mismatch");
                if(prior_sample>=0) begin
                    gap=k-prior_sample;
                    if(gap!=520 && gap!=521) $fatal(1,"48k rate gap %d",gap);
                end
                prior_sample=k;samples=samples+1;
            end
        end
        // Last FIFO entry is popped one cycle after the fractional generator tick.
        cycles(2);if(samples!=4799 && samples!=4800) $fatal(1,"48k rate samples=%d",samples);
        if(acr_packets<99) $fatal(1,"missing ACR packets");
        media=2;cycles(3);if(!blip || overflow) $fatal(1,"media cue/overflow failed");
        $display("PASS audio: %0d samples/100ms, 520/521 clocks, stereo and media cue",samples);
        $display("PASS ACR: N=6144, CTS=25000, %0d packets/100ms",acr_packets);
        $display("ALL LESSONS456 UNIT TESTS PASSED");$finish;
    end
    initial begin #150000000;$fatal(1,"testbench timeout");end
endmodule
