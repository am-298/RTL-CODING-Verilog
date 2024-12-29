module tb_clk_sync_reset;
  
  reg clk;
  reg rst;
  wire qout;

  // Instantiate the clk_sync_reset module
  clk_sync_reset uut (
    .clk(clk),
    .rst(rst),
    .qout(qout)
  );

  // Generate clock signal
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end
  
  // Test the reset functionality
  initial begin
    rst = 0; // Start with reset active (qout should be 0)
    #10 rst = 1; // Deactivate reset (qout should be 1)
    #10 rst = 0; // Reactivate reset (qout should be 0)
    #10 rst = 1; // Deactivate reset (qout should be 1)
    #10;
    $stop;
  end

  // Dump waveform
  initial begin
    $dumpfile("clk_sync_reset.vcd");
    $dumpvars(0, tb_clk_sync_reset);
  end

endmodule
