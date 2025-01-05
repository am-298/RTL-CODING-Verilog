module look_ahead_carry (
  input  logic [3:0] P,   // Propagate signals
  input  logic [3:0] G,   // Generate signals
  input  logic Cin,       // Carry-in
  output logic [3:0] C    // Carry signals
);

  assign C[0] = G[0] | (P[0] & Cin);
  assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
  assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
  assign C[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |
                (P[3] & P[2] & P[1] & P[0] & Cin);

endmodule
