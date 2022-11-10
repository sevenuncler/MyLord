//
//  LiveInnerPushTask.swift
//  MyLord
//
//  Created by He on 2022/11/10.
//

import Foundation

class LiveInnerPushTask: InAppPushTask {
    override func excute() {
        print("live:\(record.value)")
    }
}
