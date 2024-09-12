import Foundation

var n = Int(readLine()!)!
var i = 1
var ans = 0

while n > 1 {
    n /= i
    ans += 1
    i += 1
}

print(ans)