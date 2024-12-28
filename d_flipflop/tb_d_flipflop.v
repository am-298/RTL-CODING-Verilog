module testbench;

    reg clk , rst= 1'b1;
    reg d;
    wire qout;

    // Instantiate the module
  d_flip_flop uut (clk,d,rst,qout);

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Generate test cases
    initial begin
        d = 1'b0; #10;
        d = 1'b1; #10;
      rst = 1'b0; #5;
      rst = 1'b1; #5;
        d = 1'b0; #10;
        d = 1'b1; #10; 
      	
        d = 1'b1; #10;
      
        $stop;
    end


initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  endmodule
