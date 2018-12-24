enum Problem: String {
    case hello = "hello"
	case findUnsortedSubarray = "shortestUnsortedContinuousSubarray"
	case addDigits = "addDigits"
	case minimumMovesToEqual = "minMoves"
    case nonDecreasingArray = "nonDecreasing"
    case validPalindrome = "validPalindrome"
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
        case .nonDecreasingArray:
            print("Example: [4, 2, 3]")
            print(Solution().nonDecreasing([4, 2, 3]))
        case .validPalindrome:
            print("Example: A man, a plan, a canal: Panama")
            print(Solution().isPalindrome("A man, a plan, a canal: Panama"))
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
