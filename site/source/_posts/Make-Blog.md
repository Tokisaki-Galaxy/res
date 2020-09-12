---
title: 搭建博客
author: Tokisaki Galaxy
top: true
cover: false
toc: true
mathjax: false
date: 2020-04-22 18:31:54
comments: enable
img:
coverImg:
password:
summary: 使用zeit托管博客，并使用cloudflare进行访问加速
tags:
  - Github
  - Hexo
  - zeit
  - vercel
categories:
  - 博客
---

# 第一部分

## HEXO简介

> Hexo 是一个快速、简洁且高效的博客框架。Hexo 使用 [Markdown](http://daringfireball.net/projects/markdown/)（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。

原来我是用jekyll的，但是无奈支持的东西比较少，生成速度慢，所以改HEXO。

### 1. 安装HEXO

[HEXO中文文档](https://hexo.io/zh-cn/docs/index.html)上都有



### 2.新建存储库

**如果你是把整个HEXO文件夹上传！！一定要设成私有！！**

**如果你用deploy部署，那随便你设不设私有**

 去Github上新建一个存储库，名字随便，记得**设置私有**。反正也就只有你和ZEIT上的机器人看得到。

至于为什么把整个HEXO上传，原因是如果你换一台电脑不是还可以接写博客吗。。



### 3.找一个模板直接clone下来

嘛其实`hexo init`也不是不行，只是懒。

推荐[hexo-blog-fly](https://github.com/shw2018/hexo-blog-fly.git)（当然你用别的也行），直接clone下来，打开名字叫`.git`的文件夹，用随便什么文本编辑器打开`.config`文件，找到里面的`[remote "origin"]`那一行，把里面的github上存储库的位置改成你自己在第一步新建的存储库位置。

接着试着用github desktop或者git进行push，如果没问题就往下看。

**当然有些教程会说设置deploy，这两种方法都可行，区别只是在zeit上的部署有一点点不同。但是我更喜欢这种方法。**



### 4.本地预览

随便打开个什么cmd或者powershell，进入上一步的那个文件夹，输入`hexo s`之后，等一会，直到你看到出现了`Hexo is running at http://localhost:4000`之后在浏览器里打开[这个网址](http://localhost:4000/)。

看完了按Ctrl+C就可以关掉本地预览。

啊对了，第一次操作会让你安装依赖包，跟着他提示操作就行了。



### 5.使用zeit托管

#### 为什么使用zeit托管

- 百度收录

- 免费

  > Vercel is the easiest way to deploy websites. Host your web projects with zero configuration, automatic SSL, and global CDN.

  ---

  同类产品有[netlify](https://app.netlify.com/)，其实这个也不错，我不用他是因为我不挂梯子打不开他的页面。

  其实我原来用Github Pages，但是那玩意域名我觉得不好看（xxx.github.io），并且不能被百度爬，所以最后放弃了。

  当然你也可以用coding对国内进行分流，来实现让百度爬你的目的，但是太麻烦了。并且coding的服务不太稳定。。。

  另一个是gitee，那个各方面都挺不错的，除了**不支持自定义域名**。。

  

  #### 1.[注册zeit](https://zeit.co/login)

  #### 2.导入

  主页点击 "Import Project"，然后 “Import Project From Git Repo”，选择 GitHub。进行一下授权，然后选择你在一开始新建的存储库导入。

  注意如果你用我的方法，将整个hexo文件夹同步到云端，你会看到你的类型是HEXO，如果你用的是deploy，这里显示是other。

  最后你就可以访问一个类似于xxxx.now.sh的网址来访问你的博客了（是不是比github那个xxx.github.io好看多了？）。

  并且如果你是将整个HEXO文件夹同步到github，你会发现

  #### 3.搞一个域名

  可能有人会问，zeit给的now.sh不好吗，搞什么自己域名？当然可以啦，只不过访问速度慢死而已，有了自己的域名就可以用cloudflare加速！

  域名随便你去哪弄，可以去买腾讯云的域名，首年才1块钱得一个xyz，而且附带可以用域名邮箱。

  当然你想白嫖可以，去[freenom](https://www.freenom.com/zh/index.html?lang=zh)注册个免费域名，然后把**NS服务商改成cloudflare**的就行了。

  （但是freenom上的域名**好像**不能注册腾讯的企业邮箱）

  #### 4.注册[cloudflare](https://www.cloudflare.com/)

  刚刚说过了，now.sh在国内访问速度不（惨）太（不）好（忍）看（睹），用cloudflare可以大大提升访问速度。

  去[cloudflare](https://www.cloudflare.com/)注册一个账户，然后按照提示一步一步操作，将NS记录（域名服务器记录）改成cloudflare为你提供的。

  **之后你所有DNS更改都需要在cloudflare上操作，否则无效**

  #### 5.增加指向zeit的记录

  去ZEIT，在项目里找到"view domains"，将你想用的域名输进去（就是前缀+""."+之前搞到的域名）

  然后按照他的提示去cloudflare增加一条CNAME。

  当然我其实想设置CNAME记录的，但是如果设置CNAME的话，总是出现一些奇奇怪怪的问题，所以只好设置成A记录。

  ![DNS-CONFIG](https://s1.ax1x.com/2020/04/22/JUuG1H.png)

  **无论如何，请一定确认时候一定要确认代理状态为黄色（已代理）**

  **无论如何，请一定确认时候一定要确认代理状态为黄色（已代理）**

  **无论如何，请一定确认时候一定要确认代理状态为黄色（已代理）**

  ##### 可能会有的一些坑

  ###### 1.访问博客出现525错误，如下图

  ![site-error-525](https://i.loli.net/2020/04/22/y7upcTkeHxlNJPw.png)

  这个问题原因我也不太清楚，但是可以通过设置cloudflare里面SSL/TLS规则来消除

  ![cloudflare-ssl-config](https://s1.ax1x.com/2020/04/22/JUu2Bq.png)

  如上图，先设置成关闭，然后访问你的博客直到可以正常访问，再设置成完全。

# 第二部分

大概就是讲博客的自定义配置，懒得写了。

等以后有空或者有人看再写吧。

## 接入评论

Gitalk

# 附件

` !update.bat`

```
@echo off
git add -A
git commit -m "Updated: %date:~0,4%/%date:~5,2%/%date:~8,2% %time%"
git push||git push||git push
```



`!preview.bat`

```
hexo s
```



# 第三部分

自带的节点已经足够好了！！！几乎可以不用自定义节点了

自定义节点可能还会减速！！！