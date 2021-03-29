[不可不说的Java“锁”事](https://tech.meituan.com/2018/11/15/java-lock.html)：https://tech.meituan.com/2018/11/15/java-lock.html 

##### 深入理解Java并发之synchronized实现原理： https://blog.csdn.net/javazejian/article/details/72828483 

**Java并发编程-无锁CAS与Unsafe类及其并发包Atomic**： https://blog.csdn.net/javazejian/article/details/72772470 

##### 深入剖析基于并发AQS的(独占锁)重入锁(ReetrantLock)及其Condition实现原理： https://blog.csdn.net/javazejian/article/details/75043422 

##### 深入Java线程池：从设计思想到源码解读: https://blog.csdn.net/mu_wind/article/details/113806680

------

线程表示一条单独的执行流，它有自己的程序执行计数器，有自己的栈。在Java中有两个创建方式：

1.继承Thread

2.实现Runnable接口

重写run方法，run方法签名是固定的,public,没有参数，没有返回值，不能抛出受检异常，

启动线程是调用start方法，start表示启动线程，使其成为一条单独的执行流，操作系统会分配线程相关资源，每个线程有自己的程序执行计数器和栈，操作系统会把这个线程作为一个独立的个体进行调度，分配时间片让它执行，执行的起点就是run方法。

```java
public class HelloThread extends Thread {
 @Override
 public void run() {
 System.out.println("hello");
 }
}

public static void main(String[] args) {
 Thread thread = new HelloThread();
 thread.start();
}
```



```java
public class HelloRunnable implements Runnable {
 @Override
 public void run() {
 System.out.println("hello");
 }
}

public static void main(String[] args) {
 Thread helloThread = new Thread(new HelloRunnable());
 helloThread.start();
}
```

Thread类

```java
public static native Thread currentThread();
public long getId()
public final String getName()
```



#### 线程的基本属性和方法

id, name, 优先级，状态，是否为daemon线程，sleep方法，yield方法，join方法等



##### 共享内存可能存在的问题

##### 1竞态条件

多个线程访问和操作一个对象时，最终执行结果和执行时序有关，可能正确也可能不正确。

解决方法：

1.synchronized

2.显示锁

3.原子变量

##### 2.内存可见性

​	 除了内存，数据还会被缓存到CPU的寄存器以及各级缓存中，访问变量，可能直接从寄存器或CPU缓存中获取，写时也可能先写缓存，再同步更新到内存

解决方法：

1.volatile

2.synchronized

3.显示锁同步

##### 线程的优点及成本

充分利用多CPU的计算能力

充分利用硬件资源

保持程序响应性

简化建模及IO处理

成本：消耗一定资源，上下文切换问题，若任务是CPU密集型的，创建超过CPU数量的线程是没必要的



#### 理解synchronized

synchronized可修饰方法、代码块，synchronized实际锁住的是对象（实例对象、类对象）this, xx.class，不同对象的synchronized可以同时访问，相同对象的不同synchronized方法也只能同步顺序访问。

##### 任何对象都有监视器锁，用于锁的等待队列（不保证公平性），用于线程间协作的条件队列。

可重入性，通过记录锁的持有线程和持有数量来实现的。

内存可见性，除了保证原子操作外，保证内存可见性，释放锁时，所有写入都会写回内存，获得锁后，都会从内存读取最新数据

只是保证内存可见性，可以用更轻量的方式，用volatile修饰变量。

死锁，synchronized可能导致死锁，避免在持有一个锁时去申请另一个锁，应该按照相同顺序去申请锁。

可能不安全的操作，注意：

复合操作，比如先检查再更新。EnhanceMap.putIfAbsent

伪同步。同步错对象

迭代。需要在遍历时给整个容器加锁，防止迭代时，集合被更新



#### 线程的基本协作机制

多线程协作场景：

生产者/消费者

同时开始

等待结束

异步结果

集合点

##### wait/notify

wait/notify方法只能在synchronized代码块内被调用，调用wait时线程会释放对象锁，

wait/notify被不同的线程调用，但共享相同的锁和条件等待队列（相同对象的synchronized代码块内），它们围绕一个共享的条件变量进行协作。想清楚协作的共享变量和条件是什么，这是协作的核心。



#### 线程的中断

停止一个线程的主要机制是中断，中断并不是强迫终止一个线程，它是一种协作机制，是给线程传一个取消信号，由线程来决定如何以及何时退出。stop方法已弃用，interrupt方法，interrupted中断标志位，isInterrupted，中断标志位是否为true.



#### 原子变量和CAS

AtomicInteger，AtomicBoolean,AtomicLong, AtomicReference,AtomicLongArray,等

```java
public final int getAndSet(int newValue)

public final int getAndIncrement()

public final int getAndDecrement()

public final int getAndAdd(int delta)

public final int incrementAndGet()

public final int decrementAndGet()

public final int addAndGet(int delta)

public final boolean compareAndSet(int expect, int update)
```

compareAndSet，重要方法，比较并设置，简称CAS

原子变量的声明带有volatile，保证内存可见性。

synchronized是悲观的，假定会冲突，先获取锁，得到锁后才更新，这代表一种阻塞式算法

原子变量是乐观的，假定冲突少，但是CAS更新，进行冲突检测，确实冲突了，则继续尝试，这是非阻塞式的

```java
public final boolean compareAndSet(int expect, int update) {
 return unsafe.compareAndSwapInt(this, valueOffset, expect, update);
}
private static final Unsafe unsafe = Unsafe.getUnsafe();
```

一般应用程序不应该直接使用Unsafe，原理上，计算机系统硬件层次上直接支持CAS指令，Unsafe类最终调用操作系统的API

基于CAS，也可以实现悲观阻塞式算法

ABA问题，AtomicStampedReference



#### 显示锁

java.util.concurrent.locks包下：

接口：Lock, 主要实现类：ReentrantLock

接口：ReadWriteLock, 主要实现类：ReentrantReadWriteLock

```java
public interface Lock {
 void lock();
 void lockInterruptibly() throws InterruptedException;
 boolean tryLock();
 boolean tryLock(long time, TimeUnit unit) throws InterruptedException;
 void unlock();
 Condition newCondition();
}
```

相比synchronized，显示锁支持以阻塞方式获取锁、可以响应中断、可以限时，更加灵活。

##### 可重入锁ReentrantLock

```java
public ReentrantLock()
public ReentrantLock(boolean fair)
```

fair表示是否保证公平，这会影响性能，默认为false

tryLock可以避免死锁，在持有有一个锁获取另一个锁而获取不到时，可以释放已持有锁，给其他线程获取锁的机会，然后重试获取所有锁。

ReentrantLock，原理是依赖CAS方法，依赖java.util.concurrent.locks.LockSupport

```java
public static void park()
public static void parkNanos(long nanos)
public static void parkUntil(long deadline)
public static void unpark(Thread thread)
```

##### AQS

抽象类AbstractQueued-Synchronizer，简称AQS，它简化了并发工具的实现。

```java
private volatile int state;
protected final int getState()
protected final void setState(int newState)
protected final boolean compareAndSetState(int expect, int update)
private transient Thread exclusiveOwnerThread;
protected final void setExclusiveOwnerThread(Thread t)
protected final Thread getExclusiveOwnerThread()
```

AQS内部维护一个等待队列，借助CAS方法实现了无阻塞算法进行更新。

ReentrantLock内部使用AQS，有三个内部类：

```java
abstract static class Sync extends AbstractQueuedSynchronizer
static final class NonfairSync extends Sync
static final class FairSync extends Sync
```

##### 显示条件

```java
public interface Condition {
 void await() throws InterruptedException;
 void awaitUninterruptibly();
 long awaitNanos(long nanosTimeout) throws InterruptedException;
 boolean await(long time, TimeUnit unit) throws InterruptedException;
 boolean awaitUntil(Date deadline) throws InterruptedException;
 void signal();
 void signalAll();
}
```

显示条件与显示锁配合，wait/notify与synchronized配合。

需要深入分析ReentrantLock相关类的源码



### 并发容器

















































