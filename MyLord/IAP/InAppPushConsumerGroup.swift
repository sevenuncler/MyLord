//
//  InAppPushConsumerGroup.swift
//  MyLord
//
//  Created by He on 2022/11/4.
//

import Foundation



class Interceptor {
    func onConsume(record: Record<Any, Any>?) -> InAppPushTask? {
        return nil
    }
}

class InAppPushConsumerGroup {
    // 0. 拦截器注入
    // 1. 统一调度策略
    // 2. 任务维度判断
    let interceptor = Interceptor()
    var currentTask: InAppPushTask?
    var currentConsumer: InAppPushConsumer?
    var timer: Timer?
    var consumers: [String: InAppPushConsumer] = [:]
    
    func startLoop() {
        timer?.invalidate()
        timer = Timer(timeInterval: 1, repeats: true) { timer in
            self.consume()
        }
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
    }
    
    func stopLoop() {
        timer?.invalidate()
        timer = nil
    }
    
    func consume() {
        // 1. 指定获取策略
        // 2. 遍历候选
        Broker.sharedInstance.topic(key: "InnerPush")?.pollRecord({ record in
            // 3. 拦截器转换消息记录为 task
            let task = interceptor.onConsume(record: record)
            // 4. 单任务判断
            let key: String = record.key as! String
            var targetConsumer: InAppPushConsumer? = consumers[key]
            if task != nil && targetConsumer != nil && targetConsumer!.shouldExcuteSimultaneously(with: task!) {
                if currentTask == nil || ((currentConsumer?.shouldExcuteSimultaneously(with: task!)) != nil) {
                    let consumer = consumers[task!.record.key]
                    consumer?.consume(task: task!)
                    return true // 5. 可用候选，则中断遍历
                }
            }
            return false
        })
    }
    
    /**
            消费策略
            1. 按顺序消费
            2. 按优先级消费
            3. 消息聚合
            4. 消息更新
     */
}
