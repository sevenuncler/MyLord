//
//  ToastCenter.swift
//  MyLord
//
//  Created by He on 2022/11/5.
//

import Foundation

enum ToastShowMode {
    case Default
    case Mutex
    case Replace
}


class ToastCenter {
   static let defaultCenter = ToastCenter()
    init() {
        
    }
    
    // 任务叠加
    // 任务顺序
    // 任务顶替
    // 一定时间内不再展示
    
    func showToast(_ task: () -> Void) {
        showToast(task, mode: .Default)
    }
    
    func showToast(_ task: () -> Void, mode: ToastShowMode) {
        
    }
}
