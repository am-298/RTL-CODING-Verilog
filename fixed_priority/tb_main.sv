module tb_fixed_pri_arbiter;


  parameter N = 8;  // Test with 8-bit arbiter (can be changed)
  parameter CLK_PERIOD = 10;
  

  logic [N-1:0] req;
  logic [N-1:0] gnt;
  
  // Test control
  int test_count = 0;
  int pass_count = 0;
  int fail_count = 0;
  logic [N-1:0] expected = 0;
  

  fixed_pri_arbiter #(.N(N)) dut (
    .req(req),
    .gnt(gnt)
  );
  

  task check_grant(
    input logic [N-1:0] expected_gnt,
    input string test_name
  );
    test_count++;
    #1; 
    if (gnt === expected_gnt) begin
      $display("[PASS] Test %0d: %s", test_count, test_name);
      $display("       req=%b, gnt=%b", req, gnt);
      pass_count++;
    end else begin
      $display("[FAIL] Test %0d: %s", test_count, test_name);
      $display("       req=%b, expected=%b, got=%b", req, expected_gnt, gnt);
      fail_count++;
    end
  endtask
  

  initial begin
    $display("\n========================================");
    $display("Fixed-Priority Arbiter Testbench");
    $display("Parameter N = %0d", N);
    $display("========================================\n");
    
    // Test 1: No requests
    req = 8'b00000000;
    check_grant(8'b00000000, "No requests - all grants should be 0");
    
    // Test 2: Single request - LSB (highest priority)
    req = 8'b00000001;
    check_grant(8'b00000001, "Single request at bit 0 (highest priority)");
    
    // Test 3: Single request - MSB (lowest priority)
    req = 8'b10000000;
    check_grant(8'b10000000, "Single request at bit 7 (lowest priority)");
    
    // Test 4: Single request - middle bit
    req = 8'b00001000;
    check_grant(8'b00001000, "Single request at bit 3");
    
    // Test 5: Two requests - priority test
    req = 8'b00000011;
    check_grant(8'b00000001, "Two requests (bits 0,1) - bit 0 wins");
    
    // Test 6: Multiple requests - lowest index wins
    req = 8'b11111111;
    check_grant(8'b00000001, "All requests - bit 0 wins (highest priority)");
    
    // Test 7: Requests with gap
    req = 8'b10101010;
    check_grant(8'b00000010, "Alternate bits - bit 1 wins");
    
    // Test 8: Higher bits only
    req = 8'b11110000;
    check_grant(8'b00010000, "Upper nibble requests - bit 4 wins");
    
    // Test 9: Non-contiguous requests
    req = 8'b10010100;
    check_grant(8'b00000100, "Non-contiguous (bits 2,4,7) - bit 2 wins");
    
    // Test 10: Edge case - only MSB
    req = 8'b10000000;
    check_grant(8'b10000000, "Only MSB request - MSB gets grant");
    
    // Test 11: Priority verification (bit 3 and 5)
    req = 8'b00101000;
    check_grant(8'b00001000, "Bits 3,5 request - bit 3 wins");
    
    // Test 12: Mutual exclusion check
    req = 8'b01010101;
    check_grant(8'b00000001, "Multiple odd bits - only bit 0 granted");
    if ($countones(gnt) <= 1) begin
      $display("       [INFO] Mutual exclusion verified");
    end
    
    // Test 13-16: Sweep through all single bit requests
    for (int i = 0; i < N; i++) begin
      req = 1 << i;
      check_grant(req, $sformatf("Single bit request at position %0d", i));
    end
    
    // Test 17-20: Random patterns
    repeat(4) begin
      req = $urandom() & ((1 << N) - 1);
      // Find expected grant (lowest set bit)
      expected = 0;
      
      for (int i = 0; i < N; i++) begin
        if (req[i]) begin
          expected = 1 << i;
          break;
        end
      end
      check_grant(expected, "Random request pattern");
    end
    

    $display("\n========================================");
    $display("Test Summary");
    $display("========================================");
    $display("Total Tests: %0d", test_count);
    $display("Passed:      %0d", pass_count);
    $display("Failed:      %0d", fail_count);
    if (fail_count == 0) begin
      $display("\n*** ALL TESTS PASSED ***\n");
    end else begin
      $display("\n*** SOME TESTS FAILED ***\n");
    end
    
    $finish;
  end

endmodule


