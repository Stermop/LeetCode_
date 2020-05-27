//
//  File.swift
//  LeetCode_
//
//  Created by 曹雪莹 on 2018/12/20.
//
//	https://leetcode.com/problems/shortest-unsorted-continuous-subarray/

import Foundation

extension Solution  {
	func findUnsortedSubarray(_ nums: [Int]) -> Int {
		/*
		1. 对数组进行生序排序
		2. 从两个方向比对
		3. 左边第一个不相同的元素为 begin index
		4. 右边第一个不相同的元素为 end index
		*/
		
		let count = nums.count
		var i = 0, j = count - 1
		
		var t = nums
		t.sort(by: <)
		while i < count && nums[i] == t[i] {
			i = i + 1
		}
		while j > i && nums[j] == t[j] {
			j = j - 1
		}
		
		return i < j ? j - i + 1 : 0
	}
	
	func findUnsortedSubarray2(_ nums: [Int]) -> Int {
		/*
		1. 例 [1, 2, 5, 3, 7, 2, 4]
		2. 将上述数组的最短子数组排序， 即对 [5, 3, 7, 2, 4] 排序，即可整个数组有序
		3. 如果排序，则需要将
			a. 最小的数字 2 向 ‘左’ 移，至 ‘左侧最后一个比 2 大的数字位置’，为 begin
			b. 最大的数字 7 向 ‘右’ 移，至 ‘右侧最后一个比 7 小的数字位置’，为 end
		4. 所以，将右侧开始最小数字向左比较，左侧开始最大数字向右比较，并记录更新 值 和 index 即可
		*/
		
		let count = nums.count
		var i = 0, begin = -1, end = -2
		var maxValue = nums[0]
		var minValue = nums[count - 1]
		
		while i < count {
			maxValue = max(maxValue, nums[i])
			minValue = min(minValue, nums[count - i - 1])
			
			if maxValue > nums[i] {
				end = i
			}
			if minValue < nums[count - i - 1] {
				begin = count - i - 1
			}
			
			i += 1
		}
		
		return end - begin + 1
	}
}


