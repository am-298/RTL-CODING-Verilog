module binary_comparator_2bit(
  input  logic [1:0] A,  // 2-bit input A
  input  logic [1:0] B,  // 2-bit input B
  output logic A_gt_B,   // A > B
  output logic A_eq_B,   // A == B
  output logic A_lt_B    // A < B
);

  always_comb begin
    if (A > B) begin
      A_gt_B = 1;
      A_eq_B = 0;
      A_lt_B = 0;
    end else if (A == B) begin
      A_gt_B = 0;
      A_eq_B = 1;
      A_lt_B = 0;
    end else begin
      A_gt_B = 0;
      A_eq_B = 0;
      A_lt_B = 1;
    end
  end

endmodule
