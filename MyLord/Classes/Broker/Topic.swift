//
//  Topic.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol TopicProtocol {
    func queue(by key: String) -> QueueProtocol?
    func createQueue(key: String) -> QueueProtocol
    func registerQueue(key: String, queue: QueueProtocol)
}

class Topic: TopicProtocol {
    var queues: [String: QueueProtocol] = [:]
    
    func createQueue(key: String) -> QueueProtocol {
        var queue = queue(by: key)
        if queue == nil {
            queues[key] = Queue()
        }
        return queue!
    }
    
    func queue(by key: String) -> QueueProtocol? {
        return queues[key]
    }
    
    func registerQueue(key: String, queue: QueueProtocol) {
        queues[key] = queue
    }
}
