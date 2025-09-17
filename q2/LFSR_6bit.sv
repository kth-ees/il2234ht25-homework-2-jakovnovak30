module LFSR_6bit (
  input  logic clk, rst_n,
  input  logic sel,
  input  logic [5:0] parallel_in,
  output logic [5:0] parallel_out
);

logic [5:0] bits;
logic [5:0] next_bits, xor_results;

// sequential part
always_ff @(posedge clk or negedge rst_n) begin : seq_logic
  if (!rst_n) begin
    next_bits <= '0;
  end
  else begin
    if (!sel) begin
      next_bits <= parallel_in;
    end
    else begin
      next_bits <= xor_results;
    end
  end
end

// combinational part
assign parallel_out = bits;
assign bits = next_bits;

genvar i;
generate
  for(i = 0;i < 6;i++) begin : g_shift
    int prev_i = (i-1 + 6) % 6;
    assign xor_results[i] = bits[i] ^ bits[prev_i];
  end
endgenerate

endmodule
