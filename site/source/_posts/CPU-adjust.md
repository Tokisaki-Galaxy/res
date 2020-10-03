---
title: CPU升(降)压教程
author: Tokisaki Galaxy
top: false
cover: false
toc: true
mathjax: false
date: 2020-02-09
comments: true
img: 
coverImg: 
summary: CPU升(降)压教程
tags:
 - 电脑
 - CPU超频
 - CPU降频
categories:
 - 电脑硬件
password: 
alias:
 - blog/2020-02-09-cpu-adjust/index.html
 - 2020-02-09-cpu-adjust/index.html
 - cpu-adjust/index.html
---


>* ThrottleStop
>* Process Lasso

下载地址:
[ThrottleStop](https://www.techpowerup.com/download/techpowerup-throttlestop/)
[Process Lasso](https://dl.bitsum.com/files/processlassosetup64.exe)

-----

## 注意事项:

XTU和TS不需要用在一起

-----

# ThrottleStop

下载后解压到固定位置(**不要轻易更改的路径**)(*例如"C:\Program File\ThrottleStop"*)

然后点开ThrottleStop.exe

![主界面](https://s2.ax1x.com/2020/02/09/1h5Vqs.png)

左上第一个红框是选择配置文件,软件默认有4个配置文件

 1. Performance
 2. Game
 3. Internet
 4. Battery
 
**用法就像名字一样(废话)**

把你的每个选项里的Speed Shift - EPP都勾上,从左到右分别设成0/30/128/255

----------

左下那个红框,*先介绍第一列的功能*

**Clock Modulation和Chipset Clock Modulation**
**不需要勾选!**

**Set Multiplier**
**不设也行**

**Speed Shift EPP** **非常有用!**
看到左边的数字了吗,那里是可以编辑的!(想不到吧)
**值取一个0-255的数字,越接近0 性能越高,越接近255越节能(性能越低)**

**Power Saver** 需要勾选 Disable Turbo 才能使用，该选项确保待机频率最低以降低功耗，对较新的处理器来说用处不大，因为现代处理器有新技术降低待机功耗。比酷睿 2 更新的处理器不建议使用这个。
**看着办,一般不勾**

**Disable Turbo** 关闭睿频.没啥可说
**现在处理器最好别勾**(你基础频率才2G+)

**BD PROCHOT** **非常,非常重要和有用**
在温度达到某一值的时候降低功率,俗称温度墙,就是这东西.(默认打开)
**有需要就关上,但并不建议关**
!!!关了如果**没有其他措施**会导致cpu无法自动降频,直到100度**强制断电**!!!

Save 将当前设置存入 ini 文件。
**修改完记得按一下**

-----

**打开下面 Options 按钮**

![1hqlkj.png](https://s2.ax1x.com/2020/02/09/1hqlkj.png)

Do Not reset FID/VID on exit，退出不TS恢复设置
**建议勾上**

Start Minimized 启动时最小化
**建议勾上**

Minimize on Close 
**建议勾上**

Nvidia GPU/AMD GPU 你用哪个勾哪个
**可以不勾**

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

**这里需要你自己调出最适合你电脑的OFFSET VOLTAGE**
**每个CPU的质量不一样,没有统一数据**

Save Voltages Changes to ThrottleStop.INI 选项一，不保存电压设置。选项二，关闭时保存。选项三，立即保存。

-----

## 设置开机自启动

按一下windows(或者按搜索)输入任务计划程序

![1hxD4e.png](https://s2.ax1x.com/2020/02/09/1hxD4e.png)

任务计划程序 - 创建基本任务

设置名称 - 下一步

希望何时开始？当用户登录时

希望执行什么操作？启动程序

程序或脚本：填入ThrottleStop.exe 的完整路径

勾选“当单击完成时，打开任务属性对话框”

勾选“使用最高权限运行”

条件选项卡：取消所有的勾选项，有些灰色的勾选项可以先勾选他的上层将其取消之后再取消勾选他的上层。总之不要有任何的勾选项，灰色的也不要有。

设置选项卡：勾选允许按需运行任务。其余全部取消勾选。

确定。

-----

# Process Lasso

施工中.....
