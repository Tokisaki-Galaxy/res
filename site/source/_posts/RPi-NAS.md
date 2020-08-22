---
title: RPi搭建NAS
author: Tokisaki Galaxy
top: false
cover: false
toc: true
mathjax: false
date: 2019-11-1 21:26:58
img:
coverImg:
summary: RPi搭建NAS
tags:
  - RPi
categories:
  - 软件安装与配置
password:
---

> 安装

```
sudo apt install aria2
sudo apt install nginx
sudo apt install ntfs-3g
sudo apt install samba
````

> aria2

配置

把页面最下面那个配置文件复制到/etc/aria2/aria2.conf

创建aria2用户

```
sudo useradd -M -s /usr/sbin/nologin aria2
```

创建下载会话保存文件

```
sudo touch /etc/aria2/aria2.session
sudo chown aria2 /etc/aria2 /etc/aria2/aria2.session
```

测试一下能不能启动

```
aria2c --conf-path=/etc/aria2/aria2.conf
```

> 设置服务

```
sudo nano /lib/systemd/system/aria2.service
```

```
[Unit]
Description=Aria2 Service
After=network.target

[Service]
Type=simple
User=aria2
ExecStart=aria2c --conf-path=/etc/aria2/aria2.conf

[Install]
WantedBy=multi-user.target
```

```
sudo systemctl start aria2.service
sudo systemctl enable aria2.service
```

> AriaNg

```
cd /var/www
sudo rm -rf html
sudo mkdir html
cd html
sudo wget https://github.com/mayswind/AriaNg/releases/download/1.1.4/AriaNg-1.1.4.zip
sudo unzip AriaNg-1.1.4.zip
sudo rm AriaNg-1.1.4.zip
```

> 挂载NTFS硬盘

```
sudo apt-get install exfat-*
```

```
sudo fdisk -l			#看一下你的硬盘在哪
sudo mkdir /media/HDD	#挂载点
sudo mount /dev/sda1 /media/HDD
sudo nano /etc/fstab	#设置开机自动挂在
```
加一行
```
/dev/sda1 /media/HDD auto rw,defaults 0 0
```
*注意最好用auto，不指定文件系统。如果指定之后，以后转换为ext4分区的时候忘记改了，那就很好玩了*

> samba

```
sudo nano /etc/samba/smb.conf
```
加入
```
[share]
   comment = NAS
   path = /media/HDD
   read only = no
   writable = yes
   create mask = 0777
   directory mask = 0777
   guest ok = yes
   browseable = yes
```

-----

> aria2.conf

```
check-intergrity=true
#允许rpc
enable-rpc=true
#允许所有来源, web界面跨域权限需要
rpc-allow-origin-all=true
#允许非外部访问
rpc-listen-all=true
#RPC端口, 仅当默认端口被占用时修改
#rpc-listen-port=6800
# token验证
rpc-secret=****
#rpc-user=****
#rpc-passwd=****
#最大同时下载数(任务数), 路由建议值: 3
max-concurrent-downloads=3
#断点续传
continue=true
#同服务器连接数
max-connection-per-server=6
#最小文件分片大小, 下载线程数上限取决于能分出多少片, 对于小文件重要
min-split-size=10M
#单文件最大线程数, 路由建议值: 5
split=6
#下载速度限制
max-overall-download-limit=0
#单文件速度限制
max-download-limit=0
#上传速度限制
max-overall-upload-limit=0
#单文件速度限制
max-upload-limit=0

input-file=/etc/aria2/aria2.session
save-session=/etc/aria2/aria2.session
#定时保存会话，需要1.16.1之后的release版
save-session-interval=60

#文件保存路径, 默认为当前启动位置
dir=/media/HDD/Download
#文件缓存, 使用内置的文件缓存, 如果你不相信Linux内核文件缓存和磁盘内置缓存时使用, 需要1.16及以上版本
#disk-cache=0
#另一种Linux文件缓存方式, 使用前确保您使用的内核支持此选项, 需要1.15及以上版本(?)
#enable-mmap=true
#文件预分配, 能有效降低文件碎片, 提高磁盘性能. 缺点是预分配时间较长
#所需时间 none < falloc ? trunc << prealloc, falloc和trunc需要文件系统和内核支持
#file-allocation=falloc

#启用本地节点查找
bt-enable-lpd=true
#添加额外的tracker
#bt-tracker=<URI>,
#单种子最大连接数
#bt-max-peers=55
#强制加密, 防迅雷必备
bt-require-crypto=true
#当下载的文件是一个种子(以.torrent结尾)时, 自动下载BT
follow-torrent=true
#BT监听端口, 当端口屏蔽时使用
listen-port=6881-6999

#不确定是否需要，为保险起见，need more test
enable-dht=false
bt-enable-lpd=false
enable-peer-exchange=false
#修改特征
user-agent=uTorrent/2210(25130)
peer-id-prefix=-UT2210-
#修改做种设置, 允许做种
seed-ratio=0
#保存会话
#force-save=true
bt-hash-check-seed=true
bt-seed-unverified=true
bt-save-metadata=true
```
