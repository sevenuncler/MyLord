//
//  ViewController.swift
//  MyLord
//
//  Created by He on 2022/10/26.
//

import UIKit

class ViewController: UIViewController {
    var broker: BrokerProtocol?
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        testInnerPush()
        testLiveInnerPush()
    }
    
    func testInnerPush() {
        let topic = InnerPushTopic
        let defaultQueue = "Default"
        
            // 生产者
            let producerConfig = ProducerConfig(topic: topic, queue: defaultQueue)
            producerConfig.autoCreateQueue = true
            let producer = InnerPushProducer(broker: nil, config: producerConfig)
            InnerPushCenter.defaultCenter.registerProducer(producer: producer)
            var index = 0
            timer = Timer(timeInterval: 3, repeats: true) { timer in
                let record = InnerPushRecord(key: defaultQueue, value: "default\(index)")
                index += 1
                producer.send(record)
            }
            RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
        
        
        // 消费消息
        let consumerConfig = ConsumerConfig(topic: topic, queue: defaultQueue)
        let consumer = InAppPushConsumer(config: consumerConfig)
        InnerPushCenter.defaultCenter.registerConsumer(key: defaultQueue, consumer: consumer)
    }
    
    func testLiveInnerPush() {
        let topic = InnerPushTopic
        let queue = "Live"
        
            // 生产者
            let producerConfig = ProducerConfig(topic: topic, queue: queue)
            producerConfig.autoCreateQueue = true
            let producer = InnerPushProducer(broker: nil, config: producerConfig)
            InnerPushCenter.defaultCenter.registerProducer(producer: producer)
            var index = 0
            timer = Timer(timeInterval: 3, repeats: true) { timer in
                let record = InnerPushRecord(key: queue, value: "live\(index)")
                index += 1
                producer.send(record)
            }
            RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
        
        
        // 消费消息
        let consumerConfig = ConsumerConfig(topic: topic, queue: queue)
        let consumer = LiveInnerPushConsumer(config: consumerConfig)
        InnerPushCenter.defaultCenter.registerConsumer(key: queue, consumer: consumer)
    }
}

