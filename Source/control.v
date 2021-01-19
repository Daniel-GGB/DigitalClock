/******************控制器*************************
out = 2'b00;   正常计数
out = 2'b01;   校分
out = 2'b10;   校时
out = 2'b11;   设置闹钟
************************************************/
module control (reset,sel,add,clk_1m,clk_1h,oclk_1m,oclk_1h,mod);

input wire sel,add,reset;
input wire clk_1m,clk_1h;
output wire oclk_1m,oclk_1h;
output reg [1:0] mod;

reg temp1,temp2;

always@(posedge sel,posedge reset) begin
    if(reset == 1) begin
	     mod = 2'b00;
	     temp1 = 0;
		  temp2 = 0;
	 end
    else begin
	     mod = mod + 1'b1;  //sel==0，x，z时，out==2'b00;
	     casex(mod)
        2'b00: begin temp1 = 0; temp2 = 0; end
		  2'b01: temp1 = add;
		  2'b10: temp2 = add;
		  default: begin temp1 = 0; temp2 = 0; end
		  endcase
	 end
end

//mux2 U6_m (.d1(add),.d2(clk_1m),.sel(temp1),.out(oclk_1m));
//mux2 U6_h (.d1(add),.d2(clk_1h),.sel(temp2),.out(oclk_1h));
or U6_m (oclk_1m,clk_1m,temp1);
or U6_h (oclk_1h,clk_1h,temp2);

endmodule
