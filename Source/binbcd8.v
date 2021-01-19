//二进制转BCD模块
module binbcd8(bin,bcd);
	 
input wire [7:0] bin;
output reg [9:0] bcd;

reg [17:0] z;
always@(*) begin
	  z = 18'b0;
	  z[10:3]=bin;
	  repeat(5)
	  begin
			if(z[11:8]>4) z[11:8] = z[11:8] + 4'd3;
			if(z[15:12]>4) z[15:12] = z[15:12] + 4'd3;
			z[17:1] = z[16:0];
	  end
	  bcd = z[17:8];
end
endmodule


