//
//  ProducerRecord.swift
//  MyLord
//
//  Created by He on 2022/10/26.
//

import Foundation

class ProducerRecord<K, V>: Record<Any, Any> {
    let topic: String
    let key: K
    let value: V
    var timestamp: Float?
    
    init(topic: String, key: K, value: V) {
        self.topic = topic
        self.key = key
        self.value = value
    }
}
