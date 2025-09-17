module LFSR_6bit_tb;

logic clk = 0, rst_n = 1, sel = 1;
logic [5:0] parallel_in, parallel_out;

LFSR_6bit UUT(
  .clk(clk), .rst_n(rst_n), .sel(sel),
  .parallel_in(parallel_in), .parallel_out(parallel_out)
  );

always begin
  #5 clk = 1;
  #5 clk = 0;
end

initial begin
  rst_n = 0;
  #10;
  rst_n = 1;
  parallel_in = 6'b100101;
  sel = 0;
  #10;
  sel = 1;
  #20;
end

endmodule

