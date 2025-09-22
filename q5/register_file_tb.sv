module register_file_tb;

// complete here
logic clk = 0, rst_n = 1, write_en = 0;
logic [3:0] write_addr = '0, read_addr1 = '0, read_addr2 = '0;
logic [7:0] data_in = '0, data_out1, data_out2;

register_file UUT (clk,
                   rst_n,
                   write_en,
                   write_addr,
                   data_in,
                   read_addr1,
                   read_addr2,
                   data_out1,
                   data_out2);

always begin
  #5 clk = 1;
  #5 clk = 0;
end

logic [7:0] registers [16];

initial begin
  rst_n = 0;
  #10;
  rst_n = 1;
  write_en = 1;
  for (int i=0;i < 100;i++) begin
    automatic logic [3:0] adr = $urandom;
    automatic logic [7:0] val = $urandom;
    registers[adr] = val;
    write_addr = adr; data_in = val;
    #10;
  end

  write_en = 0;
  for (int i=0; i < 16;i++) begin
    read_addr1 = i;
    read_addr2 = (i + 1) % 16;
    #10;
    assert (data_out1 == registers[read_addr1]);
    assert (data_out2 == registers[read_addr2]);
  end
end

endmodule

