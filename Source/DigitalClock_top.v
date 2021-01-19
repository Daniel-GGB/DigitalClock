module DigitalClock_top (clk,reset,button0,button1,seg,an);

input wire clk;
input wire reset;
input wire button0;   //选择模式
input wire button1;   //负责加1
output wire [6:0] seg; //数码管显示数字
output wire [7:0] an;  //使用6个数码管显示

wire clk_1s;
div U1 (.clk(clk),.rst(reset),.clk_1s_out(clk_1s));

wire clk_1m;
wire clk_1h;
counter #(60) U2_s (.clk(clk_1s),.reset(reset),.cout(bin_s),.cin(clk_1m));
counter #(60) U2_m (.clk(oclk_1m),.reset(reset),.cout(bin_m),.cin(clk_1h));
counter #(24) U2_h (.clk(oclk_1h),.reset(reset),.cout(bin_h),.cin());

wire bin_s,bcd_s;
wire bin_m,bcd_m;
wire bin_h,bcd_h;
binbcd8 U3_s (.bin(bin_s),.bcd(bcd_s));
binbcd8 U3_m (.bin(bin_m),.bcd(bcd_m));
binbcd8 U3_h (.bin(bin_h),.bcd(bcd_h));

wire [1:0] mod;
display U4 (.clk(clk),.rst(reset),.mod(mod),.bcd_s(bcd_s),.bcd_m(bcd_m),.bcd_h(bcd_h),.seg(seg),.an(an));

wire oclk_1m;
wire oclk_1h;
control U5 (.reset(reset),.sel(button0),.add(button1),.clk_1m(clk_1m),.clk_1h(clk_1h),.oclk_1m(oclk_1m),.oclk_1h(oclk_1h),.mod(mod));

endmodule
