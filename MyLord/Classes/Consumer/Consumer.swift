//
//  Consumer.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol ConsumerProtocol {
    func nextRecord() -> Record<String, Any>?
    func commit(_ record: Record<Any, Any>)
}

/**
    用于消费某主题下的所有\指定类型消息
 */
class Consumer: ConsumerProtocol {
    let config: ConsumerConfig
    var broker: BrokerProtocol?

    init(config: ConsumerConfig) {
        self.config = config
    }
        
    func nextRecord() -> Record<String, Any>? {
        let record = Broker.broker(by: config.broker)?.topic(key: config.topic)?.poll(by: config.queue)
        return record
    }
    
    func nextRecords() -> [Record<Any, Any>] {
        return []
    }
    
    func commit(_ record: Record<Any, Any>) {
        let topic = broker?.topic(by: config)
        topic?.commit(record: record)
    }
    
    // Publish-Subscribe
    func onReceive(_ records: [Record<Any, Any>]) {
        
    }
    
    // 订阅/取消某个主题的接口
    // poll
    // commitSync/commitAsync
    // Seek
    // position
    // pause/resume/close
}
