//
//  MinimumSizeSubarraySum.swift
//  LeetCode_
//
//  Created by 曹雪莹 on 2019/1/2.
//
//	https://leetcode-cn.com/problems/minimum-size-subarray-sum/

/*
给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组。如果不存在符合条件的连续子数组，返回 0。

示例:

输入: s = 7, nums = [2,3,1,2,4,3]
输出: 2
解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
进阶:

如果你已经完成了O(n) 时间复杂度的解法, 请尝试 O(n log n) 时间复杂度的解法。
*/

import Foundation

extension Solution {
	//	O(n)
	func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
		
		if nums.isEmpty {
			return 0
		}
		var left = 0, right = 0, sum = 0, count = nums.count, res = count + 1
		
		while right < count {
			while sum < s && right < count {
				sum += nums[right]
				right += 1
			}
			while sum >= s {
				res = min(res, right - left)
				sum -= nums[left]
				left += 1
			}
		}
		
		return res == count + 1 ? 0 : res
	}
}
