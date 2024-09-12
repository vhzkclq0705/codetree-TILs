import Foundation

var n = Int(readLine()!)!
var cnt = 0

while n < 1000 {
    n = n % 2 == 0 ? n * 3 + 1 : n * 2 + 2
    cnt += 1
}

print(cnt)