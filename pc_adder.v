module Pc_Adder(jumppc,new_pc,old_pc);
output reg [31:0] new_pc;
output reg [31:26] jumppc;
input [31:0] old_pc;
reg [25:0] temp;
always @(old_pc)
begin
new_pc= old_pc+1;
{jumppc,temp} = new_pc;
end
endmodule

module jump(jumpout,jumppc,jumpoffset);
output reg [31:0] jumpout;
input [31:26] jumppc;
input [25:0] jumpoffset;

always @ (jumppc or jumpoffset) begin

jumpout = {jumppc,jumpoffset};
end
endmodule
