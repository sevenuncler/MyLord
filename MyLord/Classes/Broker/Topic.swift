//
//  Topic.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol TopicProtocol {
    func queue(by key: String ) -> QueueProtocol?;
    func queue(by key: String, create ifEmpty: Bool) -> QueueProtocol
    func registerQueue(key: String, queue: QueueProtocol)
}

class Topic: TopicProtocol {
    let key: String
    var queues: [String: QueueProtocol] = [:]
    
    init(key: String) {
        self.key = key
    }
    
    func queue(by key: String, create ifEmpty: Bool) -> QueueProtocol {
        var queue = queue(by: key)
        if ifEmpty && queue == nil {
            queue = Queue()
            queues[key] = queue
        }
        return queue!
    }
    
    func queue(by key: String ) -> QueueProtocol? {
        return queues[key]
    }
    
    func registerQueue(key: String, queue: QueueProtocol) {
        queues[key] = queue
    }
}
