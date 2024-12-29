module clk_async_reset (
  input wire clk,
  input wire rst,  // Active high reset
  output reg qout
);
  
  /// set qout =0 before
  initial 
    begin
      qout <= 0;
    end

  always @ (posedge clk or posedge rst)  
    
  begin
    if (rst) 
      qout <= 0;
    else      
      
      qout <= 1;
  end
endmodule
