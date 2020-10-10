---
title: DnsPod，cloudflare启用DNSSEC
author: Tokisaki Galaxy
top: false
cover: false
toc: true
comments: true
mathjax: false
noindex: false
sitemap: true
date: 2020-10-10 20:04:58
img:
coverImg:
summary: DnsPod配合cloudflare启用DNSSEC
tags:
 - cloudflare
 - DNSPod
 - DNSSEC
categories: 博客
password:
---

# DNSSEC介绍
DNSSEC 可抵御伪造的 DNS 应答。受 DNSSEC 保护的区域将通过密码进行签名，以确保收到的 DNS 记录与域所有者发布的 DNS 记录相同。

# cloudflare开启DNSSEC
首先在cloudflare中打开dns页面

![cloudflare打开DNSSEC页面](https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/source/_posts/cloudflare-dnspod-enable-dnssec/1.webp)

下滑找到DNSSEC，点击启用，并且点击右下角那个`DS 记录`展开。

![启用DNSSEC](https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/source/_posts/cloudflare-dnspod-enable-dnssec/2.webp)

![展开DS记录](https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/source/_posts/cloudflare-dnspod-enable-dnssec/3.webp)

# 打开腾讯云DNSSEC功能
https://console.cloud.tencent.com/domain，点击域名那一栏的`管理`->`域名安全`，点击下面`DNSSEC设置`右边蓝色的设置。
![腾讯云DNSSEC](https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/source/_posts/cloudflare-dnspod-enable-dnssec/4.webp)

第一次进去会有个什么东西让你了解，点击了解就完了。然后按照下面输进去。

![dnspod启用DNSSEC](https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/source/_posts/cloudflare-dnspod-enable-dnssec/5.webp)

# 验证DNSSEC情况
回到cloudflare的dns页面，已经变成了下面这一个样子。
![启用成功DNSSEC](https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/source/_posts/cloudflare-dnspod-enable-dnssec/6.webp)

也可以使用第三方检测你的网站是否成功启用DNSSEC。
https://dnsviz.net/d/tokisakigalaxy.xyz/dnssec/

![dnsviz中检测启用成功DNSSEC](https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/source/_posts/cloudflare-dnspod-enable-dnssec/tokisakigalaxy-xyz-DNSViz.webp)