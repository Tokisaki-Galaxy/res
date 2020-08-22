---
title: RPi配置watchdog和硬盘自动休眠
date: 2019-11-5
author: Tokisaki Galaxy
img: 
coverImg: 
top: false
cover: false
toc: true
mathjax: false
comments: true
summary: RPi配置watchdog和硬盘自动休眠
tags:
  - RPi
categories:
  - 软件安装与配置
password:
---

>* rpi 3b watchdog
>* 硬盘闲置自动休眠

# 请依据CPU型号修改watchdog设备

---------------

# hdparm
--------

>安装hdparm（略）

>测试hdparm

[hdparm链接](http://www.linux-magazine.com/Online/Features/Tune-Your-Hard-Disk-with-hdparm)

```
sudo hdparm -y /dev/sda1
```
**如果没有报错就支持**

```
sudo hdparm -I /dev/sda1|grep cache
```
**如果看到有"\*"就支持缓存**


>编辑hdparm
```
sudo nano /etc/hdparm.conf
```
加入
```
/dev/sda1 {
write_cache = on
spindown_time = 120
}
```
*如果不支持缓存就不要加入write_cache那行*

*下面延时计算是 无操作休眠时间(分钟)\*60/5*

# watchdog
--------

>安装watchdog（略）

>载入watchdog
```
sudo modprobe bcm2835_wdt
sudo nano /etc/modules
bcm2835_wdt
```

>编辑配置
```
sudo /etc/watchdog.conf
```

>修改
```
max-load-1=24
watchdog-device = /dev/watchdog
watchdog-timeout=20
temperature-sensor      = /sys/class/thermal/thermal_zone0/temp
max-temperature = 85000
```

>启动
```
sudo systemctl enable watchdog.service
sudo chkconfig watchdog on
```


## 附赠一个fork bomb

```
:(){ :|: & };:
```