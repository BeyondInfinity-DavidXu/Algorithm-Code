//
//  Recursion-Loop-Dynamic(递归循环动态规划).swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/11.
//

import Foundation

/// 递归，循环，动态规划
///  递归基

class Recursion {
    
    /// 斐波那契数列 F(0) = 0 F(1) = 1 ，F(n) = F(n -1) + F(n - 2)
    static func fib(_ n: Int) -> Int {
        var num = 0, i = 0, j = 1
        while num < n {
            j = i + j
            i = j - i
            num += 1
        }
        return i
    }
    
    // 青蛙跳台阶
    func numWays(_ n: Int) -> Int {
        var k = 0, f = 1, g = 1
        // 0 1 2 3
        while k < n {
            g = g + f
            f = g - f
            k += 1
        }
        return f
    }
    
}


