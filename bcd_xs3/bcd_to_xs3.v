module bcd_to_xs3 (
  input  logic [3:0] bcd,  // 4-bit BCD input
  output logic [3:0] xs3   // 4-bit XS-3 output
);

  assign xs3 = bcd + 4'b0011; // Add 3 to the BCD input

endmodule
