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
    
    /// 二叉树的镜像
    func mirrorTreeWithStack(_ root: TreeNode?) -> TreeNode? {
        guard let tree = root else { return nil }
        var stack = [tree]
        while !stack.isEmpty {
            let node = stack.popLast()
            if let left = node?.left {
                stack.append(left)
            }
            if let right = node?.right {
                stack.append(right)
            }
            let temp = node?.left
            node?.left = node?.right
            node?.right = temp
        }
        return tree
    }
    
}

// MARK: - 单值二叉树
/// https://leetcode-cn.com/problems/univalued-binary-tree/
extension Solution {
    
    /// 单值二叉树
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let tree = root else { return true }
        if let right = tree.right, right.val != tree.val { return false }
        if let left = tree.left, left.val != tree.val { return false }
        return isUnivalTree(tree.left) && isUnivalTree(tree.right)
    }
    
    /// 单值二叉树
    func isUnivalTreeWithStack(_ root: TreeNode?) -> Bool {
        guard let tree = root else { return true }
        var stack = [tree]
        while !stack.isEmpty {
            let node = stack.popLast()
            if let left = node?.left {
                if left.val != tree.val { return false }
                stack.append(left)
            }
            if let right = node?.right {
                if right.val != tree.val { return false }
                stack.append(right)
            }
        }
        return true
    }
    
}


// MARK: - 对称的二叉树
/// https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof/
extension Solution {
    
    ///对称的二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let tree = root else { return true }
        var queue: [TreeNode] = [tree]
        while !queue.isEmpty {
            // 生成一层的值数组
            let values: [Int?] = queue.reduce([]) { $0 + [$1.left?.val, $1.right?.val] }
            guard values.count.isMultiple(of: 2) else { return false }
            
            // 检查是否对称
            var result = true
            var index = 0
            let times = values.count / 2
            while index < times {
                if values[index] != values[values.count - 1 - index] {
                    result = false
                    break
                }
                index += 1
            }
            
            // 继续检查下一层
            guard result else { return false }
            var temp: [TreeNode] = []
            queue.forEach { (node) in
                if let left = node.left { temp.append(left)  }
                if let right = node.right { temp.append(right) }
            }
            queue = temp
        }
        return true
    }
    
    ///对称的二叉树 查看解答 递归
    func isSymmetricRec(_ root: TreeNode?) -> Bool {
        
        func rec(_ left: TreeNode?, right: TreeNode?) -> Bool {
            if left == nil && right == nil { return true }
            guard let l = left?.val, let r = right?.val, l == r else { return false }
            return rec(left?.left, right: right?.right) && rec(left?.right, right: right?.left)
        }
        
        guard let tree = root else { return true }
        return rec(tree.left, right: tree.right)
    }
    
    
}

