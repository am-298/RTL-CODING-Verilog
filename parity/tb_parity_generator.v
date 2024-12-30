module tb_parity_generator;

  // Declare signals
  reg clk;                  // Clock signal
  reg [7:0] din;            // 8-bit input data
  wire par;                 // Parity output

  // Instantiate the parity_generator module
  parity_generator uut (
    .clk(clk),
    .din(din),
    .par(par)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;           // Generate clock with a period of 10 time units
  end

  // Initial block for stimulus
  initial begin
    // Initialize signals
    clk = 0;
    din = 8'b00000000;       // Initialize data input to 0
    
    // Wait for some time for the system to settle
    #10;
    
    // Apply test cases to check various input combinations
    din = 8'b00000001;       // 1 '1' bit, parity should be 1 (odd number of 1s)
    #10;

    din = 8'b00000011;       // 2 '1' bits, parity should be 0 (even number of 1s)
    #10;

    din = 8'b00000101;       // 3 '1' bits, parity should be 1 (odd number of 1s)
    #10;

    din = 8'b11111111;       // 8 '1' bits, parity should be 0 (even number of 1s)
    #10;

    din = 8'b10101010;       // 4 '1' bits, parity should be 0 (even number of 1s)
    #10;

    din = 8'b11100000;       // 3 '1' bits, parity should be 1 (odd number of 1s)
    #10;

    // Test edge case with all zeros
    din = 8'b00000000;       // No '1' bits, parity should be 0 (even number of 1s)
    #10;

    // Test edge case with all ones
    din = 8'b11111111;       // 8 '1' bits, parity should be 0 (even number of 1s)
    #10;

    // Finish simulation
    $finish;
  end

  // Monitor the outputs for debugging
  initial begin
    $monitor("At time %t, din = %b, par = %b", $time, din, par);
  end

endmodule
