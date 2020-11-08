import Foundation

var str = "Hello, DispatchGroup playground"

/// 用队列挂起、恢复重写，解决嵌套问题（https://juejin.im/post/6858126631760986126#heading-24）
///

let group = DispatchGroup()
let queue1 = DispatchQueue(label: "com.chacha.request", attributes: .concurrent)
let queue2 = DispatchQueue(label: "com.chacha.response", attributes: .concurrent)

queue2.suspend() // 队列2挂起

// 异步执行
queue1.async(group: group) {
    print("开始请求数据 \(Date()) thread: \(Thread.current)")
    sleep(5) // 模拟网络请求
    print("数据请求完成 \(Date()) thread: \(Thread.current)")
    
    queue2.resume() // 网络数据请求完成，恢复队列，进行数据处理
}

// 异步执行
queue2.async(group: group) {
    print("开始处理数据 \(Date())  thread: \(Thread.current)")
    sleep(5)//模拟数据处理
    print("数据处理完成 \(Date())  thread: \(Thread.current)")
}

print("开始监听")

// 切换到主队列监听，更新UI
group.notify(queue: DispatchQueue.main) {
    print("UI更新成功 \(Date()) thread: \(Thread.current)")
}

print("监听完毕")

/// 上面代码运行结果：
/// 开始监听
/// 监听完毕
/// 开始请求数据 2020-11-08 07:50:05 +0000 thread: <NSThread: 0x6000019960c0>{number = 4, name = (null)}
/// 数据请求完成 2020-11-08 07:50:10 +0000 thread: <NSThread: 0x6000019960c0>{number = 4, name = (null)}
/// 开始处理数据 2020-11-08 07:50:10 +0000  thread: <NSThread: 0x6000019972c0>{number = 6, name = (null)}
/// 数据处理完成 2020-11-08 07:50:15 +0000  thread: <NSThread: 0x6000019972c0>{number = 6, name = (null)}
/// UI更新成功 2020-11-08 07:50:15 +0000 thread: <NSThread: 0x600001990200>{number = 1, name = main}
