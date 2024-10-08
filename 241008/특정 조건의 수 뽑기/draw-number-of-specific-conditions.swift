import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var ans1 = 200
var ans2 = 200
var tmp = 200

nums.forEach {
    if abs(100 - $0) < tmp {
        tmp = abs(100 - $0)
        ans1 = $0
    }
    if $0 >= 100 {
        ans2 = min(ans2, $0)
    }
}

print(ans1, ans2 == 200 ? -1 : ans2)