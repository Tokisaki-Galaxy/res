---
title: Linux新建服务
author: Tokisaki Galaxy
top: false
cover: false
toc: true
mathjax: false
comments: false
date: 2020-02-05 21:26:58
img:
coverImg:
password:
summary: Linux新建服务
tags:
  - Linux
categories:
  - 软件安装与配置
---

```
sudo nano /lib/systemd/system/xxx.service
```

```
[Unit]
Description=Your Service Name
After=network.target syslog.target
Wants=network.target

[Service]
Type=simple
ExecStart=Your File Path

[Install]
WantedBy=multi-user.target
```

```
systemctl daemon-reload
systemctl start frpc.service
```
