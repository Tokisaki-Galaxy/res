---
title: RPi使用Screen
date: 2020-02-06
author: Tokisaki Galaxy
img: 
coverImg: 
top: false
cover: false
toc: true
mathjax: false
comments: true
summary: RPi使用Screen
tags:
  - RPi
categories:
  - 软件安装与配置
password:
---

>* 在使用ssh时虚拟一个终端,实现不间断操作

```
sudo apt install screen
```

> 常用命令

```
screen -S 新建终端
screen -r 进入已创建终端
screen -ls 列出已创建终端
```

> 快捷键

```
Ctrl+A+D 保存并退出
Ctrl+A+K 杀死当前终端
```
