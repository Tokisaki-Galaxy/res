---
title: strtok_s()函数用法
author: Tokisaki Galaxy
top: false
cover: false
toc: true
comments: true
mathjax: false
noindex: false
sitemap: true
date: 2020-08-28 18:34:18
img:
coverImg:
summary: strtok_s()函数用法
tags:
 - C++
categories:
 - 编程
password:
---

> 当您需要性能优化时，请考虑 C printf和sprintf，它们快速且易于使用。 但是，它们不能扩展或免受漏洞的攻击。 （存在安全版本，但它们会受到轻微的性能损失。 有关详细信息，请参阅printf_s、_printf_s_l、wprintf_s、_wprintf_s_l和sprintf_s、_sprintf_s_l、swprintf_s、_swprintf_s_l。
by MSDN，某些旧函数，包括`strtok()`似乎有一些安全性的问题，被`strtok_s()`代替，新函数新加入了一个参数，感觉新函数比以前那个更好用。使用示例如下

```cpp
#include <iostream>
#include <string.h>
#include <stdio.h>

using namespace std;

char c_string[] =
"1 2 3 4 5";
char sepa[] = " ";
char *token = NULL;
char *next_token = NULL;

int main()
{
    // Establish string and get the first token:
    token = strtok_s(c_string, sepa, &next_token);

    // While there are tokens in "string1" or "string2"
    while (token != NULL)
    {
        // Get next token:
        if (token != NULL)
        {
            printf_s(" %s\n", token);
            token = strtok_s(NULL, sepa, &next_token);
        }
    }
    printf("remain:\n");
    printf("%d", token);
}
```
