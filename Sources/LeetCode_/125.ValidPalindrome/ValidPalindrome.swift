//
//  125.ValidPalindrome.swift
//  LeetCode_
//
//  Created by 韩元旭 on 2018/12/24.
//
//  https://leetcode-cn.com/problems/valid-palindrome/

import Foundation

extension Solution {

//    给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
//
//    说明：本题中，我们将空字符串定义为有效的回文串。
//
//    示例 1:
//
//    输入: "A man, a plan, a canal: Panama"
//    输出: true
//    示例 2:
//
//    输入: "race a car"
//    输出: false
    func isPalindrome(_ s: String) -> Bool {
        
        // 偷懒直接转换小写并且去掉非法字符
        let a  = Character("a").unicodeScalars.first!.value
        let z  = Character("z").unicodeScalars.first!.value
        let n0 = Character("0").unicodeScalars.first!.value
        let n9 = Character("9").unicodeScalars.first!.value
        let str = s.lowercased().unicodeScalars.compactMap { (($0.value >= a && $0.value <= z) || ($0.value >= n0 && $0.value <= n9))  ? $0.value : nil }
        
        if str.count <= 1 {
            return true
        }
        
        var i = 0
        var j = str.count - 1
        
        // 两侧开始比较
        while i < j {
            if str[i] != str[j] {
                return false
            }
            i += 1
            j -= 1
        }
        
        return true
    }
    
    /// LeetCode 别人的提交
    func isPalindrome2(_ s: String) -> Bool {
        if s.count == 0 {
            return true
        }
        
        var chas = s.cString(using:.ascii)!
        
        var left = 0
        var right = s.count - 1
        
        var loop = true
        
        while loop {
            if left > right {
                loop = false
                break
            }
            
            let leftChar = chas[left]
            
            if !checkIsNormalChar(leftChar) {
                left = left + 1
                continue
            }
            
            let rightChar = chas[right]
            
            if !checkIsNormalChar(rightChar) {
                right = right - 1
                continue
            }
            
            if isEqual(leftChar,rightChar) {
                left = left + 1
                right = right - 1
            } else {
                return false
            }
            
        }
        return true
    }
    
    func isEqual(_ c:CChar, _ other:CChar) -> Bool {
        if c == other {
            return true
        }
        var newC = c
        if c >= 97 {
            newC = c - 32;
        }
        
        var newOther = other
        
        if other >= 97 {
            newOther = other - 32
        }
        
        return newC == newOther
    }
    
    func checkIsNormalChar(_ c: CChar) -> Bool {
        if c < 48 {
            return false
        }
        
        if c > 122 {
            return false
        }
        
        if c > 57 && c < 65 {
            return false
        }
        
        if c > 90 && c < 97 {
            return false
        }
        
        return true
    }
    
}
