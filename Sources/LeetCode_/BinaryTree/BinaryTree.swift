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


// MARK: - 二叉树的坡度
/// https://leetcode-cn.com/problems/binary-tree-tilt/
extension Solution {
    
    // 一个树的节点的坡度定义即为，该节点左子树的结点之和和右子树结点之和的差的绝对值。空结点的的坡度是0。
    // 整个树的坡度就是其所有节点的坡度之和。
    
    /// 二叉树的坡度
    func findTilt(_ root: TreeNode?) -> Int {
        
        // 求和
        func sum(_ root: TreeNode?) -> Int {
            guard let tree = root else { return 0 }
            return tree.val + sum(tree.left) + sum(tree.right)
        }
        
        // 坡度 = 当前节点的坡度 + 左子节点的坡度 + 右子节点的坡度
        guard let tree = root else { return 0 }
        return abs(sum(tree.left) - sum(tree.right)) + findTilt(tree.left) + findTilt(tree.right)
    }
    
    /// 二叉树的坡度
    func findTilt_LeetCode(_ root: TreeNode?) -> Int {
        var tilt = 0
        // 求和的过程中把坡度进行累加
        @discardableResult
        func traverse(_ root: TreeNode?) -> Int {
            guard let tree = root else { return 0 }
            let left = traverse(tree.left)
            let right = traverse(tree.right)
            tilt += abs(left - right)           // - 精髓
            return left + right + tree.val
        }
        traverse(root)
        return tilt
    }
    
}


// MARK: - 二叉树的直径
/// https://leetcode-cn.com/problems/diameter-of-binary-tree/
extension Solution {
    
    /// 二叉树的直径
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        
        // 这个递归只是为了求深度, 在求深度的过程中, 去找出最大的直径:(左子树的高度 + 右子树的高度 的最大值)
        @discardableResult
        func recMax(_ root: TreeNode?) -> Int {
            guard let tree = root else { return 0 }
            let left = recMax(tree.left)
            let right = recMax(tree.right)
            diameter = max(diameter, left + right)
            return max(left, right) + 1
        }
        
        recMax(root)
        return diameter
    }
    
}

// MARK: - 最大二叉树
/// https://leetcode-cn.com/problems/maximum-binary-tree/
extension Solution {
    
//    二叉树的根是数组中的最大元素。
//    左子树是通过数组中最大值左边部分构造出的最大二叉树。
//    右子树是通过数组中最大值右边部分构造出的最大二叉树。
    
    /// 最大二叉树
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        var maxIndex = 0
        var maxValue = nums[maxIndex]
        nums.enumerated().forEach {
            if $0.element > maxValue {
                maxValue = $0.element
                maxIndex = $0.offset
            }
        }
        let node = TreeNode(maxValue)
        node.left  = constructMaximumBinaryTree(Array(nums[0..<maxIndex]))
        node.right = constructMaximumBinaryTree(Array(nums[maxIndex+1..<nums.count]))
        return node
    }
    
    /// 最大二叉树
    func constructMaximumBinaryTree_LeetCode(_ nums: [Int]) -> TreeNode? {

        func constructMaximumBinaryTree(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
            if start > end { return nil }

            var maxIndex = start
            for i in start...end {
                if nums[maxIndex] < nums[i] {
                    maxIndex = i
                }
            }

            let root = TreeNode(nums[maxIndex])
            root.left = constructMaximumBinaryTree(nums, start, maxIndex - 1)
            root.right = constructMaximumBinaryTree(nums, maxIndex + 1, end)
            return root
        }

        return constructMaximumBinaryTree(nums, 0, nums.count - 1)
    }
    
}

// MARK: - 二叉树的堂兄弟节点
/// https://leetcode-cn.com/problems/cousins-in-binary-tree/
extension Solution {
    
    // 如果二叉树的两个节点深度相同，但父节点不同，则它们是一对堂兄弟节点。
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var depthDict: [Int : Int] = [:]
        var parentDict: [Int : Int] = [:]
        
        func rec(_ root: TreeNode?, _ parent: TreeNode?) {
            guard let tree = root else { return }
            
            let parentVal = parent?.val ?? -1
            let depth = depthDict[parentVal] ?? -1
            
            depthDict[tree.val]  = depth + 1
            parentDict[tree.val] = parentVal
            
            rec(tree.left, tree)
            rec(tree.right, tree)
        }
        
        rec(root, nil)
        return depthDict[x] == depthDict[y] && parentDict[x] != parentDict[y]
    }
    
}
