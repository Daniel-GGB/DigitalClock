module display(clk,rst,mod,bcd_h,bcd_m,bcd_s,seg,an);
	 
input clk;
input rst;
input [1:0] mod;
input [7:0] bcd_h;
input [7:0] bcd_m;
input [7:0] bcd_s;
output [6:0] seg;
output reg [7:0] an;

reg [26:0] count;
reg [3:0] digit;
    
always @ (posedge clk, posedge rst)
	 if(rst) count = 0;
	 else count = count + 1'b1;
 
always @ (posedge clk)//TODO for test, change count[20:18] to count[2:0] 
	 case(count[2:0]) //动态扫描显示的频率
			1:begin
				 an = 8'b1101_1111; //从左数第 3 位数码管显示小时的十位
				 digit = bcd_h[7:4]; //小时十位的 BCD 码
			end
			2:begin
				 an = 8'b1110_1111; //从左数第 4 位数码管显示小时的个位
				 digit = bcd_h[3:0]; //小时个位的 BCD 码
				 //TODO for test, change count[26] to count[3]
				 if(count[3]) //判断闪烁
				 begin
					  if(mod == 2'b01) digit = 4'b1111;
				 end    
			end
			3:begin
				 an = 8'b1111_0111; //从左数第 5 位数码管显示分钟的十位
				 digit = bcd_m[7:4]; //分钟十位的 BCD 码
			end
			4:begin
				 an = 8'b1111_1011; //从左数第 6 位数码管显示分钟的个位
				 digit = bcd_m[3:0]; //分钟个位的 BCD 码
				 //TODO for test, change count[26] to count[3]
				 if(count[3]) //判断闪烁
				 begin
					  if(mod == 2'b10) digit = 4'b1111;
				 end
			end
			5:begin
				 an = 8'b1111_1101; //从左数第 7 位数码管显示秒的十位
				 digit = bcd_s[7:4]; //秒的十位的 BCD 码
			end
			6:begin
				 an = 8'b1111_1110; //从左数第 8 位数码管显示秒的个位
				 digit = bcd_s[3:0]; //秒的个位的 BCD 码
			end
	 endcase
	  
	 seg7 U4(.din(digit),.dout(seg)); //调用 7 段显示译码模块    
endmodule