> ##### AOP



> #### Spring 的 AOP 实现原理？

AOP（Aspect-Oriented Programming，面向切面编程），可以说是OOP（Object-Oriented Programing，面向对象编程）的补充和完善。OOP引入封装、继承和多态性等概念来建立一种对象层次结构，用以模拟公共行为的一个集合。当我们需要为分散的对象引入公共行为的时候，OOP则显得无能为力。也就是说，OOP允许你定义从上到下的关系，但并不适合定义从左到右的关系。例如日志功能。日志代码往往水平地散布在所有对象层次中，而与它所散布到的对象的核心功能毫无关系。对于其他类型的代码，如安全性、异常处理和透明的持续性也是如此。这种散布在各处的无关的代码被称为横切（cross-cutting）代码，在OOP设计中，它导致了大量代码的重复，而不利于各个模块的重用。

https://www.jianshu.com/p/007bd6e1ba1b				https://www.jianshu.com/p/4fca2be4ac25
https://juejin.im/post/5db040a2e51d452a0d18cec1

##### 术语：

**切面（Aspect）：**切面是封装在类中的通知和切入点的组合。这种组合定义了应该包含在应用程序中的逻辑及其应该执行的位置

**连接点（Join point）：**连接点是在应用执行过程中能够插入切面的一个点。这个点可以是类的某个方法调用前、调用后、方法抛出异常后等。切面代码可以利用这些点插入到应用的正常流程之中，并添加行为。

**通知（Advice）：**在特定的连接点，AOP框架执行的动作。Spring AOP 提供了5种类型的通知：

​	前置通知（Before）：在目标方法被调用之前调用通知功能。

​	后置通知（After）：在目标方法完成之后调用通知，无论该方法是否发生异常。

​	后置返回通知（After-returning）：在目标方法成功执行之后调用通知。

​	后置异常通知（After-throwing）：在目标方法抛出异常后调用通知。

​	环绕通知（Around）：通知包裹了被通知的方法，在被通知的方法调用之前和调用之后执行自定义的行为。

​	引入通知：特殊类型的拦截器，通过使用引入拦截器，可以指定由引入通知引入的方法的实现。

**切入点（Pointcut）：**切入点是用于定义何时执行通知的连接点集合。通过创建切入点，可以更细致地控制如何将通知应用于应用程序中的组件。如前所述，典 的连接点是方法调用， 或是特定类中所有方法调用的集合。通常情况下，可以在复杂的关系中插入切入点，从而进一步限制执行通知的时间，通俗来说：配置advice作用到哪些地方

**引入（Introduction）：**这是通过引入其他方法或字段来修改对象结构的过程。可以通过引入 AOP 来使任何对象实现特定的接口 ，而无须对象的类显式地实现该接口。

**目标对象（Target Object）：**执行流由 AOP 程修改的对象被称为目标对象 通常也会看到目标对象被称为被通知 advised)对象

**AOP代理（AOP Proxy）：**AOP框架创建的对象，包含通知。 在Spring中，AOP代理可以是JDK动态代理或者CGLIB代理。

**织入（Weaving）：**织入是在适当的位置将切面插入到应用程序代码中的过程。对于编译时 AOP 解决方案，织入过程通常在生成时完成。同样，对于运行时 AOP 解决方案，织入过程在运行时动态执行。此外，也AspectJ还支持另一种称为加载时织入(LTW）的织入机制，在该机制中， 拦截底层的 JVM 类加载器，并在类加载器加载字节码时向其提供织入功能

##### AOP类型：

**静态AOP：**如AspectJ，通过修改应用程序的实际字节码并根据需要更改和扩展应用程序代码来实现静态 AOP 实现中的织入过程，一般来说性能更好，但不够灵活

**动态AOP：**如Spring AOP，织入过程是在运行时动态执行，Spring采用的方法是为所有被通知对象合建代理，一般性能不如静态AOP，但更灵活

##### Spring AOP架构

​	SpringAOP 的核心架构基于代理。当想要创建一个类的被通知实例时，必须使用 ProxyFactory 创建该类的代理实例，首先向 ProxyFactory 提供想要织入到代理的所有切面。使用 ProxyFactory 是创建 AOP 代理的纯程序化方法。大多数情况下，不需要在程序中使用它，可以使用声明式AOP配置机制（(ProxyFactoryBean类、 aop 名称空间和 @AspectJ样式注解）来完成声明式代理的创建。

​	在运行时， Spring 会分析 applicationContext 中的 bean 定义的横切关注点，并动态生成代理 bean（封装了底层目标 bean） 此时，不会直接调用目标bean，而是将调用者注入代理 bean。 然后，代理 bean 分析运行条件（即，连接点、切入点或通知）并相应地织入适当的通知。

##### Spring有两个代理实现 

**JDK 动态代理：**被通知的目标对象实现了接口，使用JDK动态代理创建目标的代理实例。

**CGLIB代理：**被通知目标对象没有实现接口，使用CGLIB创建目标的代理实例。（主要原因是JDK动态代理只支持接口代理）

Spring AOP 只支持一种连接点类型：方法调用，如果需要在除方法调用外的连接点通知一些代码，则可以一起使用 Spring和As ectJ

spring AOP中，切面由实现了Advisor接口的类的实例表示。Advisor有两个子接口：PointcutAdvisor和IntroductionAdvisor。所有的advisor实现都实现了PointcutAdvisor 接口，这些实现使用切入点来控制应用于连接点的通知。在 Spring中，引言被视为特殊类型的通知，通过使用IntroductionAdvisor接口 ，可以控制将引言用于哪些类。

##### ProxyFactory 类

​	ProxyFactory类控制Spring AOP中的织入和代理创建过程，setTarget()方法指定被通知对象或目标对象。在内部，ProxyFactory 将代理创建过程委托给DefaultAopProxyFactory的一个实例， 该实例又转而委托给 Cglib2AopProxy或JdkDynamicAopProxy。

addAdvice()方法将通知应用于类中所有的方法调用，在内部 addAdvice()将传入的通知封装到DefaultPointcutAdvisor(DefaultPointcutAdvisor是PointcutAdvisor的标准实现）的一个实例中，井使用默认包含所有方法的切入点对其进行配置。当想要更多地控制所创建的Advisor或想要向代理添加引入时，可以自己创建Advisor并使用 ProxyFactory的addAdvisor()方法。

##### Spring AOP、JDK代理、CGLIB、AspectJ、动态代理、静态代理的区别：

Java JDK代理、CGLIB、AspectJ代理分析比较: https://blog.csdn.net/a837199685/article/details/68930987
Spring AOP,AspectJ, CGLIB 有点晕:https://www.jianshu.com/p/fe8d1e8bd63e

**静态代理:** 代理类和委托类在代码运行前关系就确定了,也就是说在代理类的代码一开始就已经存在了。

```java
public interface Calculator {
    //需要代理的接口
    public int add(int a,int b);
    //接口实现类,执行真正的a+b操作
    public static class CalculatorImpl implements Calculator{
        @Override
        public int add(int a, int b) {
            System.out.println("doing ");
            return a+b;
        }
    }
    //静态代理类的实现.代码已经实现好了.
    public static class CalculatorProxy implements Calculator{
        private Calculator calculator;
        public CalculatorProxy(Calculator calculator) {
            this.calculator=calculator;
        }
        @Override
        public int add(int a, int b) {
            //执行一些操作
            System.out.println("begin ");
            int result = calculator.add(a, b);
            System.out.println("end ");
            return result;
        }
    }
}
```

**动态代理:** 动态代理类的字节码在程序运行时的时候生成。

##### Aspectj:  https://www.eclipse.org/aspectj/downloads.php

AspectJ是一套独立的面向切面编程的解决方案，Spring AOP引入的AspectJ的语法和注解，但是并没有真正使用AspectJ。启用 Spring 对 @AspectJ 方面配置的支持： < aop:aspectj-autoproxy />

1.Aspectj并不是动态的在运行时生成代理类，而是在编译的时候就植入代码到class文件
2.由于是静态织入的，所以性能相对来说比较好
3.Aspectj不受类的特殊限制,不管方法是private、或者static、或者final的,都可以代理
4.Aspectj不会代理除了限定方法之外任何其他诸如toString(),clone()等方法

##### CGLIB:  https://github.com/cglib/cglib

cglib - Byte Code Generation Library is high level API to generate and transform Java byte code. It is used by AOP, testing, data access frameworks to generate dynamic proxy objects and intercept field access.
它是一个代码生成类库，CGLIB包的底层是通过使用一个小而快的字节码处理框架ASM(Java字节码操控框架)，来转换字节码并生成新的类。

1.CGlib可以传入接口也可以传入普通的类，接口使用实现的方式,普通类使用会使用继承的方式生成代理类.
2.由于是继承方式,如果是 static方法,private方法,final方法等描述的方法是不能被代理的
3.做了方法访问优化，使用建立方法索引的方式避免了传统Method的方法反射调用.
4.提供callback 和filter设计，可以灵活地给不同的方法绑定不同的callback。编码更方便灵活。
5.CGLIB会默认代理Object中finalize,equals,toString,hashCode,clone等方法。比JDK代理多了finalize和clone。

```java
Enhancer enhancer=new Enhancer();
enhancer.setSuperclass(Calculator.class);
enhancer.setCallback(new MethodInterceptor() {
            //类似invokerhanddler的invoke方法
            @Override
            public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
                System.out.println("begin");
                Object invoke = methodProxy.invoke(new Calculator.CalculatorImpl(), objects);
                System.out.println("end");
                return invoke;
            }
});
Calculator proxy =(Calculator) enhancer.create();
proxy.add(1,2);
```



##### JDK代理：

JDK原生自带的代理实现，只能代理接口方法，**implements** java.lang.reflect.InvocationHandler，实现**invoke**方法

1.JDK动态代理只能代理有接口的类,并且是能代理接口方法,不能代理一般的类中的方法
2.提供了一个使用InvocationHandler作为参数的构造方法。在代理类中做一层包装,业务逻辑在invoke方法中实现
3.重写了Object类的equals、hashCode、toString，它们都只是简单的调用了InvocationHandler的invoke方法，即可以对其进行特殊的操作，也就是说JDK的动态代理还可以代理上述三个方法
4.在invoke方法中我们甚至可以不用Method.invoke方法调用实现类就返回。这种方式常常用在RPC框架中,在invoke方法中发起通信调用远端的接口等

```java
public class ProxyFactory implements InvocationHandler {
    private Class<?> target;
    private Object real;
    //委托类class
    public ProxyFactory(Class<?> target){
        this.target=target;
    }
	//实际执行类bind
    public  Object bind(Object real){
        this.real=real;
        //利用JDK提供的Proxy实现动态代理
        return  Proxy.newProxyInstance(target.getClassLoader(),new Class[]{target},this);
    }
    @Override
    public Object invoke(Object o, Method method, Object[] args) throws Throwable {
		//代理环绕
        System.out.println("begin");
        //执行实际的方法
        Object invoke = method.invoke(real, args);
        System.out.println("end");
        return invoke;
    }
 
    public static void main(String[] args) {
        Calculator proxy =(Calculator) new ProxyFactory(Calculator.class).bind(new Calculator.CalculatorImpl());
        proxy.add(1,2);
    }
}
```



##### Spring AOP:

​	Spring代理实际上是对JDK代理和CGLIB代理做了一层封装，并且引入了AOP概念:Aspect、advice、joinpoint等等，同时引入了AspectJ中的一些注解@pointCut,@after,@before等等.Spring Aop严格的来说都是动态代理，所以实际上Spring代理和Aspectj的关系并不大.
​	Spring AOP封装了JDK和CGLIB的动态代理实现，同时引入了AspectJ的编程方式和注解（语法层面）。使得可以使用标准的AOP编程规范来编写代码外，还提供了多种代理方式选择。

Spring 对 @AspectJ 方面配置的支持： <aop:aspectj-autoproxy proxy-target-class="true"/>
proxy-target-class="false"（默认为false），表示使用jdk动态代理织入增强，
poxy-target-class="true"，表示使用CGLib动态代理技术织入增强。
不过即使proxy-target-class设置为false，如果目标类没有声明接口，则spring将自动使用CGLib动态代理。

##### 引入（Introduction）

```java
@Aspect 
public class MyAspect { 
@DeclareParents(value="com.springboot.chapter4.aspect.service.impl.UserServiceImpl+", defaultimpl=UserValidator mpl.class)
public UserValidator userValidator; 
    ...
}
```

@DeclareParents的作用是引入新的类来增强服务，它有两个必须配置的属性value和defaultlmpl

• value：指向你要增强功能的目标对象。

• defaultlmpl：引入增强功能的类。

