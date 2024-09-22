import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [input[0], input[1]] + Array(repeating: 0, count: 8)

for i in 2..<10 {
    dp[i] = dp[i - 1] + 2 * dp[i - 2]
}

print(dp.map { String($0) }.joined(separator: " "))