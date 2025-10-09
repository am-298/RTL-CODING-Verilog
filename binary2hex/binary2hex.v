module binary2hex #(parameter N = 32) (
    input  [N-1:0] bin_num,
    output reg [(N/4)*8 - 1:0] hex_str
);

    integer i;
    reg [3:0] nibble;

    always @(*) begin
        hex_str = {(N/4)*8{1'b0}};  // initialize to all 0s

        for (i = 0; i < N/4; i = i + 1) begin
            // Extract 4-bit nibble starting from MSB
            nibble = bin_num[N - 4*(i+1) +: 4];

            case (nibble)
                4'b0000: hex_str[((N/4)-1 - i)*8 +: 8] = "0";
                4'b0001: hex_str[((N/4)-1 - i)*8 +: 8] = "1";
                4'b0010: hex_str[((N/4)-1 - i)*8 +: 8] = "2";
                4'b0011: hex_str[((N/4)-1 - i)*8 +: 8] = "3";
                4'b0100: hex_str[((N/4)-1 - i)*8 +: 8] = "4";
                4'b0101: hex_str[((N/4)-1 - i)*8 +: 8] = "5";
                4'b0110: hex_str[((N/4)-1 - i)*8 +: 8] = "6";
                4'b0111: hex_str[((N/4)-1 - i)*8 +: 8] = "7";
                4'b1000: hex_str[((N/4)-1 - i)*8 +: 8] = "8";
                4'b1001: hex_str[((N/4)-1 - i)*8 +: 8] = "9";
                4'b1010: hex_str[((N/4)-1 - i)*8 +: 8] = "A";
                4'b1011: hex_str[((N/4)-1 - i)*8 +: 8] = "B";
                4'b1100: hex_str[((N/4)-1 - i)*8 +: 8] = "C";
                4'b1101: hex_str[((N/4)-1 - i)*8 +: 8] = "D";
                4'b1110: hex_str[((N/4)-1 - i)*8 +: 8] = "E";
                4'b1111: hex_str[((N/4)-1 - i)*8 +: 8] = "F";
                default: hex_str[((N/4)-1 - i)*8 +: 8] = "X";  // error case
            endcase
        end
    end
endmodule
