//
//  MaximumProductOfThreeNumbers.swift
//  LeetCode_
//
//  Created by 曹雪莹 on 2018/12/25.
//
//  https://leetcode.com/problems/maximum-product-of-three-numbers/

import Foundation

/*
给定一个整型数组，在数组中找出由三个数组成的最大乘积，并输出这个乘积。

示例 1:

输入: [1,2,3]
输出: 6
示例 2:

输入: [1,2,3,4]
输出: 24
注意:

给定的整型数组长度范围是[3,104]，数组中所有的元素范围是[-1000, 1000]。
输入的数组中任意三个数的乘积不会超出32位有符号整数的范围。
*/

extension Solution {
	func maximumProduct(_ nums: [Int]) -> Int {
		let n = nums.count
		let sortedNums = nums.sorted(by: <)
		
		return max(sortedNums[0] * sortedNums[1] * sortedNums[n - 1], sortedNums[n - 1] * sortedNums[n - 2] * sortedNums[ n - 3])
	}
}
