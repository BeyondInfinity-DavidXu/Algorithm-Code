//
//  Queue.swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/10.
//

import Foundation

class CQueue {
    
    var inQueue = Stack()
    var deQueue = Stack()
    
    init() {
        
    }
        
    func appendTail(_ value: Int) {
        inQueue.push(value)
    }
        
    func deleteHead() -> Int {
        
        if deQueue.isEmpty {
            while inQueue.isEmpty == false {
                deQueue.push(inQueue.pop()!)
            }
        }
        
        return deQueue.pop() ?? -1
    }
}
