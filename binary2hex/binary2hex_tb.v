`timescale 1ns/1ps

////////-----------------------------------------------------------------
//Testbench for binary to hexadecimal string converter
////////---------------------------------------------------------------------------
module binary2hex_tb;

parameter N=32;

reg [N-1:0] bin_num;
wire [(N/4)*8-1:0] hex_str;

binary2hex #(N) uut (
    .bin_num(bin_num),
    .hex_str(hex_str)
);

initial begin
     $dumpfile("dump.vcd");          // Name of the output file
    $dumpvars(0, binary2hex_tb);    // Dump everything under your testbench module
    
    // test case 1 all zeros
    bin_num = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    #20;
     // test case 2 all ones
    bin_num = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
    #20;
    // test case 3 alternating bits
    bin_num = 32'b1010_1010_1010_1010_1010_1010_1010_1010;
    #20;
    // test case 4 random value
    bin_num = 32'b1100_1010_1111_0000_0001_0011_0101_0111;
    #20;
 


    $finish;
end



endmodule



