module tb_tristate_buffer();
  
  reg data_in;
  reg enable;
  wire out;

  // Instantiate the tristate buffer
  tristate_buffer uut (
    .data_in(data_in),
    .enable(enable),
    .out(out)
  );

  initial begin
    // Monitor signal values during simulation
    $monitor("Time = %0t | Enable = %b | Data_in = %b | Out = %b", 
             $time, enable, data_in, out);

    // Initialize signals
    data_in = 0;
    enable = 0;

    // Test cases
    #5 enable = 1; data_in = 0;
    #5 data_in = 1;
    #2 data_in = 0;
    #5 data_in = 1;
    #5 enable = 0; data_in = 1;

    #5 $finish; // End simulation
  end

  initial begin
    // Generate waveforms
    $dumpfile("dump.vcd");
    $dumpvars(1, tb_tristate_buffer);
  end
  
endmodule
