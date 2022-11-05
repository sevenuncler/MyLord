//
//  InnerPushCenter.swift
//  MyLord
//
//  Created by He on 2022/11/4.
//

import Foundation


class InnerPushCenter {
    // 启动 Inner Push 模块
    // 1. 注册 Topic
    // 2. 初始化 ConsumerGroup
    // 3. 接收 Producer 注册
    // 4. 接收 Consumer 注册
    // 5. 开启 ConsumerGroup 消费 Loop
    // 6. 等待 Producer 生产消息
    
    static let defaultCenter = InnerPushCenter()
    lazy var topic: Topic = {
        return Topic(key: "InnerPush")
    }()
    
    lazy var consumerGroup: InAppPushConsumerGroup = {
        return InAppPushConsumerGroup()
    }()
    
    init() {
        setup()
    }
    
    func setup() {
        Broker.sharedInstance.registerTopic(topic)
        consumerGroup.startLoop()
    }
    
    // 自定义注册能力
    // 自定义Topic-queue、Broker-生产者、Broker-消费者、拦截器、消费者-task
    //
    
    func registerProducer(producer: InnerPushProducer) {
        producer.updateBroker(broker: Broker.sharedInstance)
    }
    
    func registerConsumer(key: String, consumer: InAppPushConsumer) {
        consumerGroup.consumers[key] = consumer
    }
    
    // 支持子线程轮训
}
