---
title: strtok_s()函数用法
author: Tokisaki Galaxy
top: false
cover: false
toc: true
comments: enable
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
password:
---

`strtok()`似乎有一些安全性的问题，被`strtok_s()`代替，新加入了一个参数，使用示例如下

```c++
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
