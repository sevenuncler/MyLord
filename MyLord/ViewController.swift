//
//  ViewController.swift
//  MyLord
//
//  Created by He on 2022/10/26.
//

import UIKit

class ViewController: UIViewController {
    var broker: BrokerProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
//        broker = Broker()
//        let producerConfig = ProducerConfig(topic: "iap", queue: nil)
//        let producer = InnerPushProducer(broker: broker!, config: producerConfig)
//        
//        let record = InnerPushRecord(key: "Key", value: ["id":"1","title":"title", "content" : "content"])
//        producer.send(record)
//        
//        let inAppPushConsumer = InAppPushConsumer()
//        guard let iapRecord = inAppPushConsumer.next() else { return }
//        inAppPushConsumer.commit(iapRecord)
//        
//        ToastCenter.defaultCenter.showToast {
//            
//        }
    }
}

