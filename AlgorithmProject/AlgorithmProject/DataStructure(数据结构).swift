//
//  DataStructure(数据结构).swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/10.
//

import Foundation

// 数组

class OfferArray {
    
    static func findRepeatNumber(_ nums: [Int]) -> Int {
        var repeatDic: [String: Int] = [:]
        for item in nums {
            if let value = repeatDic["\(item)"] {
                return value
            }else{
                repeatDic["\(item)"] = item
            }
        }
        return -1
    }
    
    static func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.isEmpty == false else { return false }
        func containTarget(i: Int, j: Int) -> Bool {
            guard i < matrix.count && i >= 0 else {
                return containTarget(i: 0, j: j + 1)
            }
            guard j < matrix[i].count && j >= 0 else { return false }
            if matrix[i][j] == target {
                return true
            }else if matrix[i][j] < target {
                return containTarget(i: i + 1 , j: j)
            }else{
                return containTarget(i: 0, j: j + 1)
            }
        }
        
        return containTarget(i: 0, j: 0)
    }
}

class OfferString {
    
    func replaceSpace(_ s: String) -> String {
        var temp: String = ""
        for item in s {
            if item == " " {
                temp.append("%20")
            }else{
                temp.append("\(item)")
            }
        }
        return temp
    }
}


