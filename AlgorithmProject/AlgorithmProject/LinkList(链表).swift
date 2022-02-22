//
//  LinkList(链表).swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/10.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(val: Int) {
        self.val = val
    }
}

class LinkList {
    
    func reversePrint(_ head: ListNode?) -> [Int] {
        var result: [Int] = []
        var next = head
        while next != nil {
            result.insert(next!.val, at: 0)
            next = next?.next
        }
        return result
    }
    
    static func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head?.val == val {
            let result = head?.next
            head?.next = nil
            return result
        }
        var next = head
        while next != nil {
            if let index = next?.next?.val, val == index {
                next?.next = next?.next?.next
            }
            next = next?.next
        }
        return head
    }
    
    static func linkList(with nodes: [Int]) -> ListNode? {
        if nodes.isEmpty { return nil }
        var head: ListNode?
        var next: ListNode?
        for i in nodes {
            if head == nil {
                head = ListNode(val: i)
                next = head
            }else{
                next?.next = ListNode(val: i)
                next = next?.next
            }
        }
        return head
    }
    
    func getIntersectionNode(headA: ListNode?, headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil { return nil }
        var nodeA = headA, nodeB = headB
        while nodeA?.val != nodeB?.val {
            nodeA = nodeA?.next
            if nodeA == nil, nodeB != nil { nodeA = headB }
            nodeB = nodeB?.next
            if nodeB == nil, nodeA != nil { nodeB = headA }
            if nodeA == nil && nodeB == nil { break }
        }
        return nodeA
    }
    
}
