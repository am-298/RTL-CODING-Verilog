module testbench;

    reg clk;
    reg we;
    reg [2:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Instantiate the SRAM module
    simple_sram uut (
        .clk(clk),
        .wr_en(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initial values
        we = 0; addr = 3'b000; din = 8'b10101010; #10;

        // Write data to address 3
        we = 1; addr = 3'b011; din = 8'b11110000; #10;
        
        // Read from address 3 (should return 11110000)
        we = 0; addr = 3'b011; #10;
        
        // Write another value to address 3
        we = 1; addr = 3'b011; din = 8'b00001111; #10;

        // Read from address 3 (should return 00001111)
        we = 0; addr = 3'b011; #10;

        // Test writing and reading from other addresses
        we = 1; addr = 3'b001; din = 8'b10101010; #10;
        we = 0; addr = 3'b001; #10;

        // End of simulation
        $stop;
    end

  /// this prompt is used in eda playground you can remove this add $monitor instead in vivado  
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end

endmodule
