import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var (l, r) = (0, n - 1)
var ans = arr[r] - arr[l]

while l < r {
    if arr[r - 1] - arr[l] < arr[r] - arr[l + 1] {
        r -= 1
    }
    else {
        l += 1
    }

    if l == r {
        break
    }

    ans = min(ans, arr[r] - arr[l])
}

print(ans)