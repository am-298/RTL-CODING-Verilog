// Code your testbench here
// or browse Examples
module tb_priority_decoder;

  // Declare signals
  reg clk;
  reg [3:0] din;
  wire [1:0] out;

  // Instantiate the priority_decoder module
  priority_decoder uut (
    .clk(clk),
    .din(din),
    .out(out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;  // Generate clock with a period of 10 time units
  end

  // Initial block for stimulus
  initial begin
    clk = 0;
    din = 4'b0000;  // Start with no active bits
    #10;
    
    // Apply test cases to check the priority decoder functionality
    din = 4'b0001;  // First bit active, should output 00
    #10;
    din = 4'b0010;  // Second bit active, should output 01
    #10;
    din = 4'b0100;  // Third bit active, should output 10
    #10;
    din = 4'b1000;  // Fourth bit active, should output 11
    #10;
    din = 4'b0110;  // Invalid input, should output xx
    #10;
    din = 4'b1111;  // All bits active, should output 11 (highest priority)
    #10;
    
    // Finish simulation
    $finish;
  end
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end

  // Monitor the outputs for debugging
  initial begin
    $monitor("At time %t, din = %b, out = %b", $time, din, out);
  end

endmodule
