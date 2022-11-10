//
//  Topic.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation
// 支持发布订阅模式、队列模式
protocol TopicProtocol {
    func queue(by key: String ) -> QueueProtocol?;
    func queue(by key: String, create ifEmpty: Bool) -> QueueProtocol?
    func registerQueue(key: String, queue: QueueProtocol)
    func poll(by queueKey: String?) -> Record<String, Any>?
    func pollRecord(_ handler: (Record<Any, Any>) -> (Bool))
    func commit(record: Record<Any, Any>) -> Bool
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
    
    func commit(record: Record<Any, Any>) -> Bool {
        let queue = queues[record.key as! String]
        return queue?.delete(record: record) ?? false
    }
    
    func registerQueue(key: String, queue: QueueProtocol) {
        queues[key] = queue
    }
    
    func poll(by queueKey: String?) -> Record<String, Any>? {
        return nil
    }
    
    func pollRecord(_ handler: (Record<Any, Any>) -> (Bool)) {
        for queue in queues.values.shuffled() {
            let record = queue.dequeue()
            if record != nil &&  handler(record!) {
                break;
            }
        }
    }
}
