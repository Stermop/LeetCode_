//
//  File.swift
//  LeetCode_
//
//  Created by 曹雪莹 on 2019/1/14.
//

import Foundation

extension Solution {
	
	//	超过数组长度 1/3 的数字，最多有两个
	//	遍历数组，找出数量最多的两个数字
	//	校验所找出的数字数量是否大于 1/3
	func majorityElement(_ nums: [Int]) -> [Int] {
		var res1 = 0, res2 = 0, count1 = 0, count2 = 0
		
		for num in nums {
			if num == res1 {
				count1 += 1
			} else if num == res2 {
				count2 += 1
			} else if count1 == 0 {
				res1 = num
				count1 += 1
			} else if count2 == 0 {
				res2 = num
				count2 += 1
			} else {
				count1 -= 1
				count2 -= 1
			}
		}
		
		count1 = 0
		count2 = 0
		for num in nums {
			if num == res1 {
				count1 += 1
			} else if num == res2 {
				count2 += 1
			}
		}
		
		var res = [Int]()
		
		if count1 > nums.count / 3 {
			res.append(res1)
		}
		
		if count2 > nums.count / 3 {
			res.append(res2)
		}
		
		return res
	}
}
