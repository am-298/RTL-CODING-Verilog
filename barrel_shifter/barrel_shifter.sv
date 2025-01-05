module barrel_shifter(
  input  logic [7:0] data_in,  // Input data
  input  logic [2:0] shifts,   // Number of positions to shift
  output logic [7:0] data_out  // Output data
);

  always_comb begin
    case (shifts)
      3'b000: data_out = data_in;
      3'b001: data_out = {data_in[6:0], data_in[7]};
      3'b010: data_out = {data_in[5:0], data_in[7:6]};
      3'b011: data_out = {data_in[4:0], data_in[7:5]};
      3'b100: data_out = {data_in[3:0], data_in[7:4]};
      3'b101: data_out = {data_in[2:0], data_in[7:3]};
      3'b110: data_out = {data_in[1:0], data_in[7:2]};
      3'b111: data_out = {data_in[0], data_in[7:1]};
      default: data_out = data_in;  // Default case for safety
    endcase
  end

endmodule


