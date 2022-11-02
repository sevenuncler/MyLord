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
        broker = Broker()
        let producerConfig = ProducerConfig(topic: "iap", queue: nil)
        let producer = Producer<String, String>(broker: broker!, config: producerConfig)
        
        let record = ProducerRecord(topic: "iap", key: "Key", value: "value")
        producer.send(record)
    }


}

