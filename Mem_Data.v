module Mem_Data(data_read,data_write,alu_res,mem_read,mem_write,clk);
output reg [31:0] data_read;
input [31:0] data_write ;
input [31:0] alu_res;
input mem_read;
input mem_write;
input clk;
reg [31:0] mem[0:4000];
integer i;
initial begin
for (i=0;i<4000;i=i+1) mem[i]<=0;
end
always @ (data_write or alu_res or mem_read ) begin
if (mem_read==1)  data_read <= mem[alu_res];
end
always @(negedge clk)begin
if (mem_write==1) begin
 mem[alu_res] <= data_write;
 $display("Mem[%d] = %b",alu_res,mem[alu_res]);
 end
end
endmodule
