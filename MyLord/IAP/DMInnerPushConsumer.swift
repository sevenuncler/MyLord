//
//  DMInnerPushConsumer.swift
//  MyLord
//
//  Created by He on 2022/11/4.
//

import Foundation

class DMInnerPushConsumer: InAppPushConsumer {
    override func shouldExcuteSimultaneously(with task: InAppPushTask) -> Bool {
        return true
    }
    
    // 消费成功之后再 commit
    // 如果在自己队列执行
    // 开启超时定时器
//    override func consume(task: InAppPushTask) {
//        if currentTask != nil {
//            // update
//        } else {
//            // show
//        }
//    }
}
