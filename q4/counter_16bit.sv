module counter_16_bit   (
    input  logic clk,
    input  logic rst_n,
    output logic [15:0] count_out,
    output logic carry_out
  );

  // partition the state for 4 ctrs
  logic [3:0] out [4];
  logic [3:0] carries;
  assign count_out[ 3:0 ] = out[0];
  assign count_out[ 7:4 ] = out[1];
  assign count_out[11:8 ] = out[2];
  assign count_out[15:12] = out[3];

  counter_4bit ctr1(
      .clk(clk), .rst_n(rst_n),
      .carry_in(1), .count_out(out[0]),
      .carry_out(carries[0])
    );
  counter_4bit ctr2(
      .clk(clk), .rst_n(rst_n),
      .carry_in(carries[0]), .count_out(out[1]),
      .carry_out(carries[1])
    );
  counter_4bit ctr3(
      .clk(clk), .rst_n(rst_n),
      .carry_in(carries[1]), .count_out(out[2]),
      .carry_out(carries[2])
    );
  counter_4bit ctr4(
      .clk(clk), .rst_n(rst_n),
      .carry_in(carries[2]), .count_out(out[3]),
      .carry_out(carries[3])
    );

  assign carry_out = carries[3];

endmodule

