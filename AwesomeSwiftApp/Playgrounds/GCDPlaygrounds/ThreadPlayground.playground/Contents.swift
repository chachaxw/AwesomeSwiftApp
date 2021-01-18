import Foundation
import UIKit

var str = "Hello, thread playground"

/// Swift 多线程GCD学习(https://juejin.im/post/6858126631760986126)
/// 基础
///
/// 调度工作项：其实就是一项任务，可以把你想要执行的代码写成闭包，
/// 在DispatchWorkItem初始化时传进去，方便后续管理任务，并且会让代码更整洁

/// 1. 只带尾随闭包
let item1 = DispatchWorkItem {
    for item in 0...2 {
        print("item1 -> \(item) thread: \(Thread.current)")
    }
}

/// 2. 指定qos(执行优先级) 或flags(特殊行为标记)
let item2 = DispatchWorkItem(qos: .userInteractive, flags: .barrier) {
    print("item2 thread: \(Thread.current)")
}

let item3 = DispatchWorkItem {
    for item in 3...5 {
        print("item3 -> \(item) thread: \(Thread.current)")
    }
}

let item4 = DispatchWorkItem {
    for item in 6...8 {
        print("item4 -> \(item) thread: \(Thread.current)")
    }
}

/// DispatchQueue有三种类型:
///     1. Main queue（主队列）
///     2. Global queue（全局队列）
///     3. Custom queue（自定义队列）

/// 异步执行
/// NOTE: 在串行队列中执行异步任务，结果跟执行同步任务完全一样
///
/// 1. 主队列追加异步任务，按顺序打印

print("=> 开始执行")

let mainQueue = DispatchQueue.main
mainQueue.async(execute: item1)
//mainQueue.async(execute: item2)

print("=> 执行完毕1")

/// 2. 全局队列追加异步任务，随机打印
let globalQueue = DispatchQueue.global()
//globalQueue.async(execute: item1)
//globalQueue.async(execute: item2)
globalQueue.sync(execute: item2) // 同步任务

print("=> 执行完毕2")

/// 3. 自定义串行队列追加异步任务，按顺序打印
let serialQueue = DispatchQueue(label: "serial")
//serialQueue.async(execute: item1)
//serialQueue.async(execute: item2)
serialQueue.sync(execute: item3) // 同步任务

print("=> 执行完毕3")

/// 4. 自定义并行队列追加异步任务，随机打印
let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
//concurrentQueue.async(execute: item1)
//concurrentQueue.async(execute: item2)
concurrentQueue.sync(execute: item4) // 同步任务

print("=> 执行完毕4")

/// 同步执行
/// NOTE: 在并行队列中执行同步任务，跟在串行队列中执行异步或同步任务，结果完全一样
///
/// 1. 主队列追加同步任务，会引起死锁
//mainQueue.sync(execute: item1)
//mainQueue.sync(execute: item2)

/// 2.  全局队列追加同步任务，按顺序打印
//globalQueue.sync(execute: item1)
//globalQueue.sync(execute: item2)

/// 3. 自定义串行队列追加同步任务，按顺序打印
//serialQueue.sync(execute: item1)
//serialQueue.sync(execute: item2)

/// 4. 自定义并行队列追加同步任务，按顺序打印
//concurrentQueue.sync(execute: item1)
//concurrentQueue.sync(execute: item2)

/// 同步异步混合执行
/// NOTE: 在并行队列中执行同步任务，跟在串行队列中执行异步或同步任务，结果完全一样。在主队列中不能混入同步任务，否则会引起死锁。
///
/// 1. 主队列同步异步混合，会引起死锁
//mainQueue.sync(execute: item1) // 同步任务
//mainQueue.async(execute: item2)

/// 2. 全局队列同步异步混合，同步任务按顺序打印，异步任务随机打印
/// 下面代码：同步任务执行完，才会执行后续的异步任务
//globalQueue.sync(execute: item1) // 同步任务
//globalQueue.async(execute: item2)
//globalQueue.async(execute: item3)

/// 3. 自定义串行队列同步异步混合，按顺序打印
//serialQueue.sync(execute: item1)
//serialQueue.async(execute: item2)
//serialQueue.async(execute: item3)

/// 4. 自定义并行队列同步异步混合，同步任务按顺序打印，异步任务随机打印
/// 下面代码：同步任务执行完，才会执行后续的异步任务
//concurrentQueue.sync(execute: item1) // 同步任务
//concurrentQueue.async(execute: item2)
//concurrentQueue.async(execute: item3)

/// 死锁分析
///
/// 1. 主队列死锁
/// 主队列是串行队列，并且仅能运行在主线程上，它无法创建新的线程，意味着所有的代码都必须在只能在一个线程上运行
/// 主队列上存在源源不断的异步任务（比如用来不断刷新UI的任务，用A表示），如果混入同步任务（用B表示），如果B在A之后，
/// 从时间上看B执行完才能执行A；从空间上看，A执行完才能执行B，于是就引起了死锁，导致程序卡死崩溃
///
/// 2. 其他队列死锁
/// 2.1 自定义串行队列嵌套同步任务，会引起死锁

// 下面代码会引起死锁
//serialQueue.sync {
//    print("同步执行 thread \(Thread.current)")
//    serialQueue.sync {
//        print("同步执行 thread \(Thread.current)")
//    }
//}

// 下面代码会引起死锁
//serialQueue.async {
//    print("异步执行 thread \(Thread.current)")
//    serialQueue.sync {
//        print("同步执行 thread \(Thread.current)")
//    }
//}

// 下面代码不会死锁
//serialQueue.sync {
//    print("同步执行 thread \(Thread.current)")
//    serialQueue.async {
//        print("异步执行 thread \(Thread.current)")
//    }
//}

// 下面代码不会死锁
//serialQueue.async {
//    print("异步执行 thread \(Thread.current)")
//    serialQueue.async {
//        print("异步执行 thread \(Thread.current)")
//    }
//}

/// 2.2 并行队列嵌套同步任务，不会引起死锁
//concurrentQueue.async {
//    print("异步执行1 thread \(Thread.current)")
//    concurrentQueue.sync {
//        print("同步执行1 thread \(Thread.current)")
//    }
//}
//
//concurrentQueue.sync {
//    print("同步执行2 thread \(Thread.current)")
//    concurrentQueue.sync {
//        print("同步执行2 thread \(Thread.current)")
//    }
//}
//
//concurrentQueue.sync {
//    print("同步执行3 thread \(Thread.current)")
//    concurrentQueue.async {
//        print("异步执行3 thread \(Thread.current)")
//    }
//}
//
//concurrentQueue.async {
//    print("异步执行4 thread \(Thread.current)")
//    concurrentQueue.async {
//        print("异步执行4 thread \(Thread.current)")
//    }
//}

/// 死锁核心原因
/// 1. 主队列上的所有任务（只有可能是异步任务）和其他队列的同步任务都运行在主线程上（主线程有且只有一个）
/// 2. 线程不在乎任务是同步还是异步，只有队列在乎
/// 3. 线程不会死锁，只有队列才会死锁
///

/// 主队列添加同步任务会造成死锁的根本原因:
/// 1. 主队列只能运行主线程
/// 2. 主队列无法开启后台线程去干别的事情
/// 3. 主队列一旦混入同步任务，就会跟已存在的异步任务相互等待，导致死锁
///

/// 自定义串行队列添加同步任务不会死锁，因为：
/// 自定义串行队列有能力开启主线程或后台线程(只能启动一个后台线程)。自定义串行队列遇到同步任务，会自动安排到主线程执行；
/// 遇到异步任务，自动安排在后台线程执行，所以不会死锁。
///

/// 并行队列添加同步任务不会死锁，因为：
/// 并行队列有能力启动主线程和后台线程（可以启动一个或多个后台线程，部分设备上可以启动多达64个后台线程）。
/// 并行队列遇到同步任务，会自动安排到主线程执行；遇到异步任务，自动安排在后台线程执行，所以不会死锁。
///

/// 自定义串行队列一个异步或同步任务（A）嵌套另一个同步任务（B）会引起死锁，因为：
/// A、B任务等效为：A1 -> B -> A2，B是同步任务，B在A1之后，A2之前，B必须等A2执行完才能执行，
/// A2必须等B执行完才能执行，A2执行完才算A1执行完了，逻辑上已经陷入死循环，两者互相等待，导致死锁。
/// 所以串行队列不能嵌套同步任务，否则会引起死锁。
///
