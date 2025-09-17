module up_down_counter_tb;

logic clk = 0, rst_n = 1, up_down = 1, load = 0, carry_out;
logic [3:0] input_load, count_out;

up_down_counter UUT(
   clk, rst_n, up_down, load,
   input_load, count_out,
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
  load = 1;
  input_load = 'b1101;
  #10;
  load = 0;
  up_down = 1;
  #30;
  up_down = 0;
  #30;

  $stop;
end

endmodule

