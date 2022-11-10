//
//  LiveInAppPushConsumer.swift
//  MyLord
//
//  Created by He on 2022/11/4.
//

import Foundation

class LiveInnerPushConsumer: InAppPushConsumer {
    override func shouldExcuteSimultaneously(with task: InAppPushTask) -> Bool {
        if task.record.key as! String == "Live" {
            return true
        }
        return false
    }
}
