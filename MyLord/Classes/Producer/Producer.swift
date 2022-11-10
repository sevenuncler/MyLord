//
//  Producer.swift
//  MyLord
//
//  Created by He on 2022/10/26.
//

import Foundation

class Producer<K, V> {
    let config: ProducerConfig
    var broker: BrokerProtocol?
    
    init(broker: BrokerProtocol?, config: ProducerConfig) {
        self.broker = broker
        self.config = config
    }
    
    func send(_ record: ProducerRecord<K, V>) -> Bool{
        let topic = broker?.createTopicIfEmpty(by: config)
        let result = topic?.queue(by: record.key as! String, create: config.autoCreateQueue)?.enqueue(record: record)
        return result ?? false
    }
    
    func updateBroker(broker: BrokerProtocol) {
        self.broker = broker
    }
}
