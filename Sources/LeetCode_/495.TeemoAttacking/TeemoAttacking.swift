//
//  495. Teemo Attacking.swift
//  LeetCode_
//
//  Created by 曹雪莹 on 2018/12/27.
//
//	https://leetcode-cn.com/problems/teemo-attacking/

import Foundation

extension Solution {
	func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
		
		if timeSeries.isEmpty {
			return 0
		}
		
		var poisonedDuration = 0
		
		for index in 1..<timeSeries.count {
			let diff = timeSeries[index] - timeSeries[index - 1]
			poisonedDuration += diff > duration ? duration : diff
		}
		
		return poisonedDuration + duration
	}
}
