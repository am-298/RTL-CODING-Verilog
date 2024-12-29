module sequence_detector (
  input wire clk,       // Clock input
  input wire rst,       // Reset input (active low)
  input wire din,       // Data input
  output reg [1:0] state, // Current state
  output reg count      // Counter for detected sequences
);

  // State encoding
  localparam IDLE = 2'b00;
  localparam S1   = 2'b01;
  localparam S2   = 2'b10;
  localparam S3   = 2'b11;

  // State transition logic
  always @(posedge clk) begin
    if (!rst) begin
      state <= IDLE;     // Reset state to IDLE
      count <= 0;        // Reset the count
    end else begin
      case (state)
        IDLE: begin
          if (din == 1)
            state <= S1; // Transition to S1 if input is 1
          else
            state <= IDLE; // Stay in IDLE if input is 0
        end

        S1: begin
          if (din == 1)
            state <= IDLE; // Transition back to IDLE if another 1 is encountered
          else
            state <= S2;   // Transition to S2 if input is 0
        end

        S2: begin
          if (din == 1)
            state <= S3; // Transition to S3 if input is 1
          else
            state <= IDLE; // Transition back to IDLE if input is 0
        end

        S3: begin
          state <= IDLE;   // Return to IDLE
          count <= 1; // Increment count for detected sequence
        end

        default: state <= IDLE; // Default case for safety
      endcase
    end
  end

endmodule
