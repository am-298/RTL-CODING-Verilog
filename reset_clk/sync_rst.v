module clk_sync_reset (
  input wire clk,
  input wire rst,
  output reg qout
  
);
   // Set initial value for simulation
  initial begin
    qout = 0; // Initial value of qout
  end

  always @ (posedge clk )
    begin
      if(!rst)
        qout<=0;
      else
        qout<=1;
    end
endmodule
