module counter_16_bit_tb;
  logic clk = 0, rst_n = 1, carry_out;
  logic [15:0] count_out;

  counter_16_bit  UUT (
      clk,
      rst_n,
      count_out,
      carry_out
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

