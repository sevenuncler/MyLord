//
//  Consumer.swift
//  MyLord
//
//  Created by He on 2022/11/1.
//

import Foundation

protocol ConsumerProtocol {
    func next() -> Record<String, Any>?
    func commit(_ record: Record<String, Any>)
}

class Consumer: ConsumerProtocol {
    func next() -> Record<String, Any>? {
        return nil
    }
    
    func commit(_ record: Record<String, Any>) {
        
    }
}
