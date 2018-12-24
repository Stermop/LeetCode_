//
//  NonDecreasing.swift
//  LeetCode_
//
//  Created by 韩元旭 on 2018/12/24.
//
//  https://leetcode-cn.com/problems/non-decreasing-array/

import Foundation

extension Solution {
    
    
//    给定一个长度为 n 的整数数组，你的任务是判断在最多改变 1 个元素的情况下，该数组能否变成一个非递减数列。
//
//    我们是这样定义一个非递减数列的： 对于数组中所有的 i (1 <= i < n)，满足 array[i] <= array[i + 1]。
//
//    示例 1:
//
//    输入: [4,2,3]
//    输出: True
//    解释: 你可以通过把第一个4变成1来使得它成为一个非递减数列。
//    示例 2:
//
//    输入: [4,2,1]
//    输出: False
//    解释: 你不能在只改变一个元素的情况下将其变为非递减数列。
//    说明:  n 的范围为 [1, 10,000]。
    func nonDecreasing(_ nums: [Int]) -> Bool {
        
        let count = nums.count
        if count < 3 {
            return true
        }
        
        // 核心就是找到一处 后一个元素 < 前一个元素, 找到后, 修复其中一个元素为另一个元素即可
        // 情况一: 1, 4, 2, 3 : 2 < 4, 修复 4 为 2 , 如果 2 比 再前面一个数字大, 修复 4
        // 情况二: 3, 4, 2, 5 : 2 < 4, 修复 2 为 4 , 如果 2 比 再前面一个数字小, 修复 2
        // 情况三: 4, 2, 3    : 2 < 4, 修复 4 为 2 , 如果在前面没有了. 修复 4
        var last = nums[0]
        var fixed = false
        for i in 1..<count {
            if nums[i] < last {
                
                // 修复 两次 则直接返回 false 即可
                if fixed {
                    return false
                }
                
                // 其实为了性能没必要真正修复, 只要通过 last 表示 i-1 的元素.
                // 比如上面的情况一和情况三, 我们什么都不用做, 只要记录 fixed 修复了一次, 然后接着遍历比较即可
                if i > 1 && nums[i] < nums[i-2] {
                    // 情况二, 将后一个元素修改成前一个元素.不修改原数组. 修改 last 即可
                    last = nums[i-1]
                } else {
                    // 其他情况正常比较即可
                    last = nums[i]
                }
                
                fixed = true
            } else {
                // 无需修复
                last = nums[i]
            }
        }
        
        return true
    }
    
    
    /// LeetCode 别人的答案
    func checkPossibility(_ nums: [Int]) -> Bool {
        var i = 0
        var j = nums.count - 1
        while i < j && nums[i] <= nums[i+1] {
            i += 1
        }
        while i < j && nums[j] >= nums[j-1] {
            j -= 1
        }
        let head = (i == 0)              ? Int.min : nums[i-1]
        let next = (j == nums.count - 1) ? Int.max : nums[j+1]
        
        if j - i <= 1 && (head < nums[j] || nums[i] < next) {
            return true
        } else {
            return false
        }
    }
}
