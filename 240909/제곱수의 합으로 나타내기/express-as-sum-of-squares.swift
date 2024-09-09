import Foundation

func solution() {
    let n = Int(readLine()!)!
    var dp = (0...n).reduce(into: [Int]()) {
        $0.append($1)
    }

    for i in 1...n {
        for j in 1...i where j * j <= i {
            dp[i] = min(dp[i], dp[i - j * j] + 1)
        }
    }

    print(dp[n])
}

solution()