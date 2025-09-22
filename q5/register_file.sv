module register_file (input logic clk,
                     input logic rst_n,
                     input logic write_en,
                     input logic [3:0] write_addr,
                     input logic [7:0] data_in,
                     input logic [3:0] read_addr1,
                     input logic [3:0] read_addr2,
                     output logic [7:0] data_out1,
                     output logic [7:0] data_out2
                     );
    localparam unsigned BW = 8, AW = 4;
    localparam unsigned DEPTH = 2**AW;

    logic [BW-1:0] registers [DEPTH];
    logic [BW-1:0] out [2];

    always_ff @(posedge clk or negedge rst_n) begin : seq_logic
      if (!rst_n) begin
        foreach (registers[i]) registers[i] <= '0;
      end
      else begin
        out[0] <= registers[read_addr1];
        out[1] <= registers[read_addr2];

        if (write_en) begin
          registers[write_addr] <= data_in;
        end
      end
    end

    assign data_out1 = out[0];
    assign data_out2 = out[1];

endmodule

