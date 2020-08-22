---
title: RPi搭建DNS服务器
date: 2019-12-26
author: Tokisaki Galaxy
img: 
coverImg: 
top: false
cover: false
toc: true
mathjax: false
comments: true
summary: RPi搭建DNS服务器
tags:
  - RPi
categories:
  - 软件安装与配置
password:
---

>* 安装
>* 配置dnscrypt-proxy
>* 将路由器默认DNS更改为RPi
>* 配置失败自动重启

------------

> 安装

```
sudo apt-get install dnscrypt-proxy
sudo apt-get install dnsutils #包含了dig什么的命令,最好装上
```

> 配置dnscrypt-proxy

```
sudo nano /etc/dnscrypt-proxy/dnscrypt-proxy.toml
listen_addresses = ['127.0.0.1:53', '192.168.0.150:53'] #按照你自己的IP改
server_names = ['cloudflare','cloudflare-ipv6']
```

```
dnscrypt-proxy -resolve cloudflare-dns.com
```
试试行不行,没问题再做下一步安装服务


**非常重要,不然启动服务时会绑定端口失败**

```
sudo nano /lib/systemd/system/dnscrypt-proxy.service #更改dnscrypt-proxy服务设置
#User=_dnscrypt-proxy #注释掉源文件这一行
User=root #新加这一行,让它以root身份运行(好像不怎么安全..哈哈不管了)
```
启动服务试试吧!
```
sudo systemctl enable dnscrypt-proxy
sudo systemctl start dnscrypt-proxy
sudo systemctl status dnscrypt-proxy
```

> 将路由器默认DNS更改为RPi

略略略!!!

**自己百度,只有一点要注意,就是要改的地方是DHCP的,不是WAN口DNS!!!**


# 参考网址

[couldflare](https://developers.cloudflare.com/1.1.1.1/dns-over-https/cloudflared-proxy/)
[DNScrypt-proxy](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/installation#setting-up-dnscrypt-proxy)
