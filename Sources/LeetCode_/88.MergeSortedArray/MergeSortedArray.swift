//
//  MergeSortedArray.swift
//  LeetCode_
//
//  Created by 曹雪莹 on 2018/12/28.
//
//	https://leetcode-cn.com/problems/merge-sorted-array/

/*
给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。

说明:

初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
示例:

输入:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

输出: [1,2,2,3,5,6]
*/

import Foundation

extension Solution {
	//	依次按序添加两个数组中的元素
	func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
		
		if m <= 0 && n <= 0 {
			return
		}
		
		var a = 0, b = 0
		var nums3: [Int] = []
		for _ in 0..<(m + n) {
			if a < m && b < n {
				if nums1[a] < nums2[b] {
					nums3.append(nums1[a])
					a += 1
				} else {
					nums3.append(nums2[b])
					b += 1
				}
			} else if a < m && b >= n {
				nums3.append(nums1[a])
				a += 1
			} else if a >= m && b < n {
				nums3.append(nums2[b])
				b += 1
			}
		}
		
		nums1 = nums3
	}
	
	//	从尾部开始填充，避免覆盖
	//	一次比较两个数组元素，较大元素放置尾部
	func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
		var i = m - 1, j = n - 1
		
		while i >= 0 || j >= 0 {
			if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
				nums1[i + j + 1] = nums1[i]
				i -= 1
			} else {
				nums1[i + j + 1] = nums2[j]
				j -= 1
			}
		}
	}
}

