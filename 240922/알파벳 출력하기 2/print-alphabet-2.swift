import Foundation

let n = Int(readLine()!)!
var cnt = 65

for i in stride(from: n, to: 0, by: -1) {
    var tmp = Array(repeating: " ", count: n - i)

    for _ in 0..<i {
        tmp.append(String(Character(UnicodeScalar(cnt)!)))
        cnt += 1

        if cnt > 90 {
            cnt = 65
        }
    }

    print(tmp.joined(separator: " "))
}