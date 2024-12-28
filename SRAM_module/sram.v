module simple_sram (
    input clk,//clock signal
    input wire wr_en,/// enable 1 - write and  0 - read
  input [2:0] addr, // 3 - bit memory address 
  input wire [7:0] din,       // din for write
  output reg [7:0]dout		//dout for read
);
  reg [7:0] mem[0:7];
  
  always @ (posedge clk)
    begin 
      if  (!wr_en)
        begin 
          dout <= mem[addr];
        end
      else
        begin 
          mem[addr] <= din;
        end
    end
endmodule
