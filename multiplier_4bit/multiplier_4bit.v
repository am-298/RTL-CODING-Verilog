module multiplier_4bit (
  input  logic [3:0] A,  // 4-bit multiplicand
  input  logic [3:0] B,  // 4-bit multiplier
  output logic [7:0] P   // 8-bit product
);

  logic [7:0] partial_products [3:0];

  // Generate partial products
  assign partial_products[0] = B[0] ? {4'b0000, A} : 8'b00000000;
  assign partial_products[1] = B[1] ? {3'b000, A, 1'b0} : 8'b00000000;
  assign partial_products[2] = B[2] ? {2'b00, A, 2'b00} : 8'b00000000;
  assign partial_products[3] = B[3] ? {1'b0, A, 3'b000} : 8'b00000000;

  // Add partial products to get the final product
  assign P = partial_products[0] + partial_products[1] +
             partial_products[2] + partial_products[3];

endmodule
