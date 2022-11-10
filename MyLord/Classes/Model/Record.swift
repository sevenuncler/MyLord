//
//  Record.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

class Record<K, V> : Equatable{
    static func == (lhs: Record<K, V>, rhs: Record<K, V>) -> Bool {
        return lhs === rhs
    }
    
    let key: K
    let value: V
    var timestamp: Float?

    init(key: K, value: V) {
        self.key = key
        self.value = value
    }
}
