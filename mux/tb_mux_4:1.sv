module tb;
  reg [1:0] s;         // Select signal for the mux
  reg [3:0] I;         // Input data for the mux
  wire out;            // Output from the mux
  
  // Instantiate the module under test
  mux uut (
    .s(s),
    .I(I),
    .out(out)
  );

  // Initialize input data
  initial begin 
    I = 4'b1101;       // Set input data for the mux
  end

  // Apply test cases for the select signal
  initial begin 
    s = 2'b11; #5;     // Select I[3]
    s = 2'b10; #10;    // Select I[2]
    s = 2'b01; #3;     // Select I[1]
    s = 2'b00; #4;     // Select I[0]
    $finish;           // Terminate simulation
  end

  // Generate VCD file for waveform analysis
  initial begin
    $dumpfile("dump.vcd");    // Specify VCD file name
    $dumpvars(1, tb);         // Dump variables from the testbench
  end
endmodule
