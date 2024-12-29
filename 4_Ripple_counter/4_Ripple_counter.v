module ripple_counter(
  input clk,        // Clock input
  input rst,        // Reset input (active low)
  output reg [3:0] q   // 4-bit output (counter value)
);
     // 4-bit register to hold the counter value
initial begin 
  q = 0;
end
  // Asynchronous reset (active low)
  always @(posedge clk or negedge rst) begin
    if (!rst)
      q <= 4'b0000;   // Reset counter to 0000 when rst is low
    else
      q <= q + 1;     // Increment the counter on each clock edge
  end

endmodule
