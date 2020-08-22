---
title: C++数组元素个数计算
author: Tokisaki Galaxy
top: false
cover: false
toc: true
mathjax: false
date: 2019-12-03
img: 
coverImg: 
summary: C++数组元素个数计算
tags:
 - C++
categories: 
password: 
---

```
int i_max(int a[]) {
	int tmp=a[0];
	for (int i = 0; i < sizeof(a) / sizeof(a[0]); i++)
		if (tmp < a[i])
			tmp = a[i];
//		tmp < a[i] ? tmp = a[i] : tmp = tmp;

	return tmp;
}
```

关键代码

```
sizeof(a) / sizeof(a[0])
```

这一段是网上流行(?)计算数组元素个数的代码

但是在数组为指针的时候,经常会出错(C6384)

> 解决方法:

使用结构(struct)传递
```
struct a{
int b[5]}
xxx(struct a)
{
sizeof(a.b);
}
````
似乎是因为在传递的时候,数组变成了一个指针...
