module Ins_Mem(jump,temp2,control,reg_read1,reg_read2,reg_write,sign_ext,alu_con,pc,clk);
output reg [31:26] control;
output reg [25:21] reg_read1;
output reg [20:16] reg_read2;
output reg [15:0]  sign_ext;
output reg [15:11]  reg_write;
output reg [5:0]   alu_con;
output reg [25:0] jump;
input      [31:0]  pc;
input clk;
reg [31:0] ins[0:400];
reg [31:0] temp1;
output reg[10:6] temp2;
initial begin
$readmemb("instructions.txt",ins);
end
always @ (pc) begin
 temp1 = ins[pc];
#5 {control,reg_read1,reg_read2,sign_ext}= temp1;
 {reg_write,temp2,alu_con}= sign_ext;
jump = {reg_read1,reg_read2,sign_ext};
$display("This Instruction = %b",temp1);
end
endmodule
