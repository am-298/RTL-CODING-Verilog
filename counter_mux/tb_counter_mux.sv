module tb_counter_mux;

  logic clk, reset;
  logic [3:0] q;

  // Instantiate the counter module
  counter_mux uut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  // Generate clock
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    #10 reset = 0; // Release reset

    // Run simulation for 100 ns
    #100 $stop;
  end

  initial begin
    $monitor("Time=%0t | q=%b", $time, q);
  end

endmodule
