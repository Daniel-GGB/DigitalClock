module DigitalClock_top_t();
    reg clk;
    reg reset;
    reg button0;
    reg button1;
    wire [6:0] seg;
    wire [7:0] an;
    
    DigitalClock_top T1 (clk,reset,button0,button1,seg,an);
    
    initial
    fork
        clk = 0;
        reset = 0;
        button0 = 0;
        button1 = 0;
        
        #25 rst = 1;
        #45 rst = 0;
        
        #200 button1 = 1;
        #210 button1 = 0;//h校时
        #400 button1 = 1;
        #410 button1 = 0;//m校时
        #600 button1 = 1;
        #610 button1 = 0;//不校时
        #800 button1 = 1;
        #810 button1 = 0;//h校时
        /*
        #500 button0 = 1;
        #600 button0 = 0;
        
        #700 button0 = 1;
        #800 button0 = 0;
        */
    join
    always #5 clk = ~clk;
endmodule
