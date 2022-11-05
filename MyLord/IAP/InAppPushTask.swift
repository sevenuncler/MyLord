//
//  InAppPushTask.swift
//  MyLord
//
//  Created by He on 2022/11/4.
//

import Foundation

class InAppPushTask {
    let record: Record<String, Any>
    let timeout: Int = 60 // seconds
    let key: String
    
    init(record: Record<String, Any>) {
        self.record = record
        self.key = record.key
    }
    
    func excute() {
        
    }
    
    func cancel() {
        
    }
}
