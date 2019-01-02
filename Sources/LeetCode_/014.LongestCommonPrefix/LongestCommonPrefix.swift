//
//  LongestCommonPrefix.swift
//  LeetCode_
//
//  Created by 韩元旭 on 2018/12/26.
//
//  https://leetcode.com/problems/longest-common-prefix/

import Foundation

extension Solution {

//    编写一个函数来查找字符串数组中的最长公共前缀。
//
//    如果不存在公共前缀，返回空字符串 ""。
//
//    示例 1:
//
//    输入: ["flower","flow","flight"]
//    输出: "fl"
//    示例 2:
//
//    输入: ["dog","racecar","car"]
//    输出: ""
//    解释: 输入不存在公共前缀。
//    说明:
//
//    所有输入只包含小写字母 a-z 。

    func longestCommonPrefix(_ strs: [String]) -> String {
        
        if strs.count == 0 {
            return ""
        } else if strs.count == 1 {
            return strs.first!
        }
        
        // 找出最短的字符串, 最长公共前缀肯定小于等于这个串
        var min = Int.max
        var prefix = ""
        for str in strs {
            if str.count < min {
                min = str.count
                prefix = str
            }
        }
        
        if prefix.count == 0 {
            return prefix
        }
        
        // 依次判断
        var index = prefix.endIndex
        for str in strs {
            while prefix.count > 0 && !str.hasPrefix(prefix) {
                // 找出当前 str 和 最短串的 最长公共前缀
                index = prefix.index(before: index)
                prefix = String(prefix[..<index])
            }
            if prefix.count == 0 {
                // 前缀不满足了
                return ""
            }
        }
        
        return prefix
    }
    
    /// LeetCode 别人做的
    func longestCommonPrefix2(_ strs: [String]) -> String {
        let count = strs.count
        if count <= 0 {
            return ""
        } else if count == 1 {
            return strs[0]
        } else {
            var prefix = strs[0]
            for i in 1..<count {
                let str_i = strs[i]
                while !str_i.hasPrefix(prefix) {
                    prefix = String(prefix.prefix(prefix.count - 1))
                    if prefix.isEmpty {
                        return ""
                    }
                }
            }
            return prefix
        }
    }
    
}
