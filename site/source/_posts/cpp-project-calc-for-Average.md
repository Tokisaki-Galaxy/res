---
title: 平均数及方差计算器
author: Tokisaki Galaxy
top: false
cover: false
toc: true
comments: enable
mathjax: false
noindex: false
sitemap: true
date: 2020-08-26 18:55:10
img:
coverImg:
summary: C++简易平均数及方差计算器
tags:
 - C++
 - 小型项目
categories:
 - 编程
password:
---

# Calc-for-Average
用于计算多个数字总和，平均值，方差的MFC程序

# 使用方法
把数据输入到框里，允许小数输入，使用空格分开

# 源码及下载
项目[Github地址](https://github.com/Tokisaki-Galaxy/Calc-for-Average)。
核心代码如下

```c++
UpdateData(TRUE);
string stringdata = CT2A(m_input.GetBuffer());
char* strdata=(char*)stringdata.c_str();
char* token, * next_token = NULL;
char seps[] = " ";
long double sum=0,e=0,s=0;
vector<long double> data;

token = strtok_s(strdata, seps, &next_token);

while (token != NULL) {
	if (token != NULL)
	{
		data.push_back(stold(token));
		token = strtok_s(NULL, seps, &next_token);
	}
}

for (size_t i = 0; i <= data.size(); i++) //求和
	sum += data[i];
    e = sum / data.size(); //求平均值

for (size_t i = 0; i <= data.size(); i++) { //求方差
	if (i != data.size() - 1)
	s += (data[i] - e) * (data[i] - e);
}
s = s / data.size();

string sum_ret = to_string(sum);
string e_ret = to_string(e);
string s_ret = to_string(s);

m_sum = sum_ret.c_str();
m_avg = e_ret.c_str();
m_var = s_ret.c_str();

UpdateData(FALSE);
```
