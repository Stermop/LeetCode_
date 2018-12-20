enum Problem: String {
    case hello = "hello"
	case findUnsortedSubarray = "shortestUnsortedContinuousSubarray"
}

class Solution {
    
    class func solve(_ problem: Problem) {
        switch problem {
        case .hello:
            Solution().hello()
            break
		case .findUnsortedSubarray :
			print("Example: [1, 3, 5, 7, 2, 4, 5, 6]")
			print(Solution().findUnsortedSubarray([1, 3, 5, 7, 2, 4, 5, 6]))
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
