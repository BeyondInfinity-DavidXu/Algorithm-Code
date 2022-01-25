//
//  DoublePointer.swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/12.
//

import Foundation

class DoublePointer {
    
    // 调整数组顺序使奇数位于偶数前面
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
    
    /// 倒数第K个节点
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var slow = head, fast = head
        for _ in 0..<k {
            fast = fast?.next
        }
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
    
    /// 反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head?.next
        while fast != nil {
            let temp = fast?.next
            fast?.next = slow
            slow = fast
            fast = temp
        }
        head?.next = nil
        return slow
    }
    
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var left = l1, right = l2
        var head: ListNode? = nil
        var next: ListNode? = nil
        while left != nil || right != nil {
            let node: ListNode?
            if left == nil {
                node = right
                right = right?.next
            }else{
                if right == nil {
                    node = left
                    left = left?.next
                }else{
                    if left!.val >= right!.val {
                        node = right
                        right = right?.next
                    }else{
                        node = left
                        left = left?.next
                    }
                }
            }
            if head == nil {
                head = node
                next = head
            }else{
                next?.next = node
                next = next?.next
            }
        }
        return head
    }
    
}
