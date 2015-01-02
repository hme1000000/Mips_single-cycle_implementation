module Branch_And(branch_sel_line,branch,zero);
output reg branch_sel_line;
input branch,zero;
always @(branch or zero)
begin
branch_sel_line = branch & zero;
end
endmodule
