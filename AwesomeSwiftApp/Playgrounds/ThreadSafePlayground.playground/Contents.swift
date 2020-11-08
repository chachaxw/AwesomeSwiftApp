import Foundation

var str = "Hello, thread safe playground"

/// 线程安全（https://juejin.im/post/6858126631760986126#heading-26）
/// 如果有一个变量有可能被多个线程同时读写，结果便不可预期，必须进行特殊处理，来保证线程安全
///
/// 1. 同构设置barrier标识设置屏障
/// 自定义队列支持DispatchWorkItem设置flags为.barrier，可以支持barrier之前的任务全部执行完毕后，
/// 再执行.barrier任务，最后再执行.barrier之后的任务，这样处理可以保证线程安全。
///
/// NOTE: 全局队列，flags设置.barrier无效
///
let item1 = DispatchWorkItem {
    for item in 0...3 {
        print("item1 -> \(item)  thread: \(Thread.current)")
    }
}

let item2 = DispatchWorkItem {
    for item in 0...3 {
        print("item2 -> \(item)  thread: \(Thread.current)")
    }
}

// 给item3任务加barrier标识
let item3 = DispatchWorkItem(flags: .barrier) {
    for item in 0...3 {
        print("item3 barrier -> \(item)  thread: \(Thread.current)")
    }
}

let item4 = DispatchWorkItem {
    for item in 0...3 {
        print("item4 -> \(item)  thread: \(Thread.current)")
    }
}

let item5 = DispatchWorkItem {
    for item in 0...3 {
        print("item5 -> \(item)  thread: \(Thread.current)")
    }
}

let queue = DispatchQueue(label: "queue", attributes: .concurrent)
queue.async(execute: item1)
queue.async(execute: item2)
queue.async(execute: item3)
queue.async(execute: item4)
queue.async(execute: item5)

/// 2. 使用DispatchSemaphore（翻译成信号量📶或红绿灯🚥）给线程上锁
/// DispatchSemaphore初始化时只有一个参数value（通行数量），表示还可以通行几辆车（还可以执行几个异步任务）
/// DispatchSemaphore有两个方法：
/// 1. wait(): 执行一次，通行数量减1，通行数量为0时就表示红灯，全部都得等着
/// 2. signal(): 执行一次，通行数量加1
///
/// 99乘法表的例子
let semaphore = DispatchSemaphore(value: 1)
let queue1 = DispatchQueue(label: "concurrent", attributes: .concurrent)

// 执行9个异步任务
for item1 in 1...9 {
    queue1.async {
        semaphore.wait() // 绿灯时间减1，此处变为0，为红灯，全都得等着
        var str = ""
        
        for item2 in 1...9 {
            //格式化一下字符串，后面加两个空格。如果只有个位数的，前面补个空格
            let value = item1 * item2
            let tempStr = value <= 9 ? "\(value)  " : "\(value) "
            str += tempStr
        }
        
        print(str)
        semaphore.signal() // 绿灯时间加1，后面可继续通行
    }
}

/// 上面代码运行结果
/// 1  2  3  4  5  6  7  8  9
/// 2  4  6  8  10 12 14 16 18
/// 3  6  9  12 15 18 21 24 27
/// 4  8  12 16 20 24 28 32 36
/// 5  10 15 20 25 30 35 40 45
/// 6  12 18 24 30 36 42 48 54
/// 7  14 21 28 35 42 49 56 63
/// 8  16 24 32 40 48 56 64 72
/// 9  18 27 36 45 54 63 72 81

/// 3. 使用串行队列+计算属性，修改变量


