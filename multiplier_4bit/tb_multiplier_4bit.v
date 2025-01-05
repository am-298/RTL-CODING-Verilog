module tb_multiplier_4bit;

  logic [3:0] A, B;
  logic [7:0] P;

  // Instantiate the multiplier module
  multiplier_4bit uut (
    .A(A),
    .B(B),
    .P(P)
  );

  initial begin
    $monitor("Time=%0t | A=%b | B=%b | P=%b", $time, A, B, P);

    // Apply test cases
    A = 4'b0011; B = 4'b0101; #10; // 3 x 5 = 15
    A = 4'b1111; B = 4'b0001; #10; // 15 x 1 = 15
    A = 4'b1010; B = 4'b0011; #10; // 10 x 3 = 30
    A = 4'b0000; B = 4'b1111; #10; // 0 x 15 = 0

    $stop;
  end

endmodule
