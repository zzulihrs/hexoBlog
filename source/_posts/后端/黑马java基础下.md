- [x] [从入门到起飞（下）课程介绍](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=1)
- [x] [集合进阶-01-双列集合的特点](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=2)
- [x] [集合进阶-02-Map集合常用的API](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=3)

``` 
V put(K key, V value)   添加元素
V remove(Object key)    根据键删除键值对元素
void clear()         移除所有的键值对元素
boolean containsKey(Object key) 判断是否包含指定键
boolean containsValue(Object value)
boolean isEmpty()
int size()
```



- [x] [集合进阶-03-Map集合的第一种遍历方式（键找值）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=4)

```java
// 获取所有的键，把这些键放到一个单列集合中
Set<String> keys = map.keySet();
for(String key : keys) {
    String value = map.get(key);
}
        
Set<Map.Entry<String, String>> entries = map.entrySet();
for(Map.Entry<String, String> entry : entries) {
    String key = entry.getKey();
    String value = entry.getValue();
}

map.forEach(new BiConsumer<String, String>() {
    @Override
    public void accept(String key, String value) {

    }
});
```



- [x] [集合进阶-04-Map集合的第二种遍历方式（键值对）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=5)
- [x] [集合进阶-05-Map集合的第三种遍历方式（lambda表达式）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=6)
- [x] [集合进阶-06-HashMap基本的使用](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=7)
- [x] [集合进阶-07-HashMap练习一（存储自定义对象）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=8)
- [x] [集合进阶-08-HashMap练习二（利用Map集合进行统计）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=9)
- [x] [集合进阶-09-LinkedHashMap](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=10)
- [x] [集合进阶-10-TreeMap的基本使用和基础练习1](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=11)

```java
TreeMap<Integer, String> tm = new TreeMap<>(new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                return o1-o2;
            }
        });
```



- [x] [集合进阶-11-TreeMap练习2-键位置添加自定义对象](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=12)
- [x] [集合进阶-12-TreeMap练习3-利用TreeMap进行统计](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=13)

如果题目中没有要求对结果进行排序，默认使用hashMap

如果题目中要求对结果进行排序，使用TreeMap

```java
        Scanner sc = new Scanner(System.in);
        String s = sc.nextLine();

        TreeMap<Character, Integer> tm = new TreeMap<>();

        for(int i = 0; i < s.length(); ++i) {
            char c = s.charAt(i);
            if(tm.containsKey(c)) {
                tm.put(c, tm.get(c) + 1);
            } else {
                tm.put(c, 1);
            }
        }

        // 输出
        StringBuilder sb = new StringBuilder();

        tm.forEach((k, v) -> {
            sb.append(k).append("(").append(v).append(")");
        });
        System.out.println(sb);

        StringJoiner sj = new StringJoiner("", "", "");
        tm.forEach((k, v) ->sj.add(k+"").add("(").add(v+"").add(")"));
        System.out.println(sj);

        for(Map.Entry<Character, Integer> entry: tm.entrySet()) {
//            System.out.println(entry.getKey() + " " + entry.getValue());
        }
```



- [x] [集合进阶-13-HashMap源码超详细解析（一）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=14)



- [x] [集合进阶-14-HashMap源码超详细解析（二）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=15)
- [x] [集合进阶-15-HashMap源码超详细解析（三）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=16)
- [x] [集合进阶-16-HashMap源码超详细解析（四）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=17)
- [x] [集合进阶-17-TreeMap源码超详细解析（一）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=18)
- [x] [集合进阶-18-TreeMap源码超详细解析（二）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=19)
- [x] [集合进阶-19-可变参数](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=20)

```
// 可变参数的小细节

本质上是一个数组，其实就是把多个参数转成数组，但注意类型要一致
// 1. 在方法的形参中最多只能写一个可变参数
// 2. 在方法中，如果除了可变参数以外，还有其它的形参，那么可变参数要写在最后
public static int getSum(int a, int...args) {
        for(int i:args) {}
    }
```



- [x] [集合进阶-20-集合工具类Collections](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=21)

```java
public static <T> boolean addAll(Collection <T> c, T... e) 批量添加元素
public static void shuffle(List<?> list) 打乱List集合元素的顺序

// 1.创建集合对象
        ArrayList<String> list = new ArrayList<>();

        // 2.添加元素
        Collections.addAll(list, "hello", "world", "java");
        
        // 3. 打乱数组
        Collections.shuffle(list);
```



- [x] [集合进阶-21-综合练习1-随机点名器的两种实现方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=22)

- [x] [集合进阶-22-综合练习2-带有概率的随机点名](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=23)

- [x] [集合进阶-23-综合练习3-不重复的随机点名](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=24)

- [x] [集合进阶-24-综合练习4~5-带权重的随机点名项目](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=25)
- [x] [集合进阶-25-综合练习6-集合嵌套](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=26)
- [x] [阶段项目（斗地主）-01-准洗发](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=27)
- [x] [阶段项目（斗地主）-02-第一种排序方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=28)
- [x] [阶段项目（斗地主）-03-第二种排序方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=29)
- [x] [阶段项目（斗地主）-04-登录页面](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=30)
- [x] [阶段项目（斗地主）-05-游戏页面](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=31)
- [x] [阶段项目（斗地主）-06-面向对象设计（Poker）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=32)
- [x] [阶段项目（斗地主）-07-游戏完善](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=33)
- [x] [不可变集合超详解](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=34)

```
 在List、Set、Map接口中，都存在静态的of方法，可以获取一个不可变的集合
 static<E> List<E> of(E ..e) 
 static<E> Set<E> of(E ..e)
 static<E> Map<E> of(E ..e)
 
 创建不可变Map集合
  细节1： 键不能重复
  细节2：Map里面的of方法，参数是有上限的，最多只能传递20个参数，10个键值对
  细节3：如果要传递多个对象，超过10个，ofEntries
 List和Set可以传多个
 Map.copyOf  jdk10
 
```

- [x] [Stream流-01-初爽Stream流](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=35)

```
list.stream().filter(name->name.startsWith("张")).filter(name->name.length()==3);
```

- [x] [Stream流-02-Stream流的思想和获取Stream流](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=36)

1. 先得到一条Stream流(流水线)，并把数据放上去

| 获取方式     | 方法名                                                       | 说明                     |
| ------------ | ------------------------------------------------------------ | ------------------------ |
| 单列集合     | default Stream<E> stream()                                   | Collection中的默认方法   |
| 双列集合     | 无（需要先用keySet()、entrySet()【所有的键值对对象】转成单例集合） | 无法直接使用Stream流     |
| 数组         | public static<T> Stream<T> stream(T [] array)                | Arrays工具类中的静态方法 |
| 一堆零散数据 | public static<T> Stream<T> of(T...values)                    | Stream接口中的静态方法   |



1. 利用Stream流中的API进行各种操作：过滤，转换，统计，打印

```
set.stream()
map.keySet().stream()
Arrays.stream(arr)
stream.of(1, 2, 3, 4, 5)
```

Stream接口中静态方法of的细节

方法的形参是一个可变参数，可以传递一堆零散的数据，也可以传递数组

但数组必须是引用数据类型，如果传递基本数据类型，是会把整个数组当成一个元素，放到stream中

- [x] [Stream流-03-Stream流的中间方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=37)

| 名称                                             | 说明                                |
| ------------------------------------------------ | ----------------------------------- |
| Stream<T> filter(Predicate<? super T> predicate) | 过滤                                |
| Stream<T> limit(long maxSize)                    | 获取前几个元素                      |
| Stream<T> skip(long n)                           | 跳过前几个元素                      |
| Stream<T> distinct()                             | 元素去重，依赖(hasCode和equals方法) |
| static<T> Stream<T> concat(Stream a, Stream b)   | 合并a和b两个流合为一个流            |
| Stream<T> map(Function<T, R>mapper)              | 转换流中的数据类型                  |

```
function<String, Integer> 第一个类型，流中原本的数据类型，第二个类型：要转成之后的类型
apply的形参s: 依次表示流里面的每一个数据
返回值：表示转换之后的数据
当map方法执行完毕之后，流上的数据就变成了整数
list.stream.map(new Function<String, Integer>()) {
	Override
	public Integer apply(String s) {
		String[] arr = s.split("-");
		// 张无忌-15
		reutnr Integer.parseInt(arr[1]);
	}.forEach(s->System.out.println(s));
};

或者
list.stream.map(s->integer.parseInt(s.split("-")[1]));
```





注意1：中间方法，返回新的Stream流，原来的Stream流只能使用一次，建议使用链式编程

注意2：修改Stream流中的数据，不会影响原来集合或者数组中的数据

- [x] [Stream流-04-Stream流终结方法详解](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=38)

| 名称                          | 说明                       |
| ----------------------------- | -------------------------- |
| void forEach(Consumer action) | 遍历                       |
| long count()                  | 统计                       |
| toArray()                     | 收集流中的数据，放到数组中 |
| collect(Collector collector)  | 收集流中的数据，放到集合中 |

```
IntFunction红的泛型，具体类型的数组
apply的形参：流中数据的个数，要跟数组的长度保持一致
apply的返回值，具体类型的数组
方法体：就是创建数组
toArray方法的参数作用，负责创建一个指定类型的数组
toArray方法的底层，会依次得到流里面的每一个数据，并把数据放到数组当中
toArray方法的返回值，是一个装着流里面所有数据的数组
String[] arr = list.stream().toArray(new IntFunction<String []>() {
   @Override
   public String[] apply(int value) {
   		return new String[value];
   }
});
System.out.println(Array.toString(arr));
String arr2 = list.stream().toArray(value -> new String[value]);


```

- [x] [Stream流-05-收集方法collect超详解](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=39)

注意：如果我们收集到Map集合当中，键不能重复，否则会报错

```
/*
         *  collect(Collector collector) 收集流中的数据，放到集合中（List, Set, Map）
         */

        ArrayList<String> list = new ArrayList<>();
        Collections.addAll(list, "张无极-男-14", "赵敏-女-13");

        // 收集List集合中
        // 需求，把所有的男性收集起来
        List<String> newList = list.stream()
                .filter(s -> s.split("-")[1].equals("男"))
                .collect(Collectors.toList());
        
        Collectors.toSet();

		        Collectors.toMap(new Function<String, String>() { //第一个参数是流中的数据，第二个参数是收集到的数据
            @Override
            public String apply(String s) { // s流中的数据
                return s.split("-")[0];
            }
        },  new Function<String, Integer>() {
            @Override
            public Integer apply(String s) {
                return Integer.parseInt(s.split("-")[2]);
            }
        });
```



- [x] [Stream流-06-综合练习1-数字过滤](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=40)
- [x] [Stream流-07-综合练习2-字符串过滤并收集](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=41)
- [x] [Stream流-08-综合练习3-自定义对象过滤并收集](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=42)
- [x] [方法引用-01-方法引用概述](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=43)

把已经有的方法拿过来用，当作函数式接口中抽象方法的方法体

1. 引用处必须是函数式接口
2. 被引用的方法必须已经存在
3. 被引用方法的形参和返回值需要跟抽象方法保持一致
4. 被引用方法的功能要能满足当前需求

```
Arrays.sort(arr, new Compareator<integer>() {
	@override
	public int compare(Integer o1, Integer 02) {
		return o2 - o1;
	}
})

// 表示引用FunctionDemo1类里面的subtraction方法
// :: 是方法引用符
Arrays.sort(arr, FunctionDem1::subtraction);

public int subtraction(int n1, int n2) {
	return n2-n1;
}
```



- [x] [方法引用-02-引用静态方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=44)
- [x] [方法引用-03-引用其他类的成员方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=45)
- [x] [方法引用-04-引用本类或父类的成员方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=46)
- [x] [方法引用-05-引用构造方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=47)
- [x] [方法引用-06-类名引用成员方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=48)
- [x] [方法引用-07-引用数组的构造方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=49)
- [x] [方法引用-08-练习1（转成自定义对象并收集到数组）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=50)
- [x] [方法引用-08-练习2（获取部分属性并收集到数组）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=51)
- [x] [异常-01-异常体系介绍](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=52)
- [x] [异常-02-编译时异常和运行时异常](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=53)
- [x] [异常-03-异常在代码中的两个作用](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=54)
- [x] [异常-04-JVM虚拟机默认处理异常的方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=55)
- [x] [异常-05-try...catch捕获异常](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=56)

```
try {
	// 可能出现异常的代码
} catch(ArrayIndexOutOfBoundsException e) {
	// 如果出现了ArrayIndexOutOfBoundsException，数组越界异常
	// 对应处理方式
}
```



- [x] [异常-06-捕获异常灵魂四问（①②）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=57)
- [x] [异常-07-捕获异常灵魂四问（③④）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=58)
- [x] [异常-08-异常中的常见方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=59)
- [x] [异常-09-抛出异常](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=60)

```
手动抛出异常，方法没有继续执行下去的意义了，方法结束并告诉出现问题
throw throws
```

- [x] [异常-10-综合练习](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=61)

- [x] [异常-11-自定义异常](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=62)

- [x] [File-01-File的概述和构造方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=63)

- [ ] [File-02-File的成员方法（判断、获取）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=64)

- [ ] [File-03-File的成员方法（创建、删除）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=65)

- [ ] [File-04-File的成员方法（获取并遍历）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=66)

- [ ] [File-05-File的成员方法（所有获取并遍历的方法）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=67)

- [ ] [File-06-综合练习1（创建文件）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=68)

- [ ] [File-07-综合练习2（单个文件夹查找文件）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=69)

- [ ] [File-08-综合练习3（遍历硬盘查找文件）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=70)

- [ ] [File-09-综合练习4（删除文件夹）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=71)

- [ ] [File-10-综合练习5（统计文件夹大小）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=72)

- [ ] [File-11-综合练习6（统计各种文件数量）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=73)

- [x] [IO流-01-IO流的概述](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=74)

- [x] [IO流-02-IO流的体系和字节输出流基本用法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=75)

- [x] [IO流-03-字节输出流写出数据的细节](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=76)

- [x] [IO流-04-字节输出流写出数据的三种方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=77)

- [x] [IO流-05-换行和续写](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=78)

- [x] [IO流-06-字节输入流的基本用法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=79)

- [x] [IO流-07-字节输入流读取数据的细节](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=80)

- [x] [IO流-08-字节输入流循环读取](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=81)

- [x] [IO流-09-文件拷贝的基本代码](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=82)

- [x] [IO流-10-文件拷贝的弊端和解决方案](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=83)

- [x] [IO流-11-文件拷贝改写](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=84)

- [x] [IO流-12-IO流中不同JDK版本捕获异常的方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=85)

- [x] [IO流-13-字符集详解（ASCII,GBK）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=86)

- [x] [IO流-14-字符集详解（Unicode）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=87)

- [x] [IO流-15-为什么会有乱码？](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=88)

- [x] [IO流-16-Java中编码和解码的代码实现](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=89)

- [x] [IO流-17-字符输入流-空参read方法详解](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=90)

- [x] [IO流-18-字符输入流-有参read方法详解](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=91)

- [x] [IO流-19-字符流输出流写出数据](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=92)

- [ ] [IO流-20-字符输入流的底层原理超详解](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=93)

- [ ] [IO流-21-字符输出流的底层原理超详解](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=94)

- [ ] [IO流-22-综合练习01（拷贝文件夹）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=95)

- [ ] [IO流-23-综合练习02（加密和解密文件）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=96)

- [ ] [IO流-24-综合练习03（修改文件中的数据）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=97)

- [ ] [IO流-25-字节缓冲流拷贝文件（一次读写一个字节）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=98)

- [ ] [IO流-26-字节缓冲流拷贝文件（一次读写一个字节数组）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=99)

- [ ] [IO流-27-字节缓冲流的读写原理](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=100)

- [ ] [IO流-28-字符缓冲流](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=101)

- [ ] [IO流-29-综合练习01（四种拷贝方式效率对比）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=102)

- [ ] [IO流-30-综合练习02（恢复出师表的顺序）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=103)

- [x] [IO流-31-综合练习03（控制软件运行次数）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=104)

- [ ] [IO流-32-转换流基本用法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=105)

- [ ] [IO流-33-转换流练习](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=106)

- [ ] [IO流-34-序列化流](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=107)

- [ ] [IO流-35-反序列化流](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=108)

- [ ] [IO流-36-序列化流和反序列化流的使用细节](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=109)

- [ ] [IO流-37-综合练习（读写多个对象）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=110)

- [ ] [IO流-38-字节打印流](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=111)

- [ ] [IO流-39-字符打印流](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=112)

- [ ] [IO流-40-解压缩流](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=113)

- [ ] [IO流-41-压缩流-压缩单个文件](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=114)

- [ ] [IO流-42-压缩流-压缩文件夹](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=115)

- [x] [IO流-43-常用工具包（Commons-io）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=116)

- [x] [IO流-44-常用工具包（hutool）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=117)

- [ ] [IO流-45-综合练习01-网络爬虫（爬取姓氏）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=118)

- [ ] [IO流-46-综合练习02-网络爬虫（爬取名字）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=119)

- [ ] [IO流-47-综合练习03-网络爬虫（数据处理）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=120)

- [ ] [IO流-48-综合练习04-网络爬虫（数据处理并写出）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=121)

- [ ] [IO流-49-综合练习05-利用糊涂包生成假数据](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=122)

- [ ] [IO流-50-综合练习06-随机点名器的四个需求](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=123)

- [ ] [IO流-51-综合练习07-带权重的随机算法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=124)

- [ ] [IO流-52-综合练习08-登录注册](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=125)

- [ ] [IO流-53-综合练习09-拼图游戏（导入项目）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=126)

- [ ] [IO流-54-综合练习10-拼图游戏（登录界面）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=127)

- [ ] [IO流-55-综合练习11-拼图游戏（注册界面）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=128)

- [ ] [IO流-56-综合练习12-拼图游戏（存档）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=129)

- [ ] [IO流-56-综合练习13-拼图游戏（读档）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=130)

- [ ] [IO流-56-综合练习14-拼图游戏（数据同步）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=131)

- [ ] [IO流-57-综合练习15-properties的基本使用](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=132)

- [ ] [IO流-58-综合练习16-拼图游戏（配置文件）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=133)

- [ ] [IO流-59-综合练习17-每日一记（阶段大作业）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=134)

- [x] [多线程&JUC-01-什么是多线程？](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=135)

- [x] [多线程&JUC-02-并发和并行](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=136)

- [x] [多线程&JUC-03-多线程的第一种实现方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=137)

- [x] [多线程&JUC-04-多线程的第二种实现方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=138)

- [x] [多线程&JUC-05-多线程的第三种实现方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=139)

- [x] [多线程&JUC-06-多线程中的常用成员方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=140)

- [x] [多线程&JUC-07-线程的优先级](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=141)

- [x] [多线程&JUC-08-守护线程](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=142)

- [x] [多线程&JUC-09-礼让线程](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=143)

- [x] [多线程&JUC-10-插入线程](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=144)

- [x] [多线程&JUC-11-线程的生命周期](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=145)

- [x] [多线程&JUC-12-线程的安全问题](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=146)

- [x] [多线程&JUC-13-同步代码块](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=147)

- [x] [多线程&JUC-14-同步代码块的两个小细节](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=148)

- [x] [多线程&JUC-15-同步方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=149)

- [x] [多线程&JUC-16-lock锁](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=150)

- [x] [多线程&JUC-17-死锁](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=151)

- [x] [多线程&JUC-18-等待唤醒机制的思路分析](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=152)

- [x] [多线程&JUC-19-等待唤醒机制（消费者代码实现）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=153)

- [x] [多线程&JUC-20-等待唤醒机制（生产者代码实现）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=154)

- [x] [多线程&JUC-21-阻塞队列实现等待唤醒机制](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=155)

- [x] [多线程&JUC-22-多线程的6种状态](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=156)

- [x] [多线程&JUC-23-综合练习（需求分析）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=157)

- [x] [多线程&JUC-24-综合练习01~04（抢红包）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=158)

- [x] [多线程&JUC-25-综合练习05（抽奖）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=159)

- [x] [多线程&JUC-26-综合练习06（多线程统计并求最大值的解法一）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=160)

- [x] [多线程&JUC-27-综合练习06（解法二：线程栈）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=161)

- [x] [多线程&JUC-28-综合练习07（多线程之间的比较）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=162)

- [x] [多线程&JUC-29-线程池](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=163)

- [x] [多线程&JUC-30-自定义线程池超详细解析](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=164)

- [x] [多线程&JUC-31-最大并行数](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=165)

- [x] [多线程&JUC-32-线程池多大合适](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=166)

- [ ] [多线程&JUC-33-多线程的额外扩展内容](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=167)

- [x] [网络编程-01-初始网络编程](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=168)

- [x] [网络编程-02-网络编程三要素](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=169)

- [x] [网络编程-03-三要素（IP）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=170)

- [x] [网络编程-04-ipv4的一些小细节](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=171)

- [x] [网络编程-05-InetAddress类的使用](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=172)

- [x] [网络编程-06-端口号](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=173)

- [x] [网络编程-07-协议](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=174)

- [x] [网络编程-08-UDP协议（发送数据）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=175)

- [x] [网络编程-09-UDP协议（接收数据）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=176)

- [x] [网络编程-10-UDP练习（聊天室）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=177)

- [x] [网络编程-11-单播，组播，广播](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=178)

- [x] [网络编程-12-TCP协议（发送和接收数据）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=179)

- [x] [网络编程-13-TCP协议（中文乱码问题）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=180)

- [x] [网络编程-14-TCP协议（代码细节）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=181)

- [x] [网络编程-15-三次握手和四次挥手](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=182)

- [x] [网络编程-16-综合练习01（多发多收）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=183)

- [x] [网络编程-17-综合练习02（接收并反馈）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=184)

- [x] [网络编程-18-综合练习03（上传文件）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=185)

- [x] [网络编程-19-综合练习04（文件名重复）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=186)

- [x] [网络编程-20-综合练习05（多线程版的服务端）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=187)

- [x] [网络编程-21-综合练习06（线程池版的服务端）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=188)

- [x] [网络编程-22-综合练习07（BS架构模型）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=189)

- [x] [网络编程课后大作业](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=190)

- [x] [反射-01-反射的概述](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=191)

  ![image-20241022222422458](C:/Users/24188/AppData/Roaming/Typora/typora-user-images/image-20241022222422458.png)

- [x] [反射-02-获取class对象的三种方式](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=192)

```
获取class对象的三种方式
    Class.forName("全类名")
    类名.class
    对象.getClass();
  
```



- [x] [反射-03-反射获取构造方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=193)
- [x] [反射-04-反射获取成员变量](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=194)
- [x] [反射-05-反射获取成员方法](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=195)
- [x] [反射-06-综合练习01（保存任意对象数据）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=196)
- [x] [反射-07-综合练习2（利用反射动态的创建对象和运行方法）](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=197)
- [x] [动态代理-01-动态代理的思想分析](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=198)

无侵入的给代码增加额外的功能

- [x] [动态代理-02-动态代理的代码实现](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=199)
- [x] [莫道桑榆晚，为霞尚满天](https://www.bilibili.com/video/BV1yW4y1Y7Ms?p=200)

