//
//  Stack.swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/10.
//

import Foundation

class Stack {
    
    private var elements: [Int] = []
    
    var isEmpty: Bool { elements.isEmpty }
    
    func pop() -> Int? {
        if isEmpty { return nil }
        return elements.removeLast()
    }
    
    func push(_ element: Int) {
        elements.append(element)
    }
}


