//
//  DFS-BFS.swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/11.
//

import Foundation

class DFS {
    
    static func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var sum = 0
        for j in 0..<n {
            for i in 0..<m {
                if k >= indexSum(i, j) {
                    sum += 1
                }else{
                    break
                }
            }
        }
        return sum
    }
    
    static func indexSum(_ i: Int, _ j: Int) -> Int {
        func sum(index: Int) -> Int {
            var number = 0
            var temp = index
            while temp > 0 {
                number += temp % 10
                temp = temp / 10
            }
            return number
        }
        return sum(index: i) + sum(index: j)
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var mutableBoard = board
        let wordChars: [Character] = [Character](word)
        func search(i: Int, j: Int, k: Int) -> Bool {
            guard i >= 0 && i < board.count else { return false }
            guard j >= 0 && j < board[i].count else { return false }
            
            guard k < wordChars.count else { return false }
            if mutableBoard[i][j] == wordChars[k] { return true }
            mutableBoard[i][j] = " "
            let result = search(i: i + 1, j: j, k: k + 1) || search(i: i - 1, j: j, k: k + 1) || search(i: i, j: j + 1, k: k + 1) || search(i: i, j: j - 1, k: k + 1)
            mutableBoard[i][j] = wordChars[k]
            return result
        }
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if search(i: i, j: j, k: 0) { return true }
            }
        }
        return false
    }
    
    
}
