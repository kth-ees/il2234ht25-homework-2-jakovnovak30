module counter_4bit    (input  logic clk,
                        input  logic rst_n,
                        input  logic carry_in,
                        output logic [3:0] count_out,
                        output logic carry_out);

logic [3:0] state;

// sequential logic
always_ff @(posedge clk or negedge rst_n) begin
  // reset
  if (!rst_n) begin
    state <= '0;
  end
  else begin
    if (count_out == '1) begin
      state <= '0;
    end
    else begin
      state <= state + carry_in;
    end
  end
end

// combinational logic
assign count_out = state;
assign carry_out = state == '1;

endmodule

