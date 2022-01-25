//
//  BinaryTree(二叉树).swift
//  AlgorithmProject
//
//  Created by 伟亭徐 on 2022/1/10.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}

class BinaryTree {
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var node: TreeNode?
        if let root = preorder.first, let index = inorder.firstIndex(of: root) {
            node = TreeNode(root)
            var leftInorder: [Int] = [], rightInorder: [Int] = []
            for i in 0..<inorder.count {
                if i > index {
                    rightInorder.append(inorder[i])
                }else if i < index {
                    leftInorder.append(inorder[i])
                }
            }
            
            var leftPreorder: [Int] = [], rightPreorder: [Int] = []
            
            for i in 1..<preorder.count {
                if leftPreorder.count < leftInorder.count {
                    leftPreorder.append(preorder[i])
                }else{
                    rightPreorder.append(preorder[i])
                }
            }
            
            node?.left = buildTree(leftPreorder, leftInorder)
            node?.right = buildTree(rightPreorder, rightInorder)
        }
        return node
    }
    
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        
        func exchange(node: TreeNode?) {
            guard let node = node else {
                return
            }
            let right = node.right
            node.right = node.left
            node.left = right
            exchange(node: node.left)
            exchange(node: node.right)
        }
        
        exchange(node: root)
        
        return root
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }

        func isSame(left: TreeNode?, right: TreeNode?) -> Bool {
            if left == nil && right == nil { return true } // 见底了，递归基
            if left == nil && right != nil { return false }
            if left != nil && right == nil { return false }
            if left?.val == right?.val {
                return isSame(left: left?.left, right: right?.right) && isSame(left: left?.right, right: right?.left)
            }else{
                return false
            }
        }

        return isSame(left: root.left, right: root.right)
    }
    
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil { return false }
        var rootBs: [TreeNode] = []
        func appendRootBNodes(root: TreeNode?) {
            guard let root = root else {
                return
            }
            if root.val == B!.val {
                rootBs.append(root)
            }
            appendRootBNodes(root: root.left)
            appendRootBNodes(root: root.right)
        }
        
        appendRootBNodes(root: A)
        
        if rootBs.isEmpty { return false }
        
        func isSub(aNode: TreeNode?, bNode: TreeNode?) -> Bool {
            var result = false
            if bNode == nil {
                result = true
            }else{
                if aNode == nil {
                    result = false
                }else{
                    result = aNode?.val == bNode?.val
                }
            }
            
            if result == false { return false }
            
            return result && isSub(aNode: aNode?.left, bNode: bNode?.left) && isSub(aNode: aNode?.right, bNode: bNode?.right)
        }
        
        for item in rootBs {
            if isSub(aNode: item, bNode: B) {
                return true
            }
        }
        return false
    }
    
//    func levelOrder(_ root: TreeNode?) -> [Int] {
//        
//    }
}
