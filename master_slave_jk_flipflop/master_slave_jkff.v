
module master_slave_jk(
  input wire clk,
  input wire rst,
  input wire j,
  input wire k,
  output reg q
);

  reg master_q
  // Master Flip-Flop (Triggers on the positive edge of the clock)
  always @(posedge clk or negedge rst)
    begin
    if (!rst) 
      master_q <= 0;
    else begin
      case ({j, k})
        2'b00: master_q <= master_q;       // No change
        2'b01: master_q <= 0;             // Reset
        2'b10: master_q <= 1;             // Set
        2'b11: master_q <= ~master_q;     // Toggle
        default: master_q <= master_q;    // Default case
      endcase
    end
  end

  // Slave Flip-Flop (Triggers on the negative edge of the clock)
  always @(negedge clk or negedge rst) begin
    if (!rst) 
      q <= 0;
    else 
      q <= master_q; // Pass master's output to the slave
  end

endmodule
