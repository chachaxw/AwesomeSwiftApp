import UIKit
import Foundation

/// Swift 多线程学习(https://juejin.im/post/6858126631760986126)

var str = "Hello, thread playground"

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
    for item in 0...2 {
        print("item3 -> \(item) thread: \(Thread.current)")
    }
}

/// DispatchQueue有三种类型:
///     1. Main queue
///     2. Global queue
///     3. Custom queue

/// 异步执行
/// NOTE: 在串行队列中执行异步任务，结果跟执行同步任务完全一样
///
/// 1. 主队列追加异步任务，按顺序打印
let mainQueue = DispatchQueue.main
mainQueue.async(execute: item1)
mainQueue.async(execute: item2)

/// 2. 全局队列追加异步任务，随机打印
let globalQueue = DispatchQueue.global()
//globalQueue.async(execute: item1)
//globalQueue.async(execute: item2)

/// 3. 自定义串行队列追加异步任务，按顺序打印
let serialQueue = DispatchQueue(label: "serial")
//serialQueue.async(execute: item1)
//serialQueue.async(execute: item2)

/// 4. 自定义并行队列追加异步任务，随机打印
let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
//concurrentQueue.async(execute: item1)
//concurrentQueue.async(execute: item2)

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
