module seg7(din,dout);
	 
input wire [3:0] din;
output reg [6:0] dout;

always @ (*)
	  case(din)
			0:dout = 7'b1000000; //段码 g～a，共阳显示显示 0
			1:dout = 7'b1111001; //显示 1
			2:dout = 7'b0100100; //显示 2
			3:dout = 7'b0110000; //显示 3
			4:dout = 7'b0011001; //显示 4
			5:dout = 7'b0010010; //显示 5
			6:dout = 7'b0000010; //显示 6
			7:dout = 7'b1111000; //显示 7
			8:dout = 7'b0000000; //显示 8
			9:dout = 7'b0010000; //显示 9
			default:dout = 7'b1111111; //灭灯
	  endcase
endmodule