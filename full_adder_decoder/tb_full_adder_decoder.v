module tb_full_adder_decoder;

  logic a, b, c;
  logic carry, sum;

  // Instantiate the full adder
  full_adder_decoder uut (
    .a(a),
    .b(b),
    .c(c),
    .carry(carry),
    .sum(sum)
  );

  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end

    // Test all input combinations
    a = 0; b = 0; c = 0; #10;
    a = 0; b = 0; c = 1; #10;
    a = 0; b = 1; c = 0; #10;
    a = 0; b = 1; c = 1; #10;
    a = 1; b = 0; c = 0; #10;
    a = 1; b = 0; c = 1; #10;
    a = 1; b = 1; c = 0; #10;
    a = 1; b = 1; c = 1; #10;

    $finish;
  end

endmodule
