//
//  Queue.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol QueueProtocol {
    func enqueue(record: Record<Any, Any>) -> Bool
    func dequeue() -> Record<Any, Any>?
    func delete(record: Record<Any, Any>) -> Bool
    func clear()
}

class Queue: QueueProtocol {
    var records: [Record<Any, Any>] = []
    
    func enqueue(record: Record<Any, Any>) -> Bool {
        records.insert(record, at: 0)
        return true
    }
    
    func dequeue() -> Record<Any, Any>? {
        let record = records.last
        return record
    }
    
    func delete(record: Record<Any, Any>) -> Bool {
        let index = records.firstIndex(of: record)
        records.removeAll { (r) in
            return r === record
        }
        return true
    }
    
    func clear() {
        records.removeAll()
    }
    
    
}
