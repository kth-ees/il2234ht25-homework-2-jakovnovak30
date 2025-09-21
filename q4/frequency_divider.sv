module frequency_divider (input logic clk,
                          input logic rst_n,
                          output logic divider_out);

  logic [15:0] ctr_out;
  counter_16bit ctr (
      .clk(clk), .rst_n(rst_n),
      .count_out(ctr_out), .carry_out()
    );


  assign divider_out = (ctr_out % 18 == 0) || (ctr_out % 866 == 0);

  endmodule

