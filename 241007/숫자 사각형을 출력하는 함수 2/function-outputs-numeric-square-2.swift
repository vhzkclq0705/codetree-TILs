import Foundation

let n = Int(readLine()!)!

for i in 1...n {
    var dp = Array(repeating: i, count: n)

    for j in 1..<n {
        dp[j] = dp[j - 1] * 2
    }

    print(dp.map { String($0) }.joined(separator: " "))
}