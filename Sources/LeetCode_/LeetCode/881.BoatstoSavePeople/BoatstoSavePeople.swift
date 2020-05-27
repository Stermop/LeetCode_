//
//  File.swift
//  LeetCode_
//
//  Created by 曹雪莹 on 2019/1/8.
//	https://leetcode.com/problems/boats-to-save-people/

import Foundation

/*
第 i 个人的体重为 people[i]，每艘船可以承载的最大重量为 limit。

每艘船最多可同时载两人，但条件是这些人的重量之和最多为 limit。

返回载到每一个人所需的最小船数。(保证每个人都能被船载)。



示例 1：

输入：people = [3,5,3,4], limit = 5
输出：4
解释：4 艘船分别载 (3), (3), (4), (5)
*/

extension Solution {
	func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
		let sortPeople = people.sorted()
		var begin = 0, end = people.count - 1
		var total = 0
		
		//	最轻的和最重的乘一艘，如果不行，最重的单独乘一艘
		
		while begin <= end {
			total += 1
			if sortPeople[begin] + sortPeople[end] <= limit {
				begin += 1
			}
			end -= 1
		}
		
		return total
	}
}
