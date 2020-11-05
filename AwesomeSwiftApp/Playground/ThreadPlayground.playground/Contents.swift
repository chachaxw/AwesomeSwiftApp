import UIKit
import Foundation

/// Swift 多线程学习(https://juejin.im/post/6858126631760986126)

var str = "Hello, thread playground"

/// 基础
/// 调度工作项：其实就是一项任务，可以把你想要执行的代码写成闭包，
/// 在DispatchWorkItem初始化时传进去，方便后续管理任务，并且会让代码更整洁

/// 1. 只带尾随闭包
let item1 = DispatchWorkItem {
    for item in 0...2 {
        print("item1 -> \(item) thread: \(Thread.current)")
    }
}

/// 2. 指定qos(执行优先级) 或flags(特殊行为标记)
let item2 = DispatchWorkItem.init(qos: .userInteractive, flags: .barrier) {
    print("item2 thread: \(Thread.current)")
}

/// DispatchQueue有三种类型:
///     1. Main queue
///     2. Global queue
///     3. Custom queue

/// 异步执行
/// 主队列追加异步任务，按顺序打印
let mainQueue = DispatchQueue.main
mainQueue.async(execute: item1)
mainQueue.async(execute: item2)

/// 全局队列追加异步任务，随机打印
let globalQueue = DispatchQueue.global()
globalQueue.async(execute: item1)
globalQueue.async(execute: item2)

/// 自定义串行队列追加异步任务，按顺序打印
let serialQueue = DispatchQueue(label: "serial")
serialQueue.async(execute: item1)
serialQueue.async(execute: item2)

/// 自定义并行队列追加异步任务，随机打印
let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
concurrentQueue.async(execute: item1)
concurrentQueue.async(execute: item2)

/// 同步执行
/// 主队列追加同步任务，会引起死锁
//mainQueue.sync(execute: item1)
//mainQueue.sync(execute: item2)
