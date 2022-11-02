//
//  Queue.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol QueueProtocol {
    func enqueue(record: Record<Any, Any>)
    func dequeue() -> Record<Any, Any>?
    func delete(record: Record<Any, Any>) -> Bool
    func clear()
}

class Queue: QueueProtocol {
    var records: [Record<Any, Any>] = []
    
    func enqueue(record: Record<Any, Any>) {
        records.append(record)
    }
    
    func dequeue() -> Record<Any, Any>? {
        return Record(key: "k", value: "v")
    }
    
    func delete(record: Record<Any, Any>) -> Bool {
        return true
    }
    
    func clear() {
        records.removeAll()
    }
    
    
}
