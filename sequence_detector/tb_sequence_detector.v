`timescale 1ns / 1ps

module tb_sequence_detector;

    // Inputs
    reg clk;
    reg rst;
    reg din;
  wire state;

    // Output
    wire count;

    // Instantiate the sequence detector module
    sequence_detector uut (
        .clk(clk),
        .din(din),
      .rst(rst),
      .state(state),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        din = 0;

        // Apply reset
        #10 rst = 0; // Deassert reset after 10ns
        #10 rst = 1; // Start normal operation

        // Apply test sequence: 101, 101, 101
        #10 din = 1;
        #10 din = 0;
        #10 din = 1; // First "101" detected
        #10 din = 1;
        #10 din = 0;
        #10 din = 1; // Second "101" detected
        #10 din = 0;
        #10 din = 1; // Start of new sequence

        // Finish simulation
        #20 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t | din: %b | count: %d | state: %b", $time, din, count, uut.state);
    end

    // Dump waveform for debugging
    initial begin
        $dumpfile("sequence_detector.vcd");
        $dumpvars(1, tb_sequence_detector);
    end

endmodule
