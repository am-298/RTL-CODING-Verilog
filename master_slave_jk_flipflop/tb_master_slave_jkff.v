// Code your testbench here
// or browse Examples
module tb_master_slave_jk();

  reg clk;
  reg rst;
  reg j, k;
  wire q;

  
  master_slave_jk uut (
    .clk(clk),
    .rst(rst),
    .j(j),
    .k(k),
    .q(q),
  );


  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  initial begin
    rst = 0;
    j = 0;
    k = 0;
    #10 rst =1;
  
    #10 j = 1; k = 0; // Set
    #10 j = 0; k = 1; // Reset
    #10 j = 1; k = 1; // Toggle
    #10 j = 0; k = 0; // No change
    #10 $finish;
  end

  // Monitor output
 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end

endmodule
