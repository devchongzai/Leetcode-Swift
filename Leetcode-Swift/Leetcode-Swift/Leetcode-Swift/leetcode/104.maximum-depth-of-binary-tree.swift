//
//  104.maximum-depth-of-binary-tree.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/15.
//

import Foundation

/*
 104. 二叉树的最大深度 (简单)
 https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
 */

/*
 思路：
 1. 递归
 2. 迭代
 */
class Solution104 {
    
    /// 思路：迭代
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var queue = [root]
        var level = 0
        while queue.count > 0 {
            let qCount = queue.count
            for _ in 0..<qCount {
                let head = queue.removeFirst()
                if head!.left != nil {
                    queue.append(head!.left!)
                }
                if head!.right != nil {
                    queue.append(head!.right!)
                }
            }
            level += 1
        }
        return level
    }
    
    /// 思路：递归
    func maxDepth_recursive(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root?.left == nil, root?.right == nil {
            return 1
        }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    /*
     测试用例：
     1. 均在左子树；均在右子树；左右均有
     2. 1个节点
     3. 空树
     */
    func test() {
        let n1 = createTreeNode([1,2,nil,3,nil,4,nil])
        let n2 = createTreeNode([1,nil,2,nil,3,nil,4])
        let n3 = createTreeNode([3,9,20,nil,nil,15,7])
        let n4 = createTreeNode([1,nil,nil])
        print(maxDepth(n1))
        print(maxDepth(n2))
        print(maxDepth(n3))
        print(maxDepth(n4))
        print(maxDepth(nil))
    }
}
