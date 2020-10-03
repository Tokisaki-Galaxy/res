---
title: ThrottleStop教程
author: Tokisaki Galaxy
top: false
cover: false
toc: true
mathjax: false
date: 2020-02-09 21:26:58
comments: true
img: 
coverImg: 
summary: ThrottleStop教程
tags:
 - 电脑
 - CPU超频
 - CPU降频
categories:
 - 电脑硬件
password: 
alias:
 - blog/2020-02-09-throttlestop/index.html
 - blog/2020-02-09-ThrottleStop/index.html
 - 2020/02/09/throttlestop/index.html
 - 2020/02/TS/index.html
 - throttlestop/index.html
---




>* ThrottleStop

下载地址:
[ThrottleStop](https://www.techpowerup.com/download/techpowerup-throttlestop/)

# ThrottleStop配置

![主界面](https://s2.ax1x.com/2020/02/09/1h5Vqs.png)

左上第一个红框是选择配置文件,软件默认有4个配置文件

 1. Performance
 2. Game
 3. Internet
 4. Battery

**用法就像名字一样(废话)**

----------

左下那个红框,*先介绍第一列的功能*

**Clock Modulation和Chipset Clock Modulation** 这两个选项对一些有点岁数的CPU 会有用，我们用不着..
**不需要勾选!**

**Set Multiplier** 设置倍频，设到默认+1就行了
**不设也行**

**Speed Shift EPP** **非常有用!**
看到左边的数字了吗,那里是可以编辑的!(想不到吧)
**值取一个0-255的数字,越接近0 性能越高,越接近255越节能(性能越低)**

**Power Saver** 需要勾选 Disable Turbo 才能使用，该选项确保待机频率最低以降低功耗，对较新的处理器来说用处不大，因为现代处理器有新技术降低待机功耗。比酷睿 2 更新的处理器不建议使用这个。
**看着办,一般不勾**

**Disable Turbo** 关闭睿频。没啥可说
**现在处理器最好别勾**(你基础频率才2G+)

**BD PROCHOT** **非常,非常重要和有用**
在温度达到某一值的时候降低功率,俗称温度墙,就是这东西.(默认打开)
**有需要就关上,但并不建议关**
!!!关了如果**没有其他措施**会导致cpu无法自动降频,直到100度**强制断电**!!!

Taskbar 最小化到任务栏
**给我关上!!!烦死了**

Log File 启用日志
**一般不勾(大佬勾)**

Stop/Start Data 停止或开启右侧表格记录数据更新。

SpeedStep 也是个老古董,没必要勾,已被Shift EPP替代(除非你也是古董)
**如果没有Speed Shift EPP就勾**

C1E 玄学选项,默认勾选
**既然默认勾就别动了**

On Top 使得 ThrottleStop 置顶（不会被其他窗口遮挡）。
**调试的时候才勾**

More Data 加快右侧表格数据更新频率，从每秒更新 1 次加快到每秒更新 8 次。
**一般用不着**

Save 将当前设置存入 ini 文件。
**修改完记得按一下**

-----

右上红框是你CPU的数据

 1. VID是当前电压
 2. 倍数x基础频率
 3. **你当前cpu频率**(就是第二行的结果)

-----

自己理解那个表格

-----

右下没被框的区域
Pkg/Min/Max Power 当前/最小/最大记录到的功率。

Limits 可以显示 Core/GPU/Ring 降频的原因

FIVR 和 TPL 一会用得到

BCLK 重新读取校准基频读数

C7s C-STATE

DTS/Temp 切换温度显示方式
**DTS是距离到达CPUTJMAX的温度,TEMP是现在的温度(CPUTJMAX-DTS)**

CLR 清空数据

-----

## Options

**打开下面 Options 按钮**

![1hqlkj.png](https://s2.ax1x.com/2020/02/09/1hqlkj.png)

Profile Names 起名字

Notification Area 设置托盘处显示的信息
*这里建议勾上CPU Temp*

Alarm 设置温度警报,DTS和TEMP上面讲过了

AC profile 插电时配置

Battery profile 用电池时配置。

Low Battery% 电池剩余电量百分比

Low Battery profile 到了上面的百分比,你用哪个配置

Do Not reset FID/VID on exit，退出不TS恢复设置
**建议勾上**

Battery Monitoring 在主界面上显示电池剩余电量

AC-On，Battery-Off 字面意思

Start Minimized 启动时最小化
**建议勾上**

Minimize on Close 
**建议勾上**

Add Limits Reason to Log File 在日志中记录限制原因

Table Grid Lines 主界面数据表格线显示

MHz Min 数据显示最小的单位为 MHz。

Nvidia GPU/AMD GPU 你用哪个勾哪个

Start dual IDA 老技术,不勾

DC exit time使用电池后几秒自动关闭TS

Timer Resolution计时器间隔。

AC Timer Res AC 计时器间隔。

Power Save C0% 调整 Power Saver 选项的敏感度

Force TDP/TDC **不明**
如果有人知道请评论区告诉我,谢谢

Run Program After Profile Change 指定切换为某个模式前或后所运行的第三方程序

Log Folder 日志文件路径

Hotkeys 设置各种快捷键，例如切换配置文件等

Defaults 还原默认设置

-----

## FIVR(最重要的部分)

![1hLqR1.png](https://s2.ax1x.com/2020/02/09/1hLqR1.png)

直接说中间那行,左边不说了.

上面FIVR CONTROL很好理解,就是指选择哪个组件,然后通过下面的XXX Voltage来调整

XXX Voltage是重点,这里为了防止你瞎改,还特意有一个"Unlock Adjustable Voltage",必须先点了这个才能修改下面的设置

**注意不要碰到那个STATIC!**

不要碰那个Voltage

看Offset Voltage,Range是控制你调整范围,左边是降低电压,右边升高电压

IccMax **不明**
如果有人知道请评论区告诉我,谢谢

右边那行,最上面的表格应该都懂

Memory那行的Disable and Lock Tur bo Power Limits,要安装另外一个东西才能用,降压用不着

Cache Radio 设置缓存的倍频范围。

PowerCut 类似于 BIOS 里修改 IMON Slope/offset 通过虚假的功耗读数来超出某些处理器的功耗限制。

VR Faults/VR Efficiency Mode 自己查(懒得写)(反正降压用不着)

Save Voltages Changes to ThrottleStop.INI 选项一，不保存电压设置。选项二，关闭时保存。选项三，立即保存。

-----

## TPL

![1hvVL6.png](https://s2.ax1x.com/2020/02/09/1hvVL6.png)

Tur bo Boost Long Power Max 最大长时功率

Tur bo Boost Short Power Max 最大短时功率

Lock 是说在寄存器中锁定这两项,避免软件或系统对其进行修改,如果日后要解锁需要按照上边卸载和重置的流程来做
Clamp 勾选代表任何时候都遵循此设置,不勾选时仅在睿频时起效.例如 CPU 默频 3.4G，但是在 3.4G 时仍然超过所给功率限制（例如做密集 AVX 运算），勾选 Clamp 的情况会强制 CPU 继续降频直到满足功耗限制，不勾选的话则不会。

PP0 就是PL4 设置

-----

## C7s

![1hvVL6.png](https://s2.ax1x.com/2020/02/09/1hvVL6.png)

C10 分别设置 1-4 四种配置的 C-states，C0 为最高性能状态，基本上后边的数字越大越省电，相应的恢复到 C0 需要的时间也就越长。调整这里的选项可以省电降低待机温度或者相反的提高待机温度费电以获得更高的性能。