//
//  File.swift
//  LeetCode_
//
//  Created by 曹雪莹 on 2018/12/20.
//
//	https://leetcode.com/problems/add-digits/

import Foundation

extension Solution {
	
	/*
	循环相加各位数字，直到相加结果为个位数
	*/
	
	func addDigits(_ num: Int) -> Int {
		var resultAry: [Int] = [], value = num
		
		while value >= 10 {
			resultAry = intToAry(value)
			value = 0
			for n in resultAry {
				value += n
			}
		}
		
		return value
	}
	
	func intToAry(_ num: Int) -> [Int] {
		var numAry: [Int] = [], mutableNum = num
		
		while mutableNum != 0 {
			numAry.append(mutableNum % 10)
			mutableNum /= 10
		}
		
		return numAry.reversed()
	}
	
	
	func addDigits2(_ num: Int) -> Int {
		
		/*
		这里有一个数学公式可以直接得出结果
		*/
		
		if (num == 0) {
			return 0;
		}
		return (num - 1) % 9 + 1 ;
	}
}
