module div #(parameter N = 7) (clk,rst,clk_1s_out);//TODO for test, change N = 99_999999 to N = 7

input wire clk;
input wire rst;
output reg clk_1s_out;

reg [31:0] count;

always@(posedge clk, posedge rst) begin
	  if(rst) count <= 0;
	  else
	  begin
			clk_1s_out <= 0;
			if(count < N) count <= count + 1;
			else
			begin
				 count <= 0;
				 clk_1s_out <= 1;
			end
	  end
end
endmodule