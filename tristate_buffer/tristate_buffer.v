module tristate_buffer(
  input wire data_in,
  input wire enable,
  output reg out
);
  always @(*) begin 
    case (enable)
      0: out = 1'bz;    // High-impedance state
      1: out = data_in; // Pass-through state
    endcase
  end
endmodule


