import Foundation

let a = readLine()!
let b = readLine()!
var ans = 0

for i in 0...(a.count - b.count) {
    let start = a.index(a.startIndex, offsetBy: i)
    let end = a.index(start, offsetBy: b.count)
    let range = start..<end

    if String(a[range]) == b {
        ans += 1
    }
}

print(ans)