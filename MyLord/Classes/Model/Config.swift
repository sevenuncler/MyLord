//
//  Config.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

class Config {
    var broker: String? = nil
    let topic: String
    var queue: String?
    init(topic: String, queue: String?) {
        self.topic = topic
        self.queue = queue
    }
}
