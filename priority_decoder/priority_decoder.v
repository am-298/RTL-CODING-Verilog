`define I0 2'b00
`define I1 2'b01
`define I2 2'b10
`define I3 2'b11

module priority_decoder(input clk, input [3:0] din, output reg [1:0] out);
  
  always @(posedge clk) begin
    case (din)
      4'b0001: out = `I0;   // Priority 0
      4'b0010: out = `I1;   // Priority 1
      4'b0100: out = `I2;   // Priority 2
      4'b1000: out = `I3;   // Priority 3
      default: out = 2'bxx; // Invalid input or no active bits
    endcase
  end
  
endmodule
