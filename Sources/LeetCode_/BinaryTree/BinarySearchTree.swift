//
//  File.swift
//  
//
//  Created by 韩元旭 on 2020/6/9.
//

import Foundation

// MARK: - 修剪二叉搜索树
/// https://leetcode-cn.com/problems/trim-a-binary-search-tree/
extension Solution {
    
    // 给定一个二叉搜索树，同时给定最小边界L 和最大边界 R。通过修剪二叉搜索树，使得所有节点的值在[L, R]中 (R>=L)
    
    /// 修剪二叉搜索树
    func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
        guard let tree = root else { return nil }
        if tree.val > R {
            return trimBST(tree.left, L, R)
        }
        if tree.val < L {
            return trimBST(tree.right, L, R)
        }
        tree.left = trimBST(tree.left, L, R)
        tree.right = trimBST(tree.right, L, R)
        return tree
    }
    
}

// MARK: - 把二叉搜索树转换为累加树
/// https://leetcode-cn.com/problems/convert-bst-to-greater-tree/
extension Solution {
    
    // 使得每个节点的值是原来的节点值加上所有大于它的节点值之和。
    
    /// 把二叉搜索树转换为累加树 - 反序中序遍历
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        var sum: Int = 0
    
        func rec(_ root: TreeNode?) {
            guard let tree = root else { return }
            rec(tree.right)
            sum += tree.val
            tree.val = sum
            rec(tree.left)
        }
        
        rec(root)
        return root
    }
    
    #warning("TODO LeetCode 上还有两种方法")
    
}


// MARK: - 二叉搜索树中的搜索
/// https://leetcode-cn.com/problems/search-in-a-binary-search-tree/
extension Solution {
    
    // 返回以该节点为根的子树。 如果节点不存在，则返回 NULL
    
    /// 二叉搜索树中的搜索
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let tree = root else { return nil }
        if val == tree.val {
            return tree
        } else if val > tree.val {
            return searchBST(tree.right, val)
        } else {
            return searchBST(tree.left, val)
        }
    }
    
    /// 二叉搜索树中的搜索 - 迭代
    func searchBST_BFS(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var tree = root
        while tree != nil && tree?.val != val {
            tree = tree!.val > val ? tree?.left : tree?.right
        }
        return tree
    }
    
}


// MARK: - 二叉搜索树的范围和
/// https://leetcode-cn.com/problems/range-sum-of-bst/
extension Solution {
    
    // 返回 L 和 R（含）之间的所有结点的值的和
    
    /// 二叉搜索树的范围和
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var sum = 0
        
        func rec(_ root: TreeNode?) {
            guard let tree = root else { return }
            if  L <= tree.val && tree.val <= R{
                sum += tree.val
            }
            
            if L < tree.val {
                rec(tree.left)
            }
            
            if tree.val < R {
                rec(tree.right)
            }
        }
        
        rec(root)
        return sum
    }
    
    /// 二叉搜索树的范围和
    func rangeSumBST_BFS(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        guard let tree = root else { return 0 }
        var sum = 0
        var stack = [tree]
        while !stack.isEmpty {
            guard let node = stack.popLast() else { break }
            if  L <= node.val && node.val <= R{
                sum += node.val
            }
            
            if let left = node.left, L < node.val {
                stack.append(left)
            }
            
            if let right = node.right, node.val < R {
                stack.append(right)
            }
        }
        return sum
    }

}

// MARK: -  二叉搜索树的第k大节点
/// https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof/
extension Solution {
    
    // Tips 中序遍历是递增序列
    // 根据以上性质，易得二叉搜索树的“中序遍历倒序”为 递减序列 。
    
    // 二叉搜索树的第k大节点
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var value = -1
        var count = k
        
        func rec(_ root: TreeNode?) {
            guard let tree = root else { return }
            rec(tree.right)
            if count == 0 { return }
            count -= 1
            if count == 0 { value = tree.val }
            rec(tree.left)
        }
        
        rec(root)
        return value
    }

}
