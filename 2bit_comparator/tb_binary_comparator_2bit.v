module tb_binary_comparator_2bit;

  logic [1:0] A, B;
  logic A_gt_B, A_eq_B, A_lt_B;

  // Instantiate the 2-bit comparator
  binary_comparator_2bit uut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B)
  );
 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end

    // Test all combinations of A and B
    A = 2'b00; B = 2'b00; #10;
    A = 2'b00; B = 2'b01; #10;
    A = 2'b00; B = 2'b10; #10;
    A = 2'b00; B = 2'b11; #10;

    A = 2'b01; B = 2'b00; #10;
    A = 2'b01; B = 2'b01; #10;
    A = 2'b01; B = 2'b10; #10;
    A = 2'b01; B = 2'b11; #10;

    A = 2'b10; B = 2'b00; #10;
    A = 2'b10; B = 2'b01; #10;
    A = 2'b10; B = 2'b10; #10;
    A = 2'b10; B = 2'b11; #10;

    A = 2'b11; B = 2'b00; #10;
    A = 2'b11; B = 2'b01; #10;
    A = 2'b11; B = 2'b10; #10;
    A = 2'b11; B = 2'b11; #10;

    $finish;
  end

endmodule
