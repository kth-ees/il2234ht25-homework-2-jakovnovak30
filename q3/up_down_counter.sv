module up_down_counter #(parameter unsigned N = 4)
                       (input  logic clk,
                        input  logic rst_n,
                        input  logic up_down,
                        input  logic load,
                        input  logic [N-1:0] input_load,
                        output logic [N-1:0] count_out,
                        output logic carry_out);

logic [N-1:0] state, carry;

// sequential logic
always_ff @(posedge clk or negedge rst_n) begin
  // reset
  if (!rst_n) begin
    state <= '0;
    carry <= '0;
  end
  else begin
    // set
    if (load) begin
      state <= input_load;
      carry <= '0;
    end
    // up
    else if(up_down) begin
      if (count_out == '1) carry <= 1;
      else carry <= '0;
      state <= state + 1;
    end
    // down
    else begin
      state <= state - 1;
      carry <= 0;
    end
  end
end

// combinational logic
assign count_out = state;
assign carry_out = carry;

endmodule

