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
    var currentTask: InAppPushTask?
    func consume(task: InAppPushTask, completion: @escaping (Bool) -> Void) {
        currentTask = task
        task.excute() { [self] (success) in
            if (success) {
                self.commit(task.record)
                self.currentTask = nil
                completion(success)
            }
        }
    }
    
    func shouldHandle(with task: InAppPushTask) -> Bool {
        if currentTask == nil {
            return true
        }
        return false
    }
    
    func shouldExcuteSimultaneously(with task: InAppPushTask) -> Bool {
        return false
    }
}
