##### 基于 OpenJDK 14

特性：基于动态数组

优点：查找和更改，可根据下标直接进行操作，只有O(1)的复杂度，单个数据不额外占用空间

缺点：删除操作会移动数组，新增需要扩容，

适用场景：查找和更改居多，删除和新增较少的场景



重要内容：

```java
public class ArrayList<E> extends AbstractList<E>
        implements List<E>, RandomAccess, Cloneable, java.io.Serializable
{
    /**
     * Default initial capacity.
     */
    private static final int DEFAULT_CAPACITY = 10;
    transient Object[] elementData; // non-private to simplify nested class access
    /**
     * The size of the ArrayList (the number of elements it contains).
     *
     * @serial
     */
    private int size;
}
```

内部保存数据是使用的 Object[] 数组，默认大小为10

​	ArrayList的增删改查操作实质上就是对底层数组的操作，新增的时候，都需要对数组进行扩容+copy操作，删除也需要对数组进行copy，所以ArrayList的增加和删除效率会非常低，但是相对的，得利于底层的数组结果，在进行查找和更改操作的时候，可以根据下标直接进行操作，只有O(1)的复杂度，因此在查找需求比较频繁的操作中，可以使用ArrayList，极大的增加操作效率，但是在增删比较频繁的时候，就需要考虑其他的数据结构了； 

​	同时，合理的使用ArrayList的构造方法，例如在初始化的时候，如果已经知道当前数据的大小，可以直接使用ArrayList(int initialCapacity)  构造方法指定初始容量，这样可以避免在添加数据的时候频繁扩容降低性能，同时也可以避免1.5倍扩容机制造成的空间浪费

链接：https://juejin.im/post/5d2c4d32e51d4556be5b3afc

##### 添加元素：

```java
private Object[] grow(int minCapacity) {
    int oldCapacity = elementData.length;
    if (oldCapacity > 0 || elementData != DEFAULTCAPACITY_EMPTY_ELEMENTDATA) {
        int newCapacity = ArraysSupport.newLength(oldCapacity,
                                                  minCapacity - oldCapacity, /* minimum growth */
                                                  oldCapacity >> 1           /* preferred growth */);
        return elementData = Arrays.copyOf(elementData, newCapacity);
    } else {
        return elementData = new Object[Math.max(DEFAULT_CAPACITY, minCapacity)];
    }
}

private Object[] grow() {
    return grow(size + 1);
}

private void add(E e, Object[] elementData, int s) {
    if (s == elementData.length)
        elementData = grow();
    elementData[s] = e;
    size = s + 1;
}

public boolean add(E e) {
    modCount++;
    add(e, elementData, size);
    return true;
}
```