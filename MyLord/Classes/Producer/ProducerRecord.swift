//
//  ProducerRecord.swift
//  MyLord
//
//  Created by He on 2022/10/26.
//

import Foundation

class ProducerRecord<K, V>: Record<Any, Any> {
    init(key: K, value: V) {
        super.init(key: key, value: value)
    }
}
