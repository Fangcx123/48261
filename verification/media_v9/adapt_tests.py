from pathlib import Path
r=Path(r'D:\FPGA\lab_ex5_i2s')
p=r/'verification/tb_lessons456.v';s=p.read_text().replace('frame_commit_cdc mailbox(clk,rst,token,bank,id,1\'b1,frame_req,frame_ack,\n                             token_ack,visible_bank,visible_id,valid);', '''frame_commit_cdc mailbox(.clk(clk),.rst(rst),.commit_toggle(token),.commit_bank(bank),.commit_id(id),
                             .commit_valid(1'b1),.frame_read_req(frame_req),.frame_read_ack(frame_ack),
                             .commit_ack(token_ack),.read_bank(visible_bank),.media_id(visible_id),.display_valid(valid));''');p.write_text(s)
p=r/'verification/wav_v8/tb_audio_output.v';s=p.read_text().replace('dut(clk,rst_n,', "dut(8'd96,clk,rst_n,");p.write_text(s)
