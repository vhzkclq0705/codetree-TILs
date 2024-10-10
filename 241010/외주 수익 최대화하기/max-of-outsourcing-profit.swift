import Foundation

let n = Int(readLine()!)!
var e = Array(repeating: 0, count: n + 1)
var p = Array(repeating: 0, count: n + 1)
var dp = Array(repeating: 0, count: n + 1)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    e[i] = input[0] + i - 1
    p[i] = input[1]
}

for i in 1...n where e[i] <= n {
    dp[i] = max(dp[i], p[i])

    for j in 1..<i where e[j] < i {
        dp[i] = max(dp[i], dp[j] + p[i])
    }
}

print(dp.max() ?? 0)