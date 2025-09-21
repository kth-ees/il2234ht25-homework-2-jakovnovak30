module frequency_divider_tb;

logic clk = 0, rst_n = 1, divider_out;
frequency_divider UUT(
    .clk(clk), .rst_n(rst_n),
    .divider_out(divider_out)
  );

always begin
  #5 clk = 1;
  #5 clk = 0;
end

initial begin
  rst_n = 0;
  #10;
  rst_n = 1;
  #200;
end

endmodule

