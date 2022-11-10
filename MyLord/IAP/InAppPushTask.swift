//
//  InAppPushTask.swift
//  MyLord
//
//  Created by He on 2022/11/4.
//

import Foundation

class InAppPushTask {
    let record: Record<Any, Any>
    let timeout: Int = 60 // seconds
    let key: String
    
    init(record: Record<Any, Any>) {
        self.record = record
        self.key = record.key as! String
    }
    
    func excute() {
        print("default:\(record.value)")
    }
    
    func excute(_  completion: @escaping (Bool) -> Void) {
        print("\(record.value)")
        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {
            completion(true)
        })
    }
    
    func cancel() {
        
    }
}
