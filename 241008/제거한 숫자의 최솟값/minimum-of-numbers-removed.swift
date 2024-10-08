import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var m = 0

for i in 0..<n / 2 {
    m = max(m, nums[i] + nums[n - i - 1])
}
if n % 2 == 1 {
    m = max(m, nums[n / 2])
}

print(m)