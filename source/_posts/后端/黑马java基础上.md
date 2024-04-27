- [x] [集合进阶-01-单列集合顶层接口Collection](https://www.bilibili.com/video/BV17F411T7Ao?p=185)

单列集合collection

​	list添加元素是有序、可重复、有索引的

​    set添加元素是无序、不重复、无索引的

方法：

``` 
add() 添加元素
clear() 清空集合元素
remove 删除给定的对象
contains 判断是否包含
isEmpty
size
```



双列集合map

![image-20240225161822187](C:/Users/24188/AppData/Roaming/Typora/typora-user-images/image-20240225161822187.png)

- [x] [集合进阶-02-迭代器](https://www.bilibili.com/video/BV17F411T7Ao?p=186)

```
Iterator<E> iterator()  返回迭代器对象，默认返回集合的0索引
常用方法
hasNext()
next()   先获取元素，再移动指针，可以理解为a++
Iterator<String> it = list.iterator();
迭代器遍历时，不能进行添加或删除, 但是可以it.remove()，但是不能添加
```



- [x] [集合进阶-03-增强for介lambda表达式](https://www.bilibili.com/video/BV17F411T7Ao?p=187)

增强for的底层就是迭代器，为了简化迭代器的代码，是jdk5之后出现的

所有的单列集合和数组才能使用增强for

修改增强for种的变量，不会改变集合种原本的元素

```
for(String s:list)
for(数据类型 变量名: 集合/数组)

```

Lambda表达式遍历

```
default void forEach(Consumer<? super T> action):  结合lambda遍历集合
1. 利用匿名内部类的形式
// 底层原理
// 其实也会自己遍历集合，依次得到每一个元素，传递给下面的accept方法
coll.forEach(new Consumer<String> {
	@Override
	// s依次表示集合中的每一个数据
	public void accept(String s) {
		System.out.println(s);
	}
})
2. lambda表达式
coll.forEach(s -> System.out.println(s);)
```



- [x] [集合进阶-04-List中常见的方法和五种遍历方式](https://www.bilibili.com/video/BV17F411T7Ao?p=188)

List因为有索引，所以有一些索引操作的方法

```
void add(int index, E e) 在集合指定位置插入指定的元素
E remove(int index) 删除指定索引的元素，返回被删除的元素
E set(int index, E e) 修改指定索引处的元素，返回被修改的元素
E get(index) 返回指定索引的元素

删除元素
list.remove(1) 删除索引为1的元素
// 手动装箱，手动把基本数据类型的1，变成Integer类型
Integer i = Integer.valueOf(1);
list.remove(i);
```

List列表迭代器遍历

```
list.listIterator()
hasNext()
next()
hasPrevious()
previous()
```

- [x] [集合进阶-05-数据结构（栈、队列、数组、链表）](https://www.bilibili.com/video/BV17F411T7Ao?p=189)

- [x] [集合进阶-06-ArrayList源码分析](https://www.bilibili.com/video/BV17F411T7Ao?p=190)

```
ArrayList集合底层原理
1. 利用空参构建的集合，在底层创建一个默认长度为0的数组
2. 添加第一个元素时，底层会创建一个新的长度为10的数组
3. 存满时，会扩容1.5倍
4. 如果使用addALL一次添加多个元素，1.5倍放不下，则新创建的数组长度以实际为准

```

- [x] [集合进阶07-LinkedList和迭代器的源码分析](https://www.bilibili.com/video/BV17F411T7Ao?p=191)

```
public void addFirst(E e) 在列表开头插入指定元素
public void addLast(E e) 将指定的元素追加到此列表的末尾
public E getFirst()
public E getLast()
public E removeFirst()
public E removeLast()
```

- [x] [集合进阶-08-泛型类、泛型方法、泛型接口，更新到最后](https://www.bilibili.com/video/BV17F411T7Ao?p=192)

```
泛型：是jdk5种引入的特性，可以在编译阶段约束操作的数据类型，并进行检查
泛型的格式：<数据类型>
注意：泛型只能支持引用数据类型

优点：
1. 统一数据类型
2. 把运行时期的问题提前到了编译期间，避免了强制类型转换可能出现的异，因为在编译阶段类型就能确定下来

java种的泛型是伪泛型，泛型的擦除
泛型不具备继承性，但是数据具备继承性

// 没有泛型的时候，集合如何存储数据
ArrayList list = new ArrayList();

list.add(123);
list.add("aaa");
// 多态的弊端是不能访问子类的特有功能
```



- [x] [集合进阶-09-泛型的通配符和综合练习](https://www.bilibili.com/video/BV17F411T7Ao?p=193)

```
本方法虽然不确定类型，但是希望只能传递Ye，Fu, Zi三种类型
此时我们就可以使用泛型的通配符：
	？也表示不确定的类型
	他可以进行类型的限定
	? extend: E: 表示可以传递E或者E所有的子类类型
	? super E: 表示可以E或者E所有的父类类型
```



- [x] [集合进阶-10-数据结构（二叉树，二叉查找树，平衡二叉树）](https://www.bilibili.com/video/BV17F411T7Ao?p=194)



- [x] [集合进阶-11数据结构（平衡二叉树旋转机制）](https://www.bilibili.com/video/BV17F411T7Ao?p=195)
- [x] [集合进阶-12-数据结构（红黑树、红黑规则、添加节点处理方案详解）](https://www.bilibili.com/video/BV17F411T7Ao?p=196)
- [x] [集合进阶-13-HashSet、LinkedHashSet详解](https://www.bilibili.com/video/BV17F411T7Ao?p=197)

set系列集合

* 无序：存储顺序不一致
* 不重复：可以去重
* 无索引：没有带索引的方法，所有不能使用普通for循环遍历，也不能通过索引获取元素

set集合的实现类

* HashSet: 无序、不重复、无索引
* LinkedHashSet: 有序、不重复、无索引
* TreeSet: 可排序、不重复、无索引

哈希表组成

* JDK8之前：数组+链表
* JDK8开始：数组+链表+红黑树

* 如何没有重写hashCode方法，不同对象计算出的哈希值是不同的
* 如果已经重写hashCode方法，不同的对象只要属性值相同，计算出的哈希值就是一样的
* 在小部分情况下，不同的属性值或者不同的地址值计算出来的哈希值也可能一样（哈希碰撞）

jdk8以后，当链表超过8，而且数组长度大于等于64时，自动转为红黑树

如果集合中存储的是自定义对象，必须要重写hashCode和equals方法

- [x] [集合进阶-14-TreeSet第一种排序方式超详细讲解](https://www.bilibili.com/video/BV17F411T7Ao?p=198)

TreeSet可排序：

对于字符、字符串类型：按照字符在ASCALL表中的数字排序



- [x] [集合进阶-15-Tree第二种排序方式和综合练习](https://www.bilibili.com/video/BV17F411T7Ao?p=199)

1. 默认排序/自然排序：Javabean类实现Comparable接口指定比较规则

```
    @Override
    public int compareTo(Student o) {
        // this表示当前对象，o表示已经在红黑树中的对象
        return this.age - o.getAge();
    }
```



1. 比较器排序：创建TreeSet对象时，传递比较器Comparator指定规则

```
        // 1. 创建集合
        // o1: 表示当前要添加的元素
        // o2: 表示已经存在红黑树中的元素
        TreeSet<String> ts = new TreeSet<>(new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                // 按照长度排序
                int num = o2.length() - o1.length();
                // 如果一样长则按照首字母排序
                num = num == 0 ? o1.compareTo(o2) : num;
                return num;
            }
        });
        
        
        TreeSet<String> ts = new TreeSet<>((String o1, String o2) ->{
                // 按照长度排序
                int num = o2.length() - o1.length();
                // 如果一样长则按照首字母排序
                num = num == 0 ? o1.compareTo(o2) : num;
                return num;
            });
```



- [ ] [从入门到起飞（下）课程介绍](https://www.bilibili.com/video/BV17F411T7Ao?p=200)