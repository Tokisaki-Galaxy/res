---
title: 制作VS-C++便携版(基于VSCode)
date: 2019-08-27 11:41:03
author: Tokisaki Galaxy
img: 
coverImg: 
top: false
cover: false
toc: true
mathjax: false
comments: true
summary: 制作基于VsCode的C++便携版
tags:
  - VSCode
categories:
  - 软件安装与配置
password:
---

# 正文

[不想动手可以直接下载的懒人版,密码QRSJ](https://eyun.baidu.com/s/3jJhjRmA)

>* VSCode
>* LLVM
>* mingw64

[下载VSCode](https://code.visualstudio.com/Download)

**注意选择下载压缩包格式**

---------

[下载LLVM](http://releases.llvm.org/download.html)

不需要选sig文件

**注意选择"Pre-Built Binaries",系统位数要对应你上面选的**

---------

[下载MinGW-W64](https://sourceforge.net/projects/mingw-w64/files/)

**如果你系统版本是x64,下载x86_64-posix-seh**

**如果你系统版本是x32,下载x86_64-win32-seh**

----------

1.解压VSCode到某个地方,再把MinGW解压到VSCode的目录里

我做这几部只是为了得到LLVM目录,卸载掉它只是因为不想让程序列表里太多**非强迫症可以忽略2-4步,直接选择安装目录到第一步文件夹里**


2.安装LLVM,先**随便**安装到一个位置

3.把LLVM目录整个拷到第1步里的目录里

4.卸载掉你系统里的LLVM

5.将附件中!start.vbs和start.bat复制到第一步的文件夹中

6.注释掉start.bat最后一行**就是在最后一行前面加::**

7.**!!这一步做完不要关!!**在cmd(或者power shell)中输入.\start.bat运行脚本,然后输入clang和gcc.**如果出现xxx不是内部或外部命令,就说明你start.bat配置有问题** 

8.在你第1步的文件夹中新建以下名字的**文件夹**
```
Users
	Users\AppData
		Users\AppData\Local
		Users\AppData\Roaming
		Users\AppData\Desktop

extensions
```

9.安装扩展
```
Chinese(简中语言包)
C/C++
vscode-clangd
Code Runner
Bracket Pair Colorizer 2
One Dark Pro(主题包,可选)
```

10.在第7步中的cmd(或power shell)中输入.\code.exe进入VSCode

11.在文件浏览器中新建一个目录(**我就直接在第1步的目录中新建了一个!Code**),然后在VSCode中打开它,然后选择将工作区另存为

需要注意的是这里你把每个语言的工作目录放到单独的文件夹中,比如c放到c中,c++放到c++中


12.在!Code中又新建一个名叫C++的文件夹**(具体参照自身情况)**

13.在C++目录中新建一个.vscode的文件夹,然后在里面把附件中的launch.json,tasks.json,settings.json,compile_flags.txt复制进去

14.取消第6步中的注释,关掉这个VSCode.运行!start.vbs

15.新建一个文件,输入点什么测试代码
```
#include <iostream>
using namespace std;
int main (){
    string a="";
	cout << "Input:" << endl;
    cin >> a;
    cout << a;
    return 0;
}
```

16.点击右上箭头,看看控制台是不是输出了Input:.然后输入随便什么东西,看看它会不会原封不动的显示出来

17.没了



# 附件

--------------

## start.bat
```
set ThisDir=%~dp0
set USERPROFILE=%ThisDir%Users
set APPDATA=%USERPROFILE%\AppData\Roaming
set path=%ThisDir%LLVM\bin;%ThisDir%mingw64\bin;%path%
REM Code.exe --extensions-dir "extensions"
Code.exe !Code\C++\code.code-workspace
```

## !start.vbs
```
set ws=createobject("wscript.shell")
ws.run "start.bat",0
```

## launch.json
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "(gdb) Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "${fileDirname}/${fileBasenameNoExtension}.exe",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": true,
            "internalConsoleOptions": "neverOpen",
            "MIMode": "gdb",
            "miDebuggerPath": "gdb.exe",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": false
                }
            ],
            "preLaunchTask": "Compile"
        }
    ]
}
```

## tasks.json

```
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Compile",
            "command": "clang++", //如果你是用c语言,改成clang
            "args": [
                "${file}",
                "-o",
                "${fileDirname}/${fileBasenameNoExtension}.exe",
                "-g",
                "-Wall",
                "-static-libgcc",
                "--target=x86_64-w64-mingw",
            ],
            "type": "process",
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared"
            },
		}
    ]
}
```

## settings.json
```
{
    "files.defaultLanguage": "c",
    "editor.formatOnType": true,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.acceptSuggestionOnEnter": "off",

    "code-runner.runInTerminal": true,
    "code-runner.executorMap": {
        "c": "cd $dir && clang '$fileName' -o '$fileNameWithoutExt.exe' -Wall -g -O2 -static-libgcc --target=x86_64-w64-mingw -std=c11 && &'$dir$fileNameWithoutExt'",
        "cpp": "cd $dir && clang++ '$fileName' -o '$fileNameWithoutExt.exe' -Wall -g -O2 -static-libgcc --target=x86_64-w64-mingw -std=c++17 && &'$dir$fileNameWithoutExt'"
    },
    "code-runner.saveFileBeforeRun": true,
    "code-runner.preserveFocus": true,
    "code-runner.clearPreviousOutput": false,
    "code-runner.ignoreSelection": true,

    "C_Cpp.clang_format_sortIncludes": true,
    "C_Cpp.errorSquiggles": "Disabled",
    "C_Cpp.autocomplete": "Disabled",
    "C_Cpp.suggestSnippets": false,
}
```

## compile_flags.txt
```
-Wall
--target=x86_64-w64-mingw
-std=c++17
#写的语言是C,注释掉上面那行
```