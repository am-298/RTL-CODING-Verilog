module tb_ripple_counter;

  reg clk;             // Clock input
  reg rst;             // Reset input
  wire [3:0] q;       // 4-bit counter output

  // Instantiate the ripple counter module
  ripple_counter uut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Generate clock signal with a period of 10ns (5ns high and 5ns low)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clock every 5ns
  end

  // Test sequence for the ripple counter
  initial begin
    // Initially reset the counter
    rst = 0;               // Assert reset
    #10;                   // Wait for 10ns to observe reset
    rst = 1;               // Deassert reset, start counting
    #100;                  // Let the counter count for 100ns

    // Assert reset again
    rst = 0;               // Assert reset
    #10;                   // Wait for 10ns to observe reset
    rst = 1;               // Deassert reset and continue counting
    #50;                   // Let the counter count for 50ns more

    // Finish the simulation
    $finish;               // End the simulation
  end

  // Create a VCD dump for simulation waveform
  initial begin
    $dumpfile("ripple_counter.vcd");
    $dumpvars(1);          // Dump all signals in the design
  end

endmodule
