---
title: RPi连接GPS模块
date: 2020-02-12
author: Tokisaki Galaxy
img: 
coverImg: 
top: false
cover: false
toc: true
mathjax: false
comments: true
summary: RPi连接GPS模块
tags:
  - RPi
categories:
  - 软件安装与配置
password:
---

# 准备工作

RPi GPS Add-on V2.0模块,采用的是UART接口通信,需要先启用uart接口,否则无法收到任何数据

`sudo raspi-config`

5 Interfacing Options -> P6 Serial 两个全部禁用(这个操作将禁用串口!)

`sudo nano /boot/config.txt`

拉到最下面,将`enable_uart=0`改成`enable_uart=1`

再加一行`dtoverlay=pi3-miniuart-bt`

重启后

`ls /dev -la |grep serial`

> pi@RAAZ:~ $ ls /dev -la \| grep serial

> lrwxrwxrwx  1 root root           7 Feb 12 16:19 serial1 -> ttyAMA0

找到自己GPS模块在哪里,**我这里是/dev/ttyAMA0,你可能需要修改**

然后`cat /dev/ttyAMA0`

然后应该能看到一大堆数据,按`Ctrl+C`停止.

**没有任何输出可能是操作有误,或模块损坏**

# GPSD

## 安装GPSD

`sudo apt-get install gpsd gpsd-clients python-gps`

## 修改端口

`sudo nano /etc/default/gpsd`

```
USBAUTO="false"
DEVICES="/dev/ttyAMA0"
GPSD_OPTIONS="-n"
```
按照上述改完之后,重启系统

> cgps

> cgps is a client resembling xgps, but without the pictorial satellite display and able to run on a serial terminal or terminal emulator.

> The -s option prevents cgps from displaying the data coming from the daemon. This display can also be toggled with the s command.

> The -m option will display your magnetic heading (as opposed to your true heading). This is a calculated value, not a measured value, and is subject to a potential error of up to two degrees in the areas for which the calculation is valid (currently Western Europe, Alaska, and Lower 48 in the USA). The formulas used are those found in the Aviation Formulary v1.43.

> cgps terminates when you send it a SIGHUP or SIGINT; given default terminal settings this will happen when you type Ctrl-C at it. It will also terminate on 'q'

输入`cgps -s`

**!如果你用的是图形界面,不是命令行,那试试xgps!**

应该就可以看到结果了


**冷启动要等挺久的**

**如果NO FIX那一行后面的数字没有跳动,请检查/dev/ttyAMA0是否有输出**

**如果等很久还没定位,可能是GPS信号差**
