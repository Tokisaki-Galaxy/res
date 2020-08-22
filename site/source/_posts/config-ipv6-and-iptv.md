---
title: 中国移动宽带配置ipv6与IPTV
author: Tokisaki Galaxy
top: false
cover: false
toc: true
comments: enable
mathjax: false
noindex: false
sitemap: true
date: 2020-08-16 15:37:36
img:
coverImg:
summary: 中国移动宽带配置ipv6与IPTV
tags:
categories:
password:
---

#登录光猫管理页面

移动光猫的管理地址一般在192.168.1.1，普通用户名与密码光猫盒子最下面有写（不过那个账户就是看个笑话）。
**超级管理员账号：`CMCCAdmin`，密码`aDm8H%MdA`。**
超级管理员比普通用户有更大权限，更多可设置内容。
（弱智移动超管账户密码都设成全国统一2333）

# 设置桥接

用超级管理员登录，点最上面绿色那里的网
![1](https://files.catbox.moe/wpfgis.jpg)

点连接名称，右边那个下拉菜单点新建
新建一个，端口选LAN3，改为桥模式。
然后在物理上把网线从LAN1拔下来，插到LAN3上。
PS:为什么我要用LAN3，不直接改LAN1，因为如果搞砸了还能改回去。

# 路由器设置
改为拨号，输入账号密码完事。
**如果你不知道宽带的密码（像我一样，可以用开户的手机发短信`CZKDMM`到10086，会重置一个新随机密码给你**

# IPTV
原来移动的IPTV是用网线连在光猫上的，我想把iptv盒子换到房间里，懒得拉这么长的线，所以用无线连接。
登录光猫管理地址，用超管登录，还是设置桥接的那个界面，找到`6_OTHER_B_VID_48`那一栏，端口绑定应该只有LAN2被勾上了，把下面SSID1勾上，就可以用无线连接iptv了。
