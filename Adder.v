module Adder(result,pc_adder,address);
output reg [31:0] result;
input [31:0] pc_adder,address;
always @(address or pc_adder) begin
  result = pc_adder + (address);
end
endmodule
