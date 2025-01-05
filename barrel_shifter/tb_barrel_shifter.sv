`timescale 1ns / 1ps

module tb_barrel_shifter;

  logic [7:0] data_in;
  logic [2:0] shifts;
  logic [7:0] data_out;

  // Instantiate the barrel shifter
  barrel_shifter uut (
    .data_in(data_in),
    .shifts(shifts),
    .data_out(data_out)
  );

  initial begin
    $monitor("Time = %0t | Data_in = %b | Shifts = %0d | Data_out = %b",
             $time, data_in, shifts, data_out);

    // Test cases
    data_in = 8'b11010010; shifts = 3'b000; #10;
    data_in = 8'b11010010; shifts = 3'b001; #10;
    data_in = 8'b11010010; shifts = 3'b010; #10;
    data_in = 8'b11010010; shifts = 3'b011; #10;
    data_in = 8'b11010010; shifts = 3'b100; #10;
    data_in = 8'b11010010; shifts = 3'b101; #10;
    data_in = 8'b11010010; shifts = 3'b110; #10;
    data_in = 8'b11010010; shifts = 3'b111; #10;

    $finish;
  end

endmodule
