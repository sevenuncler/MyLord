//
//  InAppPushConsumerGroup.swift
//  MyLord
//
//  Created by He on 2022/11/4.
//

import Foundation

class Interceptor {
    func onConsume(record: Record<Any, Any>) -> InAppPushTask? {
        return nil
    }
}

class InAppPushConsumerGroup {
    // 0. 拦截器注入
    // 1. 统一调度策略
    // 2. 任务维度判断
    let interceptor = Interceptor()
    var currentTask: InAppPushTask?
    func consume() {
        // 1. 指定获取策略
        let records: [Record<Any, Any>] = [Record(key: "K", value: "V")]
        // 2. 遍历候选
        for record in records {
            // 3. 拦截器转换消息记录
            let task = interceptor.onConsume(record: record)
            // 4. 单任务判断
            if task != nil {
                if currentTask == nil || currentTask!.shouldExcuteSimultaneously(with: task!) {
                    task?.excute()
                    break // 5. 可用候选，则中断遍历
                }
            }
        }
    }
}
