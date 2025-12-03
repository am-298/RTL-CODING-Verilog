// N-bit Fixed-Priority Arbiter with Parameterized Width
// ============================================================================
// Description: Scalable fixed-priority arbiter for multi-requestor resource
//              arbitration with LSB having highest priority
//==========================================================================

module fixed_pri_arbiter #(
  parameter N = 32  
) (
  input   logic [N-1:0]  req,  
  output  logic [N-1:0]  gnt  
);

  logic [N-1:0] higher_pri_req;
  
  assign higher_pri_req[0] = 1'b0;
  
  genvar i;
  generate
    for (i = 0; i < N-1; i++) begin : gen_priority_chain
      assign higher_pri_req[i+1] = higher_pri_req[i] | req[i];
    end
  endgenerate
  
  assign gnt[N-1:0] = req[N-1:0] & ~higher_pri_req[N-1:0];

endmodule


