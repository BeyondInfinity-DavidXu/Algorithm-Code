//
//  Sort(排序).swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/11.
//

import Foundation

class Sort {
    
    func minArray(_ numbers: [Int]) -> Int {
        if numbers.isEmpty { return -1 }
        
        var pre = numbers.first!
        
        for i in numbers {
            if i < pre {
                return i
            }else{
                pre = i
            }
        }
        
        return numbers.first!
    }
}
