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
    static let sharedInstance = Broker()
    static let brokers: [String: Broker] = [:]
    static func broker(by name: String?) -> Broker? {
        if name == nil {
            return sharedInstance;
        }
        
        return brokers[name!]
    }
    
    func registerTopic(_ topic: Topic) {
        topics[topic.key] = topic
    }
    
    func topic(by config: Config) -> TopicProtocol? {
        return topics[config.topic]
    }
    
    func topic(key: String) -> TopicProtocol? {
        return topics[key]
    }
    
    func createTopicIfEmpty(by config: Config) -> TopicProtocol {
        var topic = topic(by: config)
        if topic == nil {
            topic = Topic(key: config.topic)
        }
        return topic!
    }
}
