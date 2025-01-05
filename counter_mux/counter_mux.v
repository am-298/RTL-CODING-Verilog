module counter_mux (
  input  logic clk,       // Clock signal
  input  logic reset,     // Reset signal
  output logic [3:0] q    // 4-bit counter output
);

  logic [3:0] next_state;

  // Next state logic using a multiplexer
  always_comb begin
    case (q)
      4'b0000: next_state = 4'b0001;
      4'b0001: next_state = 4'b0010;
      4'b0010: next_state = 4'b0011;
      4'b0011: next_state = 4'b0100;
      4'b0100: next_state = 4'b0101;
      4'b0101: next_state = 4'b0110;
      4'b0110: next_state = 4'b0111;
      4'b0111: next_state = 4'b1000;
      4'b1000: next_state = 4'b1001;
      4'b1001: next_state = 4'b0000;
      default: next_state = 4'b0000; // Default for safety
    endcase
  end

  // Register update on clock
  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      q <= 4'b0000; // Reset to 0
    else
      q <= next_state;
  end

endmodule
