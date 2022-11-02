//
//  ProducerRecord.swift
//  MyLord
//
//  Created by He on 2022/10/26.
//

import Foundation

class ProducerRecord<K, V>: Record<Any, Any> {
    let topic: String
    
    init(topic: String, key: K, value: V) {
        self.topic = topic
        super.init(key: key, value: value)
    }
}
