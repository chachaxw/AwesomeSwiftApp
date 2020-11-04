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

let mainQueue = DispatchQueue.main

mainQueue.async(execute: item1)
mainQueue.async(execute: item2)
