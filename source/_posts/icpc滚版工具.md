---
title: icpc滚榜工具
tag: acm
---

[icpc滚榜工具](https://tools.icpc.global/)

个人使用的是2.4.727版本

参考博客：

[icpc-tools resolver 滚榜工具使用指北 ](https://blog.jingwei.site/2018/05/22/icpc-tools-resolver-gun-bang-gong-ju-shi-yong-zhi-bei/)

[ICPC-TOOLs resolver滚榜单工具使用指南](https://blog.csdn.net/xzx18822942899/article/details/128275137)

[滚榜程序Resolver源码阅读](https://blog.lanly.vip/article/7)

​    在ccpc省赛前一个月，老师联系我尝试一下滚榜，其实当时也不知道icpc这个工具，只是先硬着头皮接。经过网上搜索、对比分析发现这个滚榜工具效果比较满意，毕竟大部分区域赛滚榜都是用的这个。

​    不过网上关于这个工具的博客并不多，但通过认真研究以上博客应该问题不大。

​    本文主要介绍一下个人的数据处理过程和过程中遇到的坑，建议配合chatgpt进行数据处理。

由于是使用pinta比赛，我是爬取比赛提交记录，经过处理之后在本地运行，参考博客中cdp目录结构，有java环境即可

### 数据处理：

我的思路是根据提交列表，首先把队伍id或者name去重获取队伍名单。

再遍历提交数据，把爬取的提交数据和run中的数据进行映射，有部分信息需要处理，其中time项是从提交时间-比赛开始时间，timestamp是时间戳(不加也行)

我是先把这些信息放到一个xml文件中，然后再把这些信息加入events.xml中

### 遇到的坑：

- xml中文件最好按照博客中的顺序来，其中finalized项必须有且必须在最后 
- 我在测试过程中发现会出现jvm内存不够的情况，可能是因为提交数量过大，3k以下没太大问题。解决方法：修改resolver.bat最后一行，java -Xmx4096m把1024m加大点 
- 编译错误或者系统异常的提交可以直接丢弃 
- 需要考虑提交多次AC代码的情况，在run中有一个solved的标签，这个标签就是之前是否AC，简单的方法就是暴力循环之前的提交是否有相同team,problem通过，通过就设置为true

```python
        sol = "false"
        for j in range(i):  # solved: 看之前是否正确提交过
            item1 = datas[i]
            item2 = datas[j]
            problem1 = item1['problemSetProblem']['problemPoolIndex']
            problem2 = item2['problemSetProblem']['problemPoolIndex']

            team1 = item1['user']['studentUser']['studentNumber']
            team2 = item2['user']['studentUser']['studentNumber']

            if problem1 == problem2 and team1 == team2 and item2['status'] == "ACCEPTED":
                sol = 'true'
```

### 使用技巧

在events.xml文件设置好的前提下，使用其中的award进行奖项设置

使用   ./awards.sh，选择自己的events.xml并连接

![img](https://pic1.zhimg.com/80/v2-321e3b1399c133241a6c6ebae4b7161c_720w.png?source=d16d100b)



编辑

添加图片注释，不超过 140 字（可选）

设置好奖项后，点击save，文件名为contest.json

![img](https://picx.zhimg.com/80/v2-bd2b757ba9d6aa78fa7c192977d29975_720w.png?source=d16d100b)



编辑切换为居中

添加图片注释，不超过 140 字（可选）

如果不需要展示照片的话，其实就可以直接使用了

输入./resolver.bat ./cdp/contest.json命令然后就可以开始滚榜了

滚榜是可以切屏的，通过鼠标点击控制滚榜，在获奖区之前按↑↓可以控制滚榜速度，到了获奖区可以按1和2进行后退前进

### events.xml文件配置

除了team和run，也就是队伍信息和提交记录

```xml
<contest>
    <info>
        <length>5:00:00</length>
        <penalty>20</penalty>
        <started>False</started>
        <starttime>1512824400.0</starttime>
        <title>2023 ACM-CCPC Henan Province Contest</title>
        <short-title>2023 &#27827;&#21335;&#30465; CCPC Province Contest</short-title>
        <scoreboard-freeze-length>1:00:00</scoreboard-freeze-length>
        <contest-id>default--3</contest-id>
    </info>

    <region>
        <external-id>1</external-id>
        <name>School of Computer and Communication Engineering</name>
    </region>


    <judgement>
        <id>1</id>
        <acronym>AC</acronym>
        <name>Yes</name>
        <solved>true</solved>
        <penalty>false</penalty>
    </judgement>
    <judgement>
        <id>2</id>
        <acronym>WA</acronym>
        <name>No - Wrong Answer</name>
        <solved>false</solved>
        <penalty>true</penalty>
    </judgement>
    <judgement>
        <id>3</id>
        <acronym>CE</acronym>
        <name>No - Compile Error</name>
        <solved>false</solved>
        <penalty>true</penalty>
    </judgement>
    <judgement>
        <id>4</id>
        <acronym>RE</acronym>
        <name>No - Run Time Error</name>
        <solved>false</solved>
        <penalty>true</penalty>
    </judgement>
    <judgement>
        <id>5</id>
        <acronym>SE</acronym>
        <name>No - System Error</name>
        <solved>false</solved>
        <penalty>false</penalty>
    </judgement>

    <language>
        <id>1</id>
        <name>c</name>
    </language>
    <language>
        <id>2</id>
        <name>c++</name>
    </language>
    <language>
        <id>3</id>
        <name>java</name>
    </language>


    <problem>
        <id>1</id>
        <letter>A</letter>
        <name>A</name>
    </problem>
    <problem>
        <id>2</id>
        <letter>B</letter>
        <name>B</name>
    </problem>
    <problem>
        <id>3</id>
        <letter>C</letter>
        <name>C</name>
    </problem>
    <problem>
        <id>4</id>
        <letter>D</letter>
        <name>D</name>
    </problem>
    <problem>
        <id>5</id>
        <letter>D</letter>
        <name>D</name>
    </problem>
    <problem>
        <id>6</id>
        <letter>E</letter>
        <name>E</name>
    </problem>
    <problem>
        <id>7</id>
        <letter>F</letter>
        <name>F</name>
    </problem>
    <problem>
        <id>8</id>
        <letter>G</letter>
        <name>G</name>
    </problem>
    <problem>
        <id>9</id>
        <letter>H</letter>
        <name>H</name>
    </problem>
    <problem>
        <id>10</id>
        <letter>I</letter>
        <name>I</name>
    </problem>

    <problem>
        <id>11</id>
        <letter>J</letter>
        <name>J</name>
    </problem>

    <problem>
        <id>12</id>
        <letter>K</letter>
        <name>K</name>
    </problem>
```