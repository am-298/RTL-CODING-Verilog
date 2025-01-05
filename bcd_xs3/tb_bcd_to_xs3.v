module tb_bcd_to_xs3;

  logic [3:0] bcd;
  logic [3:0] xs3;

  // Instantiate the BCD to XS-3 converter
  bcd_to_xs3 uut (
    .bcd(bcd),
    .xs3(xs3)
  );

  initial begin
    $monitor("Time=%0t | BCD=%b | XS-3=%b", $time, bcd, xs3);

    // Apply test cases
    bcd = 4'b0000; #10; // 0 -> 3
    bcd = 4'b0011; #10; // 3 -> 6
    bcd = 4'b1001; #10; // 9 -> 12
    bcd = 4'b0101; #10; // 5 -> 8

    $stop;
  end

endmodule
