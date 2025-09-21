module shift_register #(parameter unsigned N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);

  logic [N-1:0] memory;
  logic [N-1:0] new_memory;

  // sequential part
  always_ff @(posedge clk or negedge rst_n) begin
    // reset
    if (!rst_n) begin
      new_memory <= '0;
    end
    else begin
      // accept new data
      if (load_enable) begin
        // serial data loading
        if (serial_parallel) begin
          new_memory [N-1] <= serial_in;
          new_memory [N-2:0] <= memory[N-1:1];
        end
        // parallel data loading
        else begin
          new_memory <= parallel_in;
        end
      end
    end
  end

  // combinational part
  assign memory = new_memory;
  assign parallel_out = memory;
  assign serial_out = memory[0];

endmodule
