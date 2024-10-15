import Foundation

func dfs(_ idx: Int, _ p: Int, _ s: Int, _ m: Int, _ sum: Int) {
    if idx == n {
        maxValue = max(maxValue, sum)
        minValue = min(minValue, sum)

        return
    }

    if p > 0 {
        dfs(idx + 1, p - 1, s, m, sum + nums[idx])
    }
    if s > 0 {
        dfs(idx + 1, p, s - 1, m, sum - nums[idx])
    }
    if m > 0 {
        dfs(idx + 1, p, s, m - 1, sum * nums[idx])
    }

    return
}

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var ops = readLine()!.split(separator: " ").map { Int($0)! }
var maxValue = Int.min
var minValue = Int.max

dfs(1, ops[0], ops[1], ops[2], nums[0])

print(minValue, maxValue)