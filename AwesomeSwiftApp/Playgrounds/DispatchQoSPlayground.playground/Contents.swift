import Foundation

var str = "Hello, DispatchQoS playground"

/// DispatchQoS调度优先级：直译过来就是应用在任务上的服务质量或执行优先级，可以理解为任务的身份、等级。
/// 可以用来修饰DispatchWorkItem、DispatchQueue（https://juejin.im/post/6858126631760986126#heading-32）
///
/// DispatchQoS有以下几种类型：
/// 1. userInteractive: 与用户交互相关的任务，要最重视，优先处理，保证界面最流畅
/// 2. userInitiated: 用户主动发起的任务，要比较重视
/// 3. default: 默认任务，正常处理即可
/// 4. utility: 用户没有主动关注的任务
/// 5. background: 不太重要的维护、清理等任务，有空能处理完就行
/// 6. unspecified: 别说身份了，连身份证都没有，能处理就处理，不能处理也无所谓的
///

/// 1. 在DispatchWorkItem上添加DispatchQoS标识
let item1 = DispatchWorkItem(qos: .userInteractive) {
    for item in 0...9999 {
        print("--item1 -> \(item)  thread: \(Thread.current)")
    }
}

let item2 = DispatchWorkItem(qos: .unspecified) {
    for item in 0...9999 {
        print("item2 -> \(item)  thread: \(Thread.current)")
    }
}

let queue = DispatchQueue(label: "test1", attributes: .concurrent)
queue.async(execute: item1)
queue.async(execute: item2)

/// 2. 在DispatchQueue上添加DispatchQoS标识
let item3 = DispatchWorkItem {
    for item in 0...9999 {
        print("--item3 -> \(item)  thread: \(Thread.current)")
    }
}

let item4 = DispatchWorkItem {
    for item in 0...9999 {
        print("item4 -> \(item)  thread: \(Thread.current)")
    }
}

let queue1 = DispatchQueue(label: "test1", qos: .userInteractive, attributes: .concurrent)
let queue2 = DispatchQueue(label: "test2", qos: .unspecified, attributes: .concurrent)
queue1.async(execute: item3)
queue2.async(execute: item4)
