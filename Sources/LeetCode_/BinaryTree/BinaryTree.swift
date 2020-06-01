//
//  File.swift
//  
//
//  Created by 韩元旭 on 2020/5/27.
//

import Foundation

/// 二叉树专题
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// MARK: - 二叉树的深度
/// https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof/
extension Solution {
    
    /// 二叉树的深度 - 深度优先遍历
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let tree = root else { return 0 }
        return max(maxDepth(tree.left), maxDepth(tree.right)) + 1
    }
    
    /// 二叉树的深度 - 广度优先遍历
    func maxDepthWithBFS(_ root: TreeNode?) -> Int {
        guard let tree = root else { return 0 }
        var queue: [TreeNode] = [tree]
        var depth = 0
        while !queue.isEmpty {
            var temp: [TreeNode] = []
            queue.forEach { (node) in
                if let left = node.left {
                    temp.append(left)
                }
                if let right = node.right {
                    temp.append(right)
                }
            }
            queue = temp
            depth += 1
        }
        return depth
    }
    
}

// MARK: - 平衡二叉树
/// https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof/

extension Solution {
    
    /// 平衡二叉树
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let tree = root else { return true }
        let left = maxDepth(tree.left)
        let right = maxDepth(tree.right)
        return abs(left - right) <= 1 && isBalanced(tree.left) && isBalanced(tree.right)
    }
    
    /// LeetCode 别人做的
    func isBalanced_Best(_ root: TreeNode?) -> Bool {
        func recur(_ root: TreeNode?) -> Int {
            guard let tree = root else { return 0 }
            let left = recur(tree.left)
            if left == -1 {
                return -1
            }
            let right = recur(tree.right)
            if right == -1 {
                return -1
            }
            return abs(left - right) <= 1 ? max(left, right) + 1 : -1
        }
        return recur(root) != -1
    }
    
}

// MARK: - 二叉树的镜像
/// https://leetcode-cn.com/problems/er-cha-shu-de-jing-xiang-lcof/

extension Solution {
    
    /// 二叉树的镜像
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard let tree = root else { return nil }
        let temp = tree.left
        tree.left = mirrorTree(tree.right)
        tree.right = mirrorTree(temp)
        return tree
    }
    
}
