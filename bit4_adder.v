/// module file 

module bit4_adder(
    input [3:0] a,         // 4-bit input a
    input [3:0] b,         // 4-bit input b
    output [3:0] sum,      // 4-bit sum output
    output carry           // Carry-out output
);

    wire [4:0] carry_out;  // 5-bit wire to hold sum and carry

    // Perform addition
    assign carry_out = a + b;   // Sum and carry stored here
    assign sum = carry_out[3:0]; // Lower 4 bits represent the sum
    assign carry = carry_out[4]; // MSB represents the carry

endmodule
