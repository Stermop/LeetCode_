enum Problem: String {
    case hello = "hello"
	case findUnsortedSubarray = "shortestUnsortedContinuousSubarray"
	case addDigits = "addDigits"
	case minimumMovesToEqual = "minMoves"
    case nonDecreasingArray = "nonDecreasing"
    case validPalindrome = "validPalindrome"
    case flippingAnImage = "flippingAnImage"
	case maximumProductOfThreeNumbers = "maximumProductOfThreeNumbers"
    case distributeCandies = "distributeCandies"
	case leafSimilarTrees = "leafSimilarTrees"
	case teemoAttacking = "teemoAttacking"
}

class Solution {
    
    class func solve(_ problem: Problem) {
        switch problem {
        case .hello:
            Solution().hello()
            break
		case .findUnsortedSubarray:
			print("Example: [1, 3, 5, 7, 2, 4, 5, 6]")
			print(Solution().findUnsortedSubarray([1, 3, 5, 7, 2, 4, 5, 6]))
			break
		case .addDigits:
			print("Example: 1234567")
			print(Solution().addDigits(1234567))
			break
		case .minimumMovesToEqual:
			print("Example: [1, 2, 3]")
			print(Solution().minMoves([1, 2, 3]))
			break
        case .nonDecreasingArray:
            print("Example: [4, 2, 3]")
            print(Solution().nonDecreasing([4, 2, 3]))
			break
        case .validPalindrome:
            print("Example: A man, a plan, a canal: Panama")
            print(Solution().isPalindrome("A man, a plan, a canal: Panama"))
			break
        case .flippingAnImage:
            print("Example: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]")
            print(Solution().flipAndInvertImage([[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]))
			break
		case .maximumProductOfThreeNumbers:
			print("Example: [1, 2, 3, 4]")
			print(Solution().maximumProduct([1, 2, 3, 4]))
			break
        case .distributeCandies:
            print("Example: [1, 1, 2, 2, 3, 3]")
            print(Solution().distributeCandies([1, 1, 2, 2, 3, 3]))
            break
		case .leafSimilarTrees:
			print("Example(前序遍历):")
			print("[3, 5, 6, 2, 7, 4, 1, 9, 8]")
			print("[3, 6, 1, 2, 7, 4, 5, 9, 8]")
			
			let val1 = TreeNode(1); let val11 = TreeNode(1)
			let val2 = TreeNode(2); let val12 = TreeNode(2)
			let val3 = TreeNode(3); let val13 = TreeNode(3)
			let val4 = TreeNode(4); let val14 = TreeNode(4)
			let val5 = TreeNode(5); let val15 = TreeNode(5)
			let val6 = TreeNode(6); let val16 = TreeNode(6)
			let val7 = TreeNode(7); let val17 = TreeNode(7)
			let val8 = TreeNode(8); let val18 = TreeNode(8)
			let val9 = TreeNode(9); let val19 = TreeNode(9)
			
			val3.left = val5; val3.right = val1
			val5.left = val6; val5.right = val2
			val2.left = val7; val2.right = val4
			val1.left = val9; val1.right = val8
			
			val13.left = val16; val13.right = val11
			val11.left = val12; val11.right = val15
			val12.left = val17; val12.right = val14
			val15.left = val19; val15.right = val18
			
			print(Solution().leafSimilar(val3, val13))
			
			break
		case .teemoAttacking:
			print("Example: [1, 4], 2")
			print(Solution().findPoisonedDuration([1, 4], 2))
			break
        }
    }
}

/**
 swift build
 swift run LeetCode_ hello
 */
if CommandLine.arguments.count == 2 {
    
    if let problem = Problem(rawValue: CommandLine.arguments[1]) {
        Solution.solve(problem)
    } else {
        print("\u{001B}[0;31mUnknown problem!")
    }
    
} else {
    print("""
    \u{001B}[0;31m
    Invalid parameters!
    Usage:
        swift run LeetCode_ `problem`
    Example:
        swift run LeetCode_ hello
    """)
}
