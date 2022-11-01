//
//  Queue.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol QueueProtocol {
    func enqueue(record: Record)
    func dequeue() -> Record?
    func delete(record: Record) -> Bool
    func clear()
}

class Queue: QueueProtocol {
    func enqueue(record: Record) {
        
    }
    
    func dequeue() -> Record? {
        return Record()
    }
    
    func delete(record: Record) -> Bool {
        return true
    }
    
    func clear() {
        
    }
    
    
}
