module full_adder_decoder (
  input  logic a, b, c,       // Inputs
  output logic carry, sum     // Outputs
);

  always_comb begin
    case ({a, b, c})
      3'b000: {carry, sum} = 2'b00;
      3'b001: {carry, sum} = 2'b01;
      3'b010: {carry, sum} = 2'b01;
      3'b011: {carry, sum} = 2'b10;
      3'b100: {carry, sum} = 2'b01;
      3'b101: {carry, sum} = 2'b10;
      3'b110: {carry, sum} = 2'b10;
      3'b111: {carry, sum} = 2'b11;
      default: {carry, sum} = 2'b00; // Default case for safety
    endcase
  end

endmodule
