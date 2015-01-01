module register(data_read1,data_read2,read_reg1,read_reg2,write_reg,data_write,reg_write,clk);
output reg[31:0] data_read1;
output reg[31:0] data_read2;
input [4:0] read_reg1;
input [4:0] read_reg2;
input [4:0] write_reg;
input [31:0] data_write;
input reg_write;
input clk;
integer i;
reg [31:0] regs[0:31];
initial begin
for (i=0;i<32;i=i+1) begin
if (regs[i]===32'bx) regs[i]=0;
end
end
always @ (read_reg1 or read_reg2 ) begin
regs[0]=32'b0;
$display("%b , %b ",read_reg1,read_reg2);
#5 data_read1 = regs[read_reg1];
$display("Data Read 1 = %b",data_read1);
 data_read2 = regs[read_reg2];
$display("Data Read 2 = %b",data_read2);

end
always @(negedge clk) begin
if (reg_write==1) 
#5 regs[write_reg] = data_write;
 for (i=0;i<32;i=i+1)
 $display ("$%d =  %b",i,regs[i]);
$display("Write Data = %b",regs[write_reg]);
end
endmodule
