---
title: c++ 操作mysql数据库
author: Tokisaki Galaxy
top: false
cover: false
toc: true
comments: enable
mathjax: false
noindex: false
sitemap: true
date: 2020-09-12 14:17:04
img:
coverImg:
summary:
tags:
categories:
password:
---

# mysql5 安装

用**管理员**命令行进/bin目录，输入`mysqld.exe --install&&net start mysql`

## 修改密码

首次修改输入`mysqladmin -u root password "new_password"`。
修改旧密码输入`首次修改输入`mysqladmin -u root -p password "new_password"`，然后输入原有旧密码。

# IDE设置

首先需要在include目录中加上`mysql5\include`
lib目录中加上`mysql5\lib\opt`
（可选）在链接器的链接的lib文件中，添加`libmysql.lib`。
**如果你找不到怎么添加libmysql.lib，可以跳过这一步**

# 使用C++代码链接并操作数据库

## 需要的头文件
首先需要包含以下头文件
```c++
#include <winsock2.h>
#include <mysql.h>
#pragma comment(lib,"libmysql.lib") //如果你在IDE中设置了加入libmysql.lib,就可以不需要这一行，但是你加上去也没事
```

## 链接数据库
```c++
MYSQL mysqlconn;
mysql_init(&mysqlconn);
char * host="127.0.0.1";        //服务器地址
int port=3306;                  //端口
char * username="root";         //用户名
char * password="1234567890";   //密码
char * dbname="virus";          //数据库名

(mysql_real_connect(&mysqlconn,host,username,password,dbname,port,NULL,CLIENT_FOUND_ROWS) != NULL)?cout<<"success"<<endl:cout<<"fail"<<endl;

mysql_query(&mysqlconn,"set names gbk");    //链接完之后设置编码为GBK
```

## 读取数据库数据

```c++
void getdata()
{
    MYSQL_RES *     mysql_res;
    MYSQL_FIELD *   mysql_field;
    MYSQL_ROW       mysql_row;
    char * sql="select * from virus_data where city_deadCount>50";

    if(mysql_query(&mysqlconn,sql)==0)
    {
        cout<<"get data success"<<endl;
        mysql_res=mysql_store_result(&mysqlconn);
        if(mysql_res)
        {
            int fiendcount=mysql_num_fields(mysql_res);
            int rowcount=mysql_num_rows(mysql_res);
            cout<<fiendcount<<endl;
            cout<<rowcount<<endl;

            for(int i=0;i<fiendcount;i++)
            {
                mysql_field=mysql_fetch_field(mysql_res);
                cout<<mysql_field->name<<" ";
            }
            cout<<endl;

            for(int i=0;i<rowcount;i++)
            {
                mysql_row=mysql_fetch_row(mysql_res);
                for(int ja=0;ja<fiendcount;ja++)
                {
                    cout<<mysql_row[ja]<<" ";
                }
                cout<<endl;
            }
        }
    }else{
        cout<<"get data fail"<<endl;
    }
}
```

## 修改数据库数据
```c++
string sql;
sqla = "update item set qty=" + tmp + " where itemid='" + itemid + "'";   			//修改
sqlb = "delete from user where userid='" + userid + "'";							//删除
sqlc = "insert into datemax(date,value) values('" + date + "','" + "1" + "');";     //插入
mysql_query(&mysqlconn, sql);
```

# 项目实例

[Github](https://github.com/Tokisaki-Galaxy/LEARN-C)