//
//  MinimumMovesToEqual.swift
//  LeetCode_
//
//  Created by 韩元旭 on 2018/12/23.
//
//	https://leetcode.com/problems/minimum-moves-to-equal-array-elements/


import Foundation

extension Solution {
	
//	给定一个长度为 n 的非空整数数组，找到让数组所有元素相等的最小移动次数。每次移动可以使 n - 1 个元素增加 1。
//
//	示例:
//
//	输入:
//	[1,2,3]
//
//	输出:
//	3
//
//	解释:
//	只需要3次移动（注意每次移动会增加两个元素的值）：
//
//	[1,2,3]  =>  [2,3,3]  =>  [3,4,3]  =>  [4,4,4]

	func minMoves(_ nums: [Int]) -> Int {
		
//		var seq   = nums
//		var count = 0
//		while Set(seq).count > 1 {
//			var max = -1
//			var maxIndex = 0
//			var index = 0
//			seq = seq.map {
//				if $0 > max {
//					max = $0
//					maxIndex = index
//				}
//				index += 1
//				return $0 + 1
//			}
//
//			seq[maxIndex] -= 1
//			count += 1
// 		}
//
//		return count
		
		var sum = 0
		var min = nums[0]
		
		nums.forEach {
			sum += $0
			if $0 < min {
				min = $0
			}
		}
		
		return sum - min * nums.count
	}
	
}
