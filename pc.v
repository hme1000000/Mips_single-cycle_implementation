module pc(pfinish,address,mux_out,clk);
output [31:0] address;
output reg pfinish;
input  [31:0] mux_out;
input  clk;
reg    [31:0] address;
reg [31:0] finish[0:1];
initial begin
$readmemb("finish.txt",finish);
pfinish = 0;
end
always @ (posedge clk) begin
$display("old address= %b",address);
if(address===32'bx) address=finish[0];
else if(address<(finish[1]))   address = mux_out;
else begin

pfinish = 1;

end
$display("new address= %b",address);
end
endmodule
