# DigitalClock
课程设计_数字钟项目

## [Source](./Source)
 - DigitalClock_top. =>  顶层文件
 - div.v  => 分频模块，将50MHz转换为1MHz
 - counter.v  =>  带参数的加计数器，对时、分、秒分别计数
 - binbcd8.v  =>  将二进制码转换为8421BCD码
 - control.v  =>  校时、校分、设置闹钟
 - seg7.v  =>  共阳极七段数码管译码
 - display.v  =>  动态扫描显示

## 项目介绍
1. 具备基础的校时、校分、计时功能；
2. 没有实现闹钟功能，不过可以扩展；
3. 其中div.v，binbcd8.v，seg7.v，display.v参考自教科书上的案例，其他均为自己编写；

## 数字钟原理

输入端共有4个，分别是reset、clk、button0、button1。其中reset对数字钟进行同步清零，上升沿触发，相当于数字钟的初始化。clk是晶振的输入端，常用频率为50MHz的晶振作为时钟源。button0

RTL图:

![RTL图.png](./Picture/RTL图.png)

门电路图:

![门电路图.png](./Picture/门电路图.png)














