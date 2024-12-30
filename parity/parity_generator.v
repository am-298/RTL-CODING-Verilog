module parity_generator (
  input wire clk,            // Clock input
  input wire [7:0] din,      // 8-bit input data
  output reg par             // Parity output
);

  integer i;                 // Loop variable

  always @(posedge clk) begin
    par = 0;                 // Initialize parity
    for (i = 0; i < 8; i = i + 1) begin
      par = par ^ din[i];    // Compute parity by XORing all bits
    end
  end

endmodule
