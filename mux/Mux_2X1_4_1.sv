module mux(
  input wire [1:0] s,  // 2-bit select signal
  input wire [3:0] I,  // 4-bit input data
  output reg out       // Output of the multiplexer
);

  reg q1, q2;  // Intermediate signals for 2-to-1 muxes

  always @(*) begin
    // First stage: select between I[0] and I[1] based on s[0]
    case (s[0])
      1'b0: q1 = I[0];
      1'b1: q1 = I[1];
    endcase

    // First stage: select between I[2] and I[3] based on s[0]
    case (s[0])
      1'b0: q2 = I[2];
      1'b1: q2 = I[3];
    endcase

    // Second stage: select between q1 and q2 based on s[1]
    case (s[1])
      1'b0: out = q1;
      1'b1: out = q2;
    endcase
  end

endmodule
