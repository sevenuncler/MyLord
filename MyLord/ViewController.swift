//
//  ViewController.swift
//  MyLord
//
//  Created by He on 2022/10/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let producerConfig = ProducerConfig()
        let producer = Producer<String, String>(config: producerConfig)
        let record = ProducerRecord(key: "Key", value: "value")
        producer.send(record)
    }


}

