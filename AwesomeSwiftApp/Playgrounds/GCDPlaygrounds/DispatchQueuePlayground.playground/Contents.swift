import Foundation

var str = "Hello, network request playground"

/// 使用GCD多线程处理网络请求的正确做法: A、B都定义成异步任务，在并行队列中嵌套异步任务，
/// 最后切换到主队列去刷新UI，这样做界面可以保证最流畅。
///
// 创建并行队列，尽量用自定义队列，免得自己的代码质量不过关，影响全局队列
let queue = DispatchQueue(label: "chacha.request", attributes: .concurrent)

//queue.async {
//
//    print("开始请求数据 \(Date()) thread: \(Thread.current)")
//    sleep(5) // 开始模拟网络请求
//    print("请求数据完成 \(Date()) thread: \(Thread.current)")
//
//    // 异步执行
//    queue.async {
//        print("开始处理数据 \(Date()) thread: \(Thread.current)")
//        sleep(5) // 开始模拟网络请求
//        print("数据处理完成 \(Date()) thread: \(Thread.current)")
//
//        // 切换到主队列，更新UI
//        DispatchQueue.main.async {
//            print("UI更新成功 \(Date()) thread: \(Thread.current)")
//        }
//    }
//}
//
/// 上述代码请求结果:
/// 开始请求数据 2020-11-08 06:09:26 +0000 thread: <NSThread: 0x600001505c00>{number = 5, name = (null)}
/// 请求数据完成 2020-11-08 06:09:31 +0000 thread: <NSThread: 0x600001505c00>{number = 5, name = (null)}
/// 开始处理数据 2020-11-08 06:09:31 +0000 thread: <NSThread: 0x60000151c480>{number = 3, name = (null)}
/// 数据处理完成 2020-11-08 06:09:36 +0000 thread: <NSThread: 0x60000151c480>{number = 3, name = (null)}
/// UI更新成功 2020-11-08 06:09:36 +0000 thread: <NSThread: 0x60000150c7c0>{number = 1, name = main}

/// 使用DispatchGroup
/// DispatchGroup常用的方法：
/// 1. group.wait(): 阻塞当前线程，一直到group所有任务执行完毕
/// 2. group.notify(): 所有任务执行完毕后，异步发送通知，不阻塞当前线程
///

/// 使用group.notify()改写上面例子：
let group = DispatchGroup()

queue.async(group: group) {
    print("开始请求数据 \(Date()) thread: \(Thread.current)")
    sleep(5) // 开始模拟网络请求
    print("请求数据完成 \(Date()) thread: \(Thread.current)")

    // 异步执行
    queue.async(group: group) {
        print("开始处理数据 \(Date()) thread: \(Thread.current)")
        sleep(5) // 开始模拟网络请求
        print("数据处理完成 \(Date()) thread: \(Thread.current)")
    }
}


print("开始监听")

/// 在当前队列监听，有两种方法：
/// 第一种
//group.notify(queue: queue) {
//    // 切换到主队列，更新UI
//    DispatchQueue.main.async {
//        print("UI更新成功 \(Date()) thread: \(Thread.current)")
//    }
//}

/// 第二种方法更为简洁，推荐第二种
group.notify(queue: DispatchQueue.main) {
    print("UI更新成功 \(Date()) thread: \(Thread.current)")
}

group.wait() // 阻塞当前线程

print("监听完毕")

/// 上述代码请求结果:
/// 开始监听
/// 监听完毕
/// 开始请求数据 2020-11-08 06:22:58 +0000 thread: <NSThread: 0x6000039f9f40>{number = 5, name = (null)}
/// 请求数据完成 2020-11-08 06:23:03 +0000 thread: <NSThread: 0x6000039f9f40>{number = 5, name = (null)}
/// 开始处理数据 2020-11-08 06:23:03 +0000 thread: <NSThread: 0x6000039fa5c0>{number = 4, name = (null)}
/// 数据处理完成 2020-11-08 06:23:08 +0000 thread: <NSThread: 0x6000039fa5c0>{number = 4, name = (null)}
/// UI更新成功 2020-11-08 06:23:08 +0000 thread: <NSThread: 0x6000039f8080>{number = 1, name = main}
///
/// 如果用group.wait()阻塞当前线程，结果为:
/// 开始监听
/// 开始请求数据 2020-11-08 07:11:19 +0000 thread: <NSThread: 0x6000032ea480>{number = 6, name = (null)}
/// 请求数据完成 2020-11-08 07:11:24 +0000 thread: <NSThread: 0x6000032ea480>{number = 6, name = (null)}
/// 开始处理数据 2020-11-08 07:11:24 +0000 thread: <NSThread: 0x6000032ea580>{number = 5, name = (null)}
/// 数据处理完成 2020-11-08 07:11:29 +0000 thread: <NSThread: 0x6000032ea580>{number = 5, name = (null)}
/// 监听完毕
/// UI更新成功 2020-11-08 07:11:29 +0000 thread: <NSThread: 0x6000032ec280>{number = 1, name = main}
///
