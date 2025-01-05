module tb_look_ahead_carry;

  logic [3:0] P, G;
  logic Cin;
  logic [3:0] C;

  // Instantiate the look-ahead carry generator
  look_ahead_carry uut (
    .P(P),
    .G(G),
    .Cin(Cin),
    .C(C)
  );

  initial begin
    $monitor("Time=%0t | P=%b | G=%b | Cin=%b | C=%b",
             $time, P, G, Cin, C);

    // Apply test cases
    P = 4'b1101; G = 4'b1010; Cin = 1'b0; #10;
    P = 4'b1111; G = 4'b0000; Cin = 1'b1; #10;
    P = 4'b0000; G = 4'b1111; Cin = 1'b0; #10;
    P = 4'b1010; G = 4'b0101; Cin = 1'b1; #10;

    $stop;
  end

endmodule
