### Eclipse快捷键

ALT+/ 补全

输出快捷键是：先敲sysout，然后组合快捷键：alt+/

注意：// 1:无需package

// 2: 类名必须Main, 不可修改



### 输入输出

```java
static BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
static PrintWriter pw = new PrintWriter(new OutputStreamWriter(System.out));
static StreamTokenizer st  = new StreamTokenizer(bf);

static final int I() throws IOException {
    st.nextToken();
    return (int)st.nval;
}
int n = I(), m = I();

System.out.println(n);
pw.println(n);
pw.flush();
		
System.out.printf("%.2f", sum/n); // 
```

### fill函数

`Arrays.fill()`方法有几个重载版本，以支持不同类型的数组和不同的填充需求：

- `void fill(int[] a, int val)`：将指定的int值分配给指定数组`a`的每个元素。
- `void fill(int[] a, int fromIndex, int toIndex, int val)`：将指定的int值分配给指定数组`a`的指定范围内的每个元素。
- 类似地，还有针对`long`、`short`、`byte`、`double`、`float`、`char`和`boolean`类型数组的重载版本。

### 堆栈

`Stack`类是基于`Vector`实现的，以下是其一些常用方法：

- **push(E item)**: 将一个元素压入栈顶。此方法会将元素添加到栈的顶部。
- **pop()**: 移除栈顶元素，并作为此方法的值返回该对象。如果栈为空，则抛出`EmptyStackException`。
- **peek()**: 查看栈顶对象而不移除它。如果栈为空，则抛出`EmptyStackException`。
- **empty()**: 测试堆栈是否为空。
- **search(Object o)**: 返回对象在堆栈中的位置，以1为基数。如果对象在堆栈中，则返回其从栈顶开始的位置；否则，返回-1。

`Queue`接口在Java的集合框架中定义，`LinkedList`和`ArrayDeque`是实现了`Queue`接口的两个常用类。以下是`Queue`接口的一些常用方法：

- **offer(E e)**: 尝试将元素`e`添加到队列中。如果成功，返回`true`；如果没有足够的空间，则返回`false`。
- **poll()**: 移除并返回队列头部的元素。如果队列为空，则返回`null`。
- **peek()**: 查看但不移除队列头部的元素。如果队列为空，则返回`null`。
- **add(E e)**: 将指定元素添加到此队列的尾部。如果成功，返回`true`；如果当前没有可用空间，则抛出`IllegalStateException`。
- **remove()**: 移除并返回队列头部的元素。如果队列为空，则抛出`NoSuchElementException`。
- **element()**: 查看但不移除队列头部的元素。如果队列为空，则抛出`NoSuchElementException`。

### set和map

Set（集合）- 不允许重复元素

`Set`接口主要实现类有`HashSet`、`LinkedHashSet`、和`TreeSet`。这里是`Set`接口的一些常用方法：

- **add(E e)**: 将指定元素添加到集合中。如果集合已包含该元素，则不改变集合并返回`false`。
- **remove(Object o)**: 从集合中移除指定元素（如果存在）。成功移除返回`true`，否则返回`false`。
- **contains(Object o)**: 如果集合包含指定元素，则返回`true`。
- **isEmpty()**: 如果集合不包含元素，则返回`true`。
- **size()**: 返回集合中的元素数量。
- **clear()**: 移除集合中的所有元素。
- **iterator()**: 返回在此集合中的元素上进行迭代的迭代器。

```
		TreeSet<Integer> st = new TreeSet<>((o1, o2) -> {
			return Integer.compare(o2, o1);
		});
		st.add(1);
		st.add(2);
		
		System.out.println(st.contains(-2));
		
		for(Integer x: st) {
			System.out.println(x);
		}
```



Map（映射）- 存储键值对

`Map`接口的主要实现类有`HashMap`、`LinkedHashMap`、`TreeMap`和`Hashtable`。这里是`Map`接口的一些常用方法：

- **put(K key, V value)**: 将指定的值与此映射中的指定键关联。如果映射之前包含键的映射，则旧值被替换。
- **get(Object key)**: 返回指定键所映射的值；如果此映射不包含键的映射关系，则返回`null`。
- **remove(Object key)**: 从映射中移除指定键的映射关系（如果存在）。
- **containsKey(Object key)**: 如果此映射包含指定键的映射关系，则返回`true`。
- **containsValue(Object value)**: 如果此映射将一个或多个键映射到指定值，则返回`true`。
- **keySet()**: 返回此映射中包含的键的`Set`视图。
- **values()**: 返回此映射中包含的值的`Collection`视图。
- **entrySet()**: 返回此映射中包含的映射关系的`Set`视图。

注意事项

- `HashSet`是基于`HashMap`实现的，`LinkedHashSet`是基于`LinkedHashMap`实现的，而`TreeSet`是基于`TreeMap`实现的。这些实现类在性能和特定用途方面各有优劣。
- `HashMap`和`Hashtable`都提供键到值的映射，但`HashMap`是非同步的，允许`null`键和`null`值，而`Hashtable`是线程安全的，不允许`null`键或值。
- `LinkedHashMap`保留了插入顺序，而`TreeMap`根据其键的自然顺序或构造时提供的`Comparator`进行排序。

在使用`Set`和`Map`时，选择合适的实现类对于性能和功能要求至关重要。

### 排序

```
		Integer[] a = new Integer[12];
		for(int i = 1;i <= 10; ++i) a[i] = 100-i;
		   // 明确指定 Comparator 的参数类型为 Integer
        Arrays.sort(a, 1, 10, (x, y) -> {
            return y.compareTo(x); // 逆序排序
        });
        for(int i = 1; i <= 10; ++i) System.out.println(a[i]);
        
        		// ArrayList排序需要Collections
		ArrayList<Integer> arr = new ArrayList<>();
		arr.add(1);
		arr.add(2);
		arr.add(3);
		Collections.sort(arr, (x, y) -> {
            return Integer.compare(y, x); // 逆序排序
		});
		for(int x:arr) System.out.println(x);
       
    static class gas implements Comparable<gas> {
        long c;
        int id;
        public gas(int i, long a) {
            c=a;
            id=i;
        }

        @Override
        public int compareTo(gas o) {
            return Long.compare(this.c, o.c);
        }
    }
```

### 优先队列

```
		PriorityQueue<Integer>[] que = new PriorityQueue[10];
		for(int i = 0; i < 10; ++i) que[i] = new PriorityQueue<Integer>();
		
				for(int i = 0; i < 10; ++i) que[i] = new PriorityQueue<Integer>((a, b)->{
			return Integer.compare(b,  a); // 大根堆，(a, b)小根堆
		});
```



### 大数

```java
import java.math.BigInteger;

public class BigIntegerExample {
    public static void main(String[] args) {
        BigInteger bigInt1 = new BigInteger("123456789012345678901234567890");
        BigInteger bigInt2 = new BigInteger("98765432109876543210987654321");

        // 加法
        BigInteger sum = bigInt1.add(bigInt2);

        // 减法
        BigInteger difference = bigInt1.subtract(bigInt2);

        // 乘法
        BigInteger product = bigInt1.multiply(bigInt2);

        // 输出结果
        System.out.println("Sum: " + sum);
        System.out.println("Difference: " + difference);
        System.out.println("Product: " + product);
    }
}

```

### StringJoiner和StringBuilder

```
       StringJoiner sj = new StringJoiner(", "); // 分隔符为逗号加空格
        sj.add("Apple");
        sj.add("Banana");
        sj.add("Orange");

        String result = sj.toString(); // 结果为 "Apple, Banana, Orange"
        
        
               StringJoiner sj = new StringJoiner(", ", "[", "]"); // 分隔符，前缀，后缀
        sj.add("Apple");
        sj.add("Banana");
        sj.add("Orange");

        String result = sj.toString(); // 结果为 "[Apple, Banana, Orange]"
        
        
               List<String> list = Arrays.asList("Apple", "Banana", "Orange");

        String result = list.stream()
                            .collect(Collectors.joining(", ", "[", "]"));
        // 使用 Collectors.joining() 直接在流操作中生成字符串

        System.out.println(result); // 输出：[Apple, Banana, Orange]
        
        
        
        
        
        StringBuilder sb = new StringBuilder();
        sb.append("Hello");
        sb.append(" ");
        sb.append("World!");

        // 反转字符串
        sb.reverse();

        // 删除指定范围的字符
        sb.delete(0, 5);

        // 插入字符串
        sb.insert(0, "Start: ");

        // 将StringBuilder对象转换成String
        String result = sb.toString();
```



### java全排列

```java
    public static void main(String[] args) throws Exception {
        for(int i = 1; i <= 10; ++i) {
            int[] nums = new int[i];
            for(int j = 0; j < i; ++j) nums[j] = j+1;
            List<List<Integer>> lists = permute(nums);

            int count = 0;
            for(List<Integer> list : lists) {
                int n = list.size();
//                System.out.println(list);
                for(int j = 1; j < n; ++j)
                    for(int k = 0; k < j; ++k)
                        if(list.get(k) < list.get(j)) count++;
            }

            System.out.println("第i个"+i+"结果: "+count);
            System.out.println("list大小"+lists.size());

        }
    }

    // 全排列
    public static List<List<Integer>> permute(int [] nums) {
        int len = nums.length;
        List<List<Integer>> lists = new ArrayList<>();
        if(len == 0) return lists;

        Stack<Integer> path = new Stack<>();
        boolean[] used = new boolean[len];
        dfs(nums, len, 0, path, used, lists);
        return lists;
    }

    public static void dfs(int[] nums, int len, int depth, Stack<Integer> path, boolean[] isUsed, List<List<Integer>> lists) {
        if(depth == len) {
            lists.add(new ArrayList<>(path));
            return ;
        }

        for(int i = 0; i < len; ++i) {
            if(isUsed[i]) continue;
            path.add(nums[i]);
            isUsed[i] = true;
            dfs(nums, len, depth+1, path, isUsed, lists);
            isUsed[i] = false;
            path.pop();
        }

    }

```

### 时间LocalDate

```java
        LocalDate localDate = LocalDate.now();
        // 定义日期格式
//        String formattedDate = localDate.format(DateTimeFormatter.ofPattern("MMM dd, yyy"));;
//        System.out.println(formattedDate);
        // 三月 25, 2024

        // 初始化日期
        localDate = LocalDate.of(2018, 11, 30);

        // 从给定的文本字符串中给出示例，
        localDate = LocalDate.parse("2018-10-01");

        // 解析成指定日期
        localDate = LocalDate.parse("2018-10-01", DateTimeFormatter.ofPattern("dd-MM-yyyy"));

        // 从指定时间对象中获取
        localDate = LocalDate.from(LocalDate.now());

        // 增加指定日期天数
        localDate = localDate.plusDays(1);

        // 减去指定日期天数
        localDate = localDate.minusDays(1);
			
        // 
 		  day1.isAfter(day2)

        // get-获取日期信息
        // 年 localDate.getYear();
        // 月 localDate.getMonthValue();
        // 日 localDate.getDayOfMonth()
              
              
    public static void main(String[] args) throws Exception {
        LocalDate localDate1 = LocalDate.of(1900, 1, 1);
        LocalDate localDate2 = LocalDate.of(9999, 12, 31);

        int count = 0;
        while(!localDate1.isAfter(localDate2)) {
//            System.out.println(String.format("localDate1 %d %d %d", localDate1.getYear(),localDate1.getMonthValue(), localDate1.getDayOfMonth()));
            int year = localDate1.getYear();
            int month = localDate1.getMonthValue();
            int day = localDate1.getDayOfMonth();
            if(getSum(year) == getSum(month)+getSum(day)) count++;

            localDate1 = localDate1.plusDays(1);
        }
        System.out.println(count);

    }
```



### 真题：太阳

```java


import java.io.PrintWriter;
import java.time.LocalDate;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Array;
import java.sql.SQLOutput;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.stream.Collectors;

import static java.util.Arrays.sort;


public class Main {
    public static TreeMap<Double, Double> mp = new TreeMap<>();
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        PrintWriter pw = new PrintWriter(System.out);
        String[] s = br.readLine().split(" ");
        int n = Integer.parseInt(s[0]);
        int x = Integer.parseInt(s[1]);
        int y = Integer.parseInt(s[2]);
        List<Line> lines = new ArrayList<>();
        for(int i = 0; i < n; ++i) {
            s = br.readLine().split(" ");
            lines.add(new Line(Integer.parseInt(s[0]), Integer.parseInt(s[1]), Integer.parseInt(s[2])));
        }
        lines.sort((a, b) -> Integer.compare(b.y, a.y));
        int res = 0;
        for(Line line : lines) {
            double l = get(line.lx, line.y, x, y);
            double r = get(line.rx, line.y, x, y);
            if(!query(l, r)) res++;
            addRange(l, r);
        }
        pw.println(res);
        pw.flush();
    }

    public static void addRange(double l, double r) {
        var L = mp.floorEntry(l);
        var R = mp.floorEntry(r);
        if(L != null && L.getValue() >= l) l = L.getKey();
        if(R != null && R.getValue() >= r) r = R.getValue();
        mp.subMap(l, r).clear();
        mp.put(l, r);
    }
    // 5 10
    // 6 10
    // 0 10

    public static boolean query(double l, double r) {
        var L = mp.floorEntry(l);
        return L != null && L.getValue() >= r;
    }

    // 两点确定的直线和X轴的交点
    public static double get(double x1, double y1, double x2, double y2) {
        return x1 - y1*(x1-x2)/(y1-y2);
    }

    public static class Line {
        int lx, rx, y, length;
        public Line(int x, int y, int length) {
            this.length = length;
            this.y = y;
            lx = x;
            rx = x+length;
        }
    }

    public static long gcd(long a, long b) {
        return b > 0 ? gcd(b, a % b) : a;
    }
    public static long lcm(long a, long b) {
        return a / gcd(a, b) * b;
    }


    // 全排列
    public static List<List<Integer>> permute(int [] nums) {
        int len = nums.length;
        List<List<Integer>> lists = new ArrayList<>();
        if(len == 0) return lists;

        Stack<Integer> path = new Stack<>();
        boolean[] used = new boolean[len];
        dfs(nums, len, 0, path, used, lists);
        return lists;
    }

    public static void dfs(int[] nums, int len, int depth, Stack<Integer> path, boolean[] isUsed, List<List<Integer>> lists) {
        if(depth == len) {
            lists.add(new ArrayList<>(path));
            return ;
        }

        for(int i = 0; i < len; ++i) {
            if(isUsed[i]) continue;
            path.add(nums[i]);
            isUsed[i] = true;
            dfs(nums, len, depth+1, path, isUsed, lists);
            isUsed[i] = false;
            path.pop();
        }

    }


```



### 小蓝的计划(线段树+优先队列)

```


import java.io.*;
import java.security.KeyPair;
import java.time.LocalDate;
import java.sql.Array;
import java.sql.SQLOutput;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.stream.Collectors;

import static java.util.Arrays.sort;


public class Main {
    static int maxn = 200005;
    static BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
    static PrintWriter pw = new PrintWriter(new OutputStreamWriter(System.out));
    static StreamTokenizer st  = new StreamTokenizer(bf);
    static int [] dis = new int[maxn];
    static int [] cost = new int[maxn];
    static int [] lim = new int[maxn];

    static int [] rest = new int[maxn<<2];
    static int [] k = new int[maxn<<2]; // lazy

    static void build(int l, int r, int rt) {
        if(l == r) {
            rest[rt] = 0; // 到达时油量
            return ;
        }
        int mid = (l+r)>>1;
        build(l, mid, rt<<1);
        build(mid+1, r, rt<<1|1);
    }

    static void up(int rt) {
        rest[rt] = Math.max(rest[rt<<1], rest[rt<<1|1]);
    }

    static void pb(int rt) {
        if(k[rt] != 0)  {
            k[rt << 1] += k[rt];
            k[rt << 1|1] += k[rt];
            rest[rt<<1] += k[rt];
            rest[rt<<1|1] += k[rt];
            k[rt] = 0;
        }
    }

    static void add(int l, int r, int L, int R, int rt, int x) {
        if(L <= l&& r <= R) {
            rest[rt] += x;
            k[rt] += x;
            return ;
        }
        pb(rt);
        int mid = (l+r)>>1;
        if(mid >= L) add(l, mid, L, R, rt<<1, x);
        if(mid < R) add(mid+1, r, L, R, rt<<1|1, x);
        up(rt);
    }

    static long query(int l, int r, int L, int R, int rt) {
        if(L <= l&& r <= R) return rest[rt];
        pb(rt);

        long ans = 0;
        int mid = (l+r)>>1;
        if(mid >= L) ans = Math.max(ans, query(l, mid, L, R, rt<<1));
        if(mid < R) ans = Math.max(ans, query(mid+1, r, L, R, rt<<1|1));
        up(rt);
        return ans;
    }

    static final int I() throws IOException {
        st.nextToken();
        return (int)st.nval;
    }

    static class gas implements Comparable<gas> {
        long c;
        int id;
        public gas(int i, long a) {
            c=a;
            id=i;
        }

        @Override
        public int compareTo(gas o) {
            return Long.compare(this.c, o.c);
        }
    }

    public static void main(String[] args) throws Exception {
        int n = I(), m = I();
        PriorityQueue<gas> que = new PriorityQueue<>();
        for(int i = 1; i <= n; ++i) {
            dis[i] = I(); cost[i] = I(); lim[i] = I();
        }
        build(1, n, 1);
        int vol = m;
        long ans = 0;

        for(int i = 1; i <= n; ++i) {
            vol -= dis[i];

            while(vol < 0) {
                if(que.isEmpty()) {
                    pw.println(-1); return;
                }
                gas a = que.poll();
                int cnt = Math.min(m-query(1, n, a.id, i-1, 1), lim[a.id]);
                if(cnt <= 0) continue;
                if(cnt <= -vol) {
                    ans += a.c * cnt;
                    vol += cnt;
                    lim[a.id] = 0;
                    add(1, n, a.id, i-1, 1, cnt);
                } else {
                    ans += a.c * (-vol);
                    lim[a.id] += vol;
                    add(1, n, a.id, i-1, 1, -vol);
                    que.add(new gas(a.id, a.c));
                    vol = 0;
                }
            }
            if(vol > 0) add(1, n, i, i, 1, vol);
            lim[i] = Math.min(lim[i], m-vol);
            que.add(new gas(i, cost[i]));

        }
        pw.println(ans);
        pw.flush();

    }






}
```

