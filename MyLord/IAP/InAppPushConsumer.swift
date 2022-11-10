//
//  InAppPushConsumer.swift
//  MyLord
//
//  Created by He on 2022/11/2.
//

import Foundation

// 1. 按顺序消费不同类型策略的消息
// 2. 消息格式不一致
// 3. 消息之间需要等待
//   设置超时时间
//
// 4. 消息冲突的解决，利用手势冲突的策略

class InAppPushConsumer: Consumer {
    func consume(task: InAppPushTask) {
        task.excute()
        commit(task.record)
    }
    
    func shouldHandle(with task: InAppPushTask) -> Bool {
        return true
    }
    
    func shouldExcuteSimultaneously(with task: InAppPushTask) -> Bool {
        return false
    }
}
