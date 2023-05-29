---
title: SpringBoot框架课
tag: 后端
category: 后端
---

### java语法

### 输入

方式1，效率较低，输入规模较小时使用。

```java
Scnner sc = new Scanner(Systm.in);
String str = sc.next();
int x = sc.nextInt();
float y = sc.nextFlaot();
String line = sc.nextLine(); // 读入下一行
```

方式2，效率较高，输入规模较大时使用。注意需要抛异常。

```java
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Main {
	public static void main(String[] args) throws Exception {
        BufferedReader br =  new BufferedReader(new InputStramReader(System.in));
        String str = br.readLine();
        System.out.println(str);
    }
}
```

### 输出

方式1，效率较低，输出规模较小时使用。

```
System.out.println(123);  // 输出整数 + 换行
System.out.println("Hello World");  // 输出字符串 + 换行
System.out.print(123);  // 输出整数
System.out.print("yxc\n");  // 输出字符串
System.out.printf("%04d %.2f\n", 4, 123.456D);  // 格式化输出，float与double都用%f输出
```


方式2，效率较高，输出规模较大时使用。注意需要抛异常。

```
package com.yxc;

import java.io.BufferedWriter;
import java.io.OutputStreamWriter;

public class Main {
    public static void main(String[] args) throws Exception {
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        bw.write("Hello World\n");
        bw.flush();  // 需要手动刷新缓冲区
    }
}

```



### 数组

#### 常用API

属性length：返回数组长度，注意不加小括号
Arrays.sort()：数组排序
Arrays.fill(int[] a, int val)：填充数组
Arrays.toString()：将数组转化为字符串
Arrays.deepToString()：将多维数组转化为字符串
数组不可变长

### String类

length()：返回长度
split(String regex)：分割字符串
indexOf(char c)、indexOf(String str)：查找，找不到返回-1
equals()：判断两个字符串是否相等，注意不能直接用==
compareTo()：判断两个字符串的字典序大小，负数表示小于，0表示相等，正数表示大于
startsWith()：判断是否以某个前缀开头
endsWith()：判断是否以某个后缀结尾
trim()：去掉首尾的空白字符
toLowerCase()：全部用小写字符
toUpperCase()：全部用大写字符
replace(char oldChar, char newChar)：替换字符
replace(String oldRegex, String newRegex)：替换字符串
substring(int beginIndex, int endIndex)：返回[beginIndex, endIndex)中的子串

String不能被修改，如果打算修改字符串，可以使用StringBuilder和StringBuffer。

StringBuffer线程安全，速度较慢；StringBuilder线程不安全，速度较快。



Java的所有变量和函数都要定义在类中

函数或变量前加static表示静态对象，类似于全局变量

静态对象属于class, 而不属于静态函数和静态变量

静态函数中只能调用静态函数和静态变量



