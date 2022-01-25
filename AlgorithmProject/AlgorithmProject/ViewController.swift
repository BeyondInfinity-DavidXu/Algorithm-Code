//
//  ViewController.swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // TODO: 矩阵中的路径，机器人的运动范围，剪绳子，数值的整数次方，正则表达式的匹配，表示数值的字符串，树的子结构，栈的压入弹出序列，包含main函数的栈
    
    func exchange(_ nums: [Int]) -> [Int] {
        if nums.isEmpty { return nums }
        func swap(_ counts: inout [Int], i: Int, j: Int) {
            counts[i] = counts[i] + counts[j]
            counts[j] = counts[i] - counts[j]
            counts[i] = counts[i] - counts[j]
        }
        
        var i = 0, j = nums.count - 1
        var temp = nums
        while i < j {
            if nums[i] % 2 == 0 {
                if nums[j] % 2 == 1 {
                    swap(&temp, i: i, j: j)
                    i += 1
                    j -= 1
                }else{
                    j -= 1
                }
            }else{
                i += 1
            }
        }
        
        return temp
    }

    // 二进制中1的个数，高级运算符的速度慢
    func hammingWeight(_ n: Int) -> Int {
        var temp = n, sum = 0
        while temp != 0 {
            if temp % 2 == 1 {
                sum += 1
            }
            temp = temp / 2
        }
        return sum
    }
    
    // 打印从1到最大的n位数
    func printNumbers(_ n: Int) -> [Int] {
        let max = Int(pow(10, Float(n)))
        var result: [Int] = []
        for i in 1..<max {
            result.append(i)
        }
        return result
    }
    
    // 顺时针打印矩阵
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result: [Int] = [], temp: [[Int]] = matrix
        func recur(nums: inout [[Int]]) {
            if nums.isEmpty { return }
            if nums.count == 1 {
                result.append(contentsOf: nums[0])
            }else if nums.count == 2 {
                result.append(contentsOf: nums[0])
                result.append(contentsOf: nums[1].reversed())
            }else{
                let first = nums[0]
                if first.count == 1 {
                    for item in nums {
                        result.append(item[0])
                    }
                }else if first.count == 2 {
                    result.append(contentsOf: first)
                    for i in 1..<nums.count - 1 {
                        result.append(nums[i][1])
                    }
                    result.append(contentsOf: nums[nums.count - 1].reversed())
                    for i in stride(from: nums.count - 2, to: 0, by: -1) {
                        result.append(nums[i][0])
                    }
                }else{
                    result.append(contentsOf: first)
                    for i in 1..<nums.count - 1 {
                        let item = nums[i]
                        result.append(item[item.count - 1])
                    }
                    result.append(contentsOf: nums[nums.count - 1].reversed())
                    for i in stride(from: nums.count - 2, to: 0, by: -1) {
                        result.append(nums[i][0])
                    }
                    
                    nums.removeFirst()
                    nums.removeLast()
                    var nextNums: [[Int]] = []
                    for item in nums {
                        var index = item
                        index.removeFirst()
                        index.removeLast()
                        nextNums.append(index)
                    }
                    nums = nextNums
                    recur(nums: &nums)
                }
            }
        }
        recur(nums: &temp)
        return result
    }
    
    func majorityElement(_ nums: [Int]) -> Int {
        let sort = nums.sorted(by: < )
        return sort[sort.count/2]
    }
}

