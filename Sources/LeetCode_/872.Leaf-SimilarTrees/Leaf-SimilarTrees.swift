//
//  File.swift
//  LeetCode_
//
//  Created by 曹雪莹 on 2018/12/26.
//
//	https://leetcode.com/problems/leaf-similar-trees/

import Foundation

public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init(_ val: Int) {
		self.val = val
		self.left = nil
		self.right = nil
	}
}

extension Solution {
	func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
		
		if root1 == nil {
			if root2 == nil {
				return true
			}
			return false
		}
		
		var roots1: [Int] = [], roots2: [Int] = []
		
		traversingBTree(root1!, roots: &roots1)
		traversingBTree(root2!, roots: &roots2)
		
		guard roots1.count == roots2.count else {
			return false
		}
		
		for index in 0..<roots1.count {
			if roots1[index] != roots2[index] {
				return false
			}
		}
		
		return true
	}
	
	func traversingBTree(_ root: TreeNode, roots: inout [Int]) {
		
		if root.left == nil && root.right == nil {
			roots.append(root.val)
			return ;
		}
		if let left = root.left {
			traversingBTree(left, roots: &roots)
		}
		
		if let right = root.right {
			traversingBTree(right, roots: &roots)
		}
	}
}
