---
title: 使用hackrf伪造GPS信号
author: Tokisaki Galaxy
top: false
cover: false
toc: true
comments: true
mathjax: false
noindex: false
sitemap: true
date: 2020-10-04 16:25:59
img:
coverImg:
summary: 使用hackrf伪造GPS信号
tags:
 - hackrf
categories:
password:
---

环境：Windows 10
*win10都可以，linux不会有问题的吧*
**关于本文中的所有链接，文末有整合地址，如果你们不嫌弃慢可以去那里下载**

# 伪造GPS信号原理
这个没啥好说的，就是用一个更强的信号覆盖掉微弱的GPS信号。

# 下载Hackrf_Tools
这个不好找，只能去Github下，然后编译。我提供的整合包里有这些文件。

# 下载gps-sdr-sim
[Github地址](https://github.com/osqzss/gps-sdr-sim)

建议下载Release，不用自己编译，而且windows直接用。

生成仿真信号的时候需要RINEX星历数据，Release版的gps-sdr-sim已经自带一个上古版本的星历了（2014年的），更新一下。
[RINEX星历数据下载地址](ftp://cddis.gsfc.nasa.gov/pub/gps/data/daily/2020/brdc/)
**地址中的2020可以换成你当前年份**
拉到最下面，下载brdc2780.20n.Z，然后解压就是了。（注意要是以n结尾的星历）
![RINEX](https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/source/_posts/hackrf/RINEX.png)

# 生成GPS仿真数据
`./gps-sdr-sim -e brdc2780.20n -l 0,0,100 -b 8·`
指定星历文件，设置经纬度，必须指定采样精度为8。
默认情况下只生成300秒的仿真数据，因为生成的文件太大了，怕你硬盘塞不下去2333。

# 发射仿真数据
`hackrf_transfer -t gpssim.bin -f 1575420000 -s 2600000 -a 1 -x 0`
-t 指定GPS数据
-f 指定频率为1575420000 即民用GPS L1波段频率。
-s 指定采样速率2.6Msps
-a 开启天线增益 1=Enable, 0=Disable
-x 指定TX VGA(IF)的增益，数据范围0-47dB **(为了限制影响范围，最大为47慎用，小心查水表)**

**请尽量避免使用手机进行测试，使用其他GPS终端。**
因为手机会采用多重方法进行定位，比如基站，Wifi，GPS。这类多重定位的东西不好干扰。

# 相关链接
[HackRF首页](http://www.hackrf.net/)
[Github上的HackRF](https://github.com/mossmann/hackrf)

[本文提到的资源整合](hackrf/hackrf.7z)