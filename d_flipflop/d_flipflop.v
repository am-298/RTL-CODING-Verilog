
module d_flip_flop(
    input clk,       // Clock signal
    input d,         // Data input
    input rst,       // Reset signal (active low)
    output reg qout  // Output of the flip-flop
);

    always @(posedge clk or negedge rst) begin
        if (!rst)        // Active low reset
            qout <= 1'b0;
        else
            qout <= d;   // Update output on clock edge
    end
endmodule
