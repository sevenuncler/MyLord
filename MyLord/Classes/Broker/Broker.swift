//
//  Broker.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol BrokerProtocol {
    func topic(by config: Config) -> TopicProtocol?
}

class Broker {
    var topics: [String: TopicProtocol] = [:]
    func topic(by config: Config) -> TopicProtocol? {
        return topics[config.topic]
    }
}
