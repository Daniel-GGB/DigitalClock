//带参数的模为任意的加计数器
module counter #(parameter N=60) (clk,reset,cout,cin);
//module DigitalClock #(parameter N=60) (clk,reset,cout,cin);

input wire clk;
input wire reset;
output reg [7:0] cout;
output reg cin;

always@(posedge clk, posedge reset) begin
    if(reset == 1) cout = 'b0;
    else begin
	     cout = cout + 1'b1;
	     if(cout == N-1) cin = 1;   
	     else cin = 0;
        if(cout == N) cout = 'b0;  
    end
end

endmodule


