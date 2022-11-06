//
//  Topic.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol TopicProtocol {
    func queue(by key: String ) -> QueueProtocol?;
    func queue(by key: String, create ifEmpty: Bool) -> QueueProtocol?
    func registerQueue(key: String, queue: QueueProtocol)
    func pollRecord(_ handler: (Record<Any, Any>) -> (Bool))
}

class Topic: TopicProtocol {
    let key: String
    var queues: [String: QueueProtocol] = [:]
    
    init(key: String) {
        self.key = key
    }
    
    func queue(by key: String, create ifEmpty: Bool) -> QueueProtocol? {
        var queue = queue(by: key)
        if ifEmpty && queue == nil {
            queue = Queue()
            queues[key] = queue
        }
        return queue
    }
    
    func queue(by key: String ) -> QueueProtocol? {
        return queues[key]
    }
    
    func registerQueue(key: String, queue: QueueProtocol) {
        queues[key] = queue
    }
    
    func pollRecord(_ handler: (Record<Any, Any>) -> (Bool)) {
        for queue in queues.values {
            var record = queue.dequeue()
            if record != nil &&  handler(record!) {
                break;
            }
        }
    }
}
