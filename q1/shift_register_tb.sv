module shift_register_tb;

  logic clk = 0, rst_n = 1, serial_parallel = 1, load_enable = 1;
  logic serial_in = 0, serial_out;
  logic [3:0] parallel_in = 'b0110, parallel_out;

  shift_register #(.N(4)) UUT(clk,
                       rst_n,
                       serial_parallel,
                       load_enable,
                       serial_in,
                       parallel_in,
                       parallel_out,
                       serial_out
    );

  always begin
    #5 clk = 1;
    #5 clk = 0;
  end


  initial begin
    rst_n = 0;
    #10;
    rst_n = 1;
    serial_in = 1;
    #10;
    serial_in = 1;
    #10;
    load_enable = 0;
    #10;
    serial_parallel = 0;
    load_enable = 1;
    #10;
  end

endmodule

