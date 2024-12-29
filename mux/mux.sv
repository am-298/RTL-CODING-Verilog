// Code your design here
/// it's  a combinational circuit
module mux(
  input wire [1:0]s,
  input wire [3:0] I,
  output reg out
  
);
  
  always_comb
    case (s)
      2'b00: out =I[0];
      2'b01: out =I[1];
      2'b10: out =I[2] ;
      2'b11: out = I[3] ;
    endcase
      
      
endmodule
