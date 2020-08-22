---
title: CMD script
author: Tokisaki Galaxy
top: false
cover: false
toc: true
mathjax: false
date: 2020-02-10 21:26:58
img: 
coverImg: 
summary: CMD script
tags:
 - CMD
categories: 
password: 
---

* 目录
{:toc}

`FOR /L %variable IN (start,step,end) DO command [command-parameters]`

>    该集表示以增量形式从开始到结束的一个数字序列。因此，(1,1,5)将产生序列
>    1 2 3 4 5，(5,-1,1)将产生序列(5 4 3 2 1)

对二进制文件连接用copy /b 1.txt+2.txt 1.txt

例如1.txt是abc,2.txt是def,运行完之后,1.txt里面内容就是abcdef

`for /l %i in (1,1,36) do (copy /b a.ts+seg-%i-v1-a1.ts>> a.ts)`

