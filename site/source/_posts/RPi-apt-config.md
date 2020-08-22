---
title: RPi配置国内软件源
date: 2019-11-1
author: Tokisaki Galaxy
img: 
coverImg: 
top: false
cover: false
toc: true
mathjax: false
comments: true
summary: RPi配置国内软件源
tags:
  - RPi
categories:
  - 软件安装与配置
password:
---

# 树莓派3B国内软件源

-----------

## 先使用官方源进行一次update


## 查看系统版本(非常重要)

注意不要使用不是你系统版本的软件源
```
lsb_release -c
```

## 换源

```
sudo nano /etc/apt/sources.list
deb https://mirrors.ustc.edu.cn/raspbian/raspbian/ buster main contrib non-free
deb-src https://mirrors.ustc.edu.cn/raspbian/raspbian/ buster main contrib non-free
#deb http://raspbian.raspberrypi.org/raspbian/ buster main contrib non-free rpi
sudo nano /etc/apt/sources.list.d/raspi.list
deb http://mirrors.ustc.edu.cn/archive.raspberrypi.org/debian/ buster main ui
deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui
#deb http://archive.raspberrypi.org/debian/ buster main
```

## 更新

```
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
```
> 加个新架构
```
dpkg --add-architecture arm
```
