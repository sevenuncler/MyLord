//
//  Broker.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol BrokerProtocol {
    func topic(by config: Config) -> TopicProtocol?
    func createTopicIfEmpty(by config: Config) -> TopicProtocol
}

class Broker: BrokerProtocol {
    var topics: [String: TopicProtocol] = [:]
    func topic(by config: Config) -> TopicProtocol? {
        return topics[config.topic]
    }
    
    func createTopicIfEmpty(by config: Config) -> TopicProtocol {
        var topic = topic(by: config)
        if topic == nil {
            topic = Topic(key: config.topic)
        }
        return topic!
    }
}
